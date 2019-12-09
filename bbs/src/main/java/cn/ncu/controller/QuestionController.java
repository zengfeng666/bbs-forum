package cn.ncu.controller;

import cn.ncu.domain.Floor;
import cn.ncu.domain.Question;
import cn.ncu.domain.QuestionFloor;
import cn.ncu.domain.QuestionUser;
import cn.ncu.domain.User;
import cn.ncu.service.QuestionService;
import cn.ncu.service.UserService;
import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("/question")
public class QuestionController {

    @Autowired
    private QuestionService questionService;
    @Autowired
    private UserService userService;

    @RequestMapping("/findAll")
    public String findAll(Model model) {
        List<Question> questions = questionService.findAll();
        model.addAttribute("questions", questions);
        return "question_list";
    }

    @RequestMapping("/add")
    public String add(Question question, HttpSession session, Model model) {
        User user = (User) session.getAttribute("USER_SESSION");
        // 如果当前积分小于提问积分
        if (user.getCredit() < question.getCredit()) {
            model.addAttribute("msg", "积分不足!");
            return "question_add_fail";
        }
        // 获取当前时间
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        question.setAskTime(currentTime);
        question.setUid(user.getUid());
        question.setCurrentFloor(1);    // 当前楼层数是1
        questionService.addQuestion(question);
        int qid = question.getQid();

        QuestionFloor questionFloor = new QuestionFloor();
        questionFloor.setQid(qid);
        // 将问题当前楼层数置为楼层号
        questionFloor.setFid(question.getCurrentFloor());
        questionFloor.setUid(question.getUid());
        questionFloor.setReplyTime(currentTime);
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
        user.setCredit(user.getCredit() - question.getCredit());
        userService.updateCredit(user);

        return "question_add_success";
    }


    /**
     * 查看所有问题
     *
     * @param qid
     * @param model
     * @return
     */
    @RequestMapping("/look")
    public String look(Integer qid, Model model) {
        // 找到该问题的内容和楼层信息
        Question question = questionService.findByQid(qid);
        model.addAttribute("question", question);
        return "question_floor_look";
    }

    @RequestMapping("/answer")
    public String answer(Integer qid, Integer currentFloor, String content, HttpSession session, Model model) {
        User user = (User) session.getAttribute("USER_SESSION");
        int uid = user.getUid();
        // 更新question表中该问题的当前楼层数
        questionService.updateCurrentFloor(qid, currentFloor + 1);

        QuestionFloor questionFloor = new QuestionFloor();
        questionFloor.setQid(qid);
        questionFloor.setFid(currentFloor + 1);
        questionFloor.setUid(uid);
        Timestamp time = new Timestamp(System.currentTimeMillis());
        questionFloor.setReplyTime(time);
        questionFloor.setContent(content);
        questionService.addQuestionFloor(questionFloor);

        QuestionUser questionUser = new QuestionUser();
        // 0代表回复，1代表发布
        questionUser.setAction(0);
        questionUser.setQid(qid);
        questionUser.setUid(uid);

        try {
            // 此处当同一个人多次回复同一个问题的时候，会反复插入主键
            questionService.addQuestionUser(questionUser);
        } catch (Exception e) {
        }

        model.addAttribute("qid", qid);
        return "question_answer_success";
    }

}
