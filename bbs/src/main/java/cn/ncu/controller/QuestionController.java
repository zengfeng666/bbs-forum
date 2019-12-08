package cn.ncu.controller;

import cn.ncu.domain.Question;
import cn.ncu.domain.QuestionFloor;
import cn.ncu.domain.QuestionUser;
import cn.ncu.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/question")
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @RequestMapping("/findAllQuestion")
    public String findAll(Model model){
        List<Question> questions = questionService.findAll();
        System.out.println(questions.get(0).getPostTime());
        model.addAttribute("questions", questions);
        return "list-all-questions";
    }

    @RequestMapping("/addQuestion")
    public String add(Question question){
        question.setUid(1); // 先假设用户id是1
        question.setCurrentFloor(1);    // 当前楼层数是1
        questionService.addQuestion(question);
        int qid = question.getQid();

        QuestionFloor questionFloor = new QuestionFloor();
        questionFloor.setQid(qid);

        // 将问题当前楼层数置为楼层号
        questionFloor.setFid(question.getCurrentFloor());
        questionFloor.setUid(question.getUid());
        questionFloor.setContent(question.getContent());
        questionFloor.setIsAccept(0);
        questionService.addQuestionFloor(questionFloor);

        QuestionUser questionUser = new QuestionUser();
        questionUser.setQid(qid);
        questionUser.setUid(question.getUid());
        // 1代表发布，0代表回复
        questionUser.setAction(1);
        questionService.addQuestionUser(questionUser);

        // 扣除个人积分


        return "addQuestion-success";
    }

}
