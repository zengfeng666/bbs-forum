package cn.ncu.dao;

import cn.ncu.domain.Floor;
import cn.ncu.domain.Question;
import cn.ncu.domain.QuestionFloor;
import cn.ncu.domain.QuestionUser;
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
            @Result(column = "post_time", property = "postTime"),
            @Result(column = "title", property = "title"),
            @Result(column = "content", property = "content"),
            @Result(column = "current_floor", property = "currentFloor"),
            @Result(column = "credit", property = "credit"),
            @Result(property = "floors", column = "qid",
                    many = @Many(select = "cn.ncu.dao.QuestionDao.findFloorsByQid", fetchType = FetchType.LAZY))

    })
    Question findByQid(Integer qid);


    @Select("select * from question order by post_time desc")
    @Results(id = "questionMap", value = {
            @Result(id = true, column = "qid", property = "qid"),
            @Result(column = "uid", property = "uid"),
            @Result(column = "post_time", property = "postTime"),
            @Result(column = "title", property = "title"),
            @Result(column = "content", property = "content"),
            @Result(column = "current_floor", property = "currentFloor"),
            @Result(column = "credit", property = "credit")
    })
    List<Question> findAll();

    @Insert("insert into question values(null,#{uid},#{postTime},#{title},#{content},#{currentFloor},#{credit})")
    @Options(useGeneratedKeys = true, keyProperty = "qid", keyColumn = "qid")
    void addQuestion(Question question);

    @Insert("insert into question_floor values(#{qid},#{fid},#{uid},#{replyTime},#{content},#{isAccept})")
    void addQuestionFloor(QuestionFloor questionFloor);


    @Insert("insert into question_user values(#{qid},#{uid},#{action})")
    void addQuestionUser(QuestionUser questionUser);

    /**
     * 查找该问题下的所有楼层信息
     * @param qid
     * @return
     */
    @Select("SELECT qid, fid, user.uid uid, reply_time, content, is_accept, " +
            "username, nickname, `password`, email, credit, photo,tel,sex,description,job,company,`exp`,rank " +
            "FROM question_floor, USER " +
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

}
