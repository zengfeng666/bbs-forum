package cn.ncu.service.Impl;


import cn.ncu.dao.QuestionDao;
import cn.ncu.domain.Floor;
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

    /**
     * 查找该问题内容，包括所有楼层
     * @param qid
     * @return
     */
    @Override
    public Question findByQid(Integer qid){
        return questionDao.findByQid(qid);
    }

    @Override
    public void updateCurrentFloor(Integer qid, Integer currentFloor){
        questionDao.updateCurrentFloor(qid, currentFloor);
    }

    /**
     * 查找用户提出的问题
     * @param uid
     * @return
     */
    @Override
    public List<Question> findQuestionAskedByUser(Integer uid) {
        return questionDao.findQuestionAskedByUser(uid);
    }

    /**
     * 查找用户回复的问题
     * @param uid
     * @return
     */
    @Override
    public List<Question> findQuestionRepliedByUser(Integer uid) {
        return questionDao.findQuestionRepliedByUser(uid);
    }


}

