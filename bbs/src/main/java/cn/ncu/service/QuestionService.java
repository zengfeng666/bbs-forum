package cn.ncu.service;

import cn.ncu.domain.Question;
import cn.ncu.domain.QuestionFloor;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QuestionService {


    void addQuestion(Question question);

    void addQuestionFloor(QuestionFloor questionFloor);

    List<Question> findAll();

    Question findByQid(Integer qid);

    void updateCurrentFloor(Integer qid, Integer currentFloor);

    List<Question> findQuestionAskedByUser(Integer uid);

    List<Question> findQuestionRepliedByUser(Integer uid);

    /**
     * 将问题的状态置为已解决，同时将该楼层采纳
     * @param qid 问题号
     * @param fid 楼层号
     */
    void updateStatus(Integer qid, Integer fid);

    /**
     * 删除问题(内部是级联删除)
     * @param qid 问题号
     */
    void deleteQuestion(Integer qid);


    /**
     * 删除某一楼
     * @param qid
     * @param fid
     */
    @Delete("delete from question_floor where qid = #{qid} and fid = #{fid}")
    void deleteQuestionFloor(@Param("qid") Integer qid, @Param("fid") Integer fid);
}
