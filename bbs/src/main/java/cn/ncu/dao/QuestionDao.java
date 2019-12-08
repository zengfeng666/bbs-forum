package cn.ncu.dao;

import cn.ncu.domain.Question;
import cn.ncu.domain.QuestionFloor;
import cn.ncu.domain.QuestionUser;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionDao {

    @Select("select * from question")
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

    @Insert("insert into question values(null,#{uid},null,#{title},#{content},#{currentFloor},#{credit})")
    @ResultMap("questionMap")
    @Options(useGeneratedKeys = true, keyProperty = "qid", keyColumn = "qid")
    void addQuestion(Question question);

    @Insert("insert into question_floor values(#{qid},#{fid},#{uid},#{replyTime},#{content},#{isAccept})")
    @Results(id = "questionFloorMap", value = {
            @Result(id = true, column = "qid", property = "qid"),
            @Result(id = true, column = "fid", property = "fid"),
            @Result(column = "uid", property = "uid"),
            @Result(column = "reply_time", property = "replyTime"),
            @Result(column = "content", property = "content"),
            @Result(column = "is_accept", property = "isAccept")
    })
    void addQuestionFloor(QuestionFloor questionFloor);


    @Insert("insert into question_user values(#{qid},#{uid},#{action})")
    @Results(id = "questionUserMap", value = {
            @Result(id = true, column = "qid", property = "qid"),
            @Result(id = true, column = "uid", property = "uid"),
            @Result(column = "action", property = "action")
    })
    void addQuestionUser(QuestionUser questionUser);


}
