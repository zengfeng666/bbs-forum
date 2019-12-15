package cn.ncu.dao;

import cn.ncu.domain.Floor;
import cn.ncu.domain.Question;
import cn.ncu.domain.QuestionFloor;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Repository
public interface QuestionDao {

    /**
     * 查找问题，并且包括问题下的所有楼层信息
     * @param qid
     * @return
     */
    @Select("select * from question where qid = #{qid}")
    @Results(value = {
            @Result(id = true, column = "qid", property = "qid"),
            @Result(column = "uid", property = "uid"),
            @Result(column = "ask_time", property = "askTime"),
            @Result(column = "title", property = "title"),
            @Result(column = "content", property = "content"),
            @Result(column = "current_floor", property = "currentFloor"),
            @Result(column = "credit", property = "credit"),
            @Result(column = "is_resolved", property = "isResolved"),
            @Result(property = "floors", column = "qid",
                    many = @Many(select = "cn.ncu.dao.QuestionDao.findFloorsByQid", fetchType = FetchType.LAZY))

    })
    Question findByQid(Integer qid);


    @Select("select * from question order by ask_time desc")
    @Results(id = "questionMap", value = {
            @Result(id = true, column = "qid", property = "qid"),
            @Result(column = "uid", property = "uid"),
            @Result(column = "ask_time", property = "askTime"),
            @Result(column = "title", property = "title"),
            @Result(column = "content", property = "content"),
            @Result(column = "current_floor", property = "currentFloor"),
            @Result(column = "credit", property = "credit"),
            @Result(column = "is_resolved", property = "isResolved")
    })
    List<Question> findAll();

    @Insert("insert into question values(null,#{uid},#{askTime},#{title},#{content},#{currentFloor},#{credit},0)")
    @Options(useGeneratedKeys = true, keyProperty = "qid", keyColumn = "qid")
    void addQuestion(Question question);

    @Insert("insert into question_floor values(#{qid},#{fid},#{uid},#{replyTime},#{content},#{isAccept})")
    void addQuestionFloor(QuestionFloor questionFloor);


    /**
     * 查找该问题下的所有楼层信息
     * @param qid
     * @return
     */
    @Select("SELECT qid, fid, user.uid uid, reply_time, content, is_accept, " +
            "username, nickname, `password`, email, credit, photo,tel,sex,description,job,company,`exp`,rank " +
            "FROM question_floor, user " +
            "WHERE question_floor.qid = #{qid} and question_floor.uid = user.uid ORDER BY fid ASC")
    @Results(id = "floorMap", value = {
            @Result(column = "uid", property = "uid"),
            @Result(column = "reply_time", property = "replyTime"),
            @Result(column = "is_accept", property = "isAccept")
    })
    List<Floor> findFloorsByQid(Integer qid);


    /**
     * 更新更问题的楼层数
     * @param qid
     * @param currentFloor
     */
    @Update("update question set current_floor = #{currentFloor} where qid = #{qid}")
    void updateCurrentFloor(@Param("qid") Integer qid, @Param("currentFloor") Integer currentFloor);


    /**
     * 查找用户提出的问题
     * @param uid
     * @return
     */
    @Select("select * from question where uid = #{uid} order by ask_time desc")
    @ResultMap("questionMap")
    List<Question> findQuestionAskedByUser(Integer uid);


    /**
     * 查找用户回复的问题, 1楼是用户提出的问题，所以fid不能为1
     * 这里使用了DISTINCT，因为同一用户可能多次回复同一个问题
     * 如果不用DISTINCT关键字，则会重复显示同一个问题
     * @param uid
     * @return
     */
    @Select("SELECT DISTINCT question.qid qid, question.uid uid, " +
            "question.ask_time, question.title, question.content, " +
            "question.current_floor, question.credit, question.is_resolved " +
            "FROM question, question_floor " +
            "WHERE question.qid = question_floor.qid " +
            "AND question_floor.uid = #{uid} " +
            "AND question_floor.fid != 1 ORDER BY question.ask_time desc")
    @ResultMap("questionMap")
    List<Question> findQuestionRepliedByUser(Integer uid);


    @Update("update question set is_resolved = 1 where qid = #{qid}")
    void updateQuestionStatus(Integer qid);


    /**
     * 将楼层置为已采纳状态
     * @param qid 问题id
     * @param fid 楼层号
     */
    @Update("update question_floor set is_accept = 1 where qid = #{qid} and fid = #{fid}")
    void updateFloorStatus(@Param("qid") Integer qid, @Param("fid") Integer fid);

    /**
     * 删除问题(内部是级联删除)
     * @param qid
     */
    @Delete("delete from question where qid = #{qid}")
    void deleteQuestion(Integer qid);

    /**
     * 删除某一楼
     * @param qid
     * @param fid
     */
    @Delete("delete from question_floor where qid = #{qid} and fid = #{fid}")
    void deleteQuestionFloor(@Param("qid") Integer qid, @Param("fid") Integer fid);
}
