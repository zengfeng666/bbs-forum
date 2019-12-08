package cn.ncu.service.Impl;


import cn.ncu.dao.QuestionDao;
import cn.ncu.domain.Question;
import cn.ncu.domain.QuestionFloor;
import cn.ncu.domain.QuestionUser;
import cn.ncu.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("questionService")
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    private QuestionDao questionDao;

    @Override
    public void addQuestion(Question question) {
        questionDao.addQuestion(question);
    }

    @Override
    public void addQuestionFloor(QuestionFloor questionFloor) {
        questionDao.addQuestionFloor(questionFloor);
    }

    @Override
    public void addQuestionUser(QuestionUser questionUser) {
        questionDao.addQuestionUser(questionUser);
    }

    @Override
    public List<Question> findAll() {
        return questionDao.findAll();
    }

}

