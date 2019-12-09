package cn.ncu.service;

import cn.ncu.domain.Question;
import cn.ncu.domain.QuestionFloor;

import java.util.List;

public interface QuestionService {


    void addQuestion(Question question);

    void addQuestionFloor(QuestionFloor questionFloor);

    List<Question> findAll();

    Question findByQid(Integer qid);

    void updateCurrentFloor(Integer qid, Integer currentFloor);

    List<Question> findQuestionAskedByUser(Integer uid);

    List<Question> findQuestionRepliedByUser(Integer uid);
}
