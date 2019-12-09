package cn.ncu.service;

import cn.ncu.domain.Question;
import cn.ncu.domain.QuestionFloor;
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
}
