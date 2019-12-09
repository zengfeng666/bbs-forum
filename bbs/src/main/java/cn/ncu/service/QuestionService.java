package cn.ncu.service;

import cn.ncu.domain.Floor;
import cn.ncu.domain.Question;
import cn.ncu.domain.QuestionFloor;
import cn.ncu.domain.QuestionUser;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface QuestionService {


    void addQuestion(Question question);

    void addQuestionFloor(QuestionFloor questionFloor);

    void addQuestionUser(QuestionUser questionUser);

    List<Question> findAll();

    Question findByQid(Integer qid);

    void updateCurrentFloor(Integer qid, Integer currentFloor);

    List<Question> findQuestionAskedByUser(Integer uid);

    List<Question> findQuestionRepliedByUser(Integer uid);
}
