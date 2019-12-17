package cn.ncu.controller;

import cn.ncu.domain.Question;
import cn.ncu.domain.QuestionFloor;
import cn.ncu.domain.User;
import cn.ncu.service.QuestionService;
import cn.ncu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
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


    /**
     * 查看所有问题
     *
     * @param model
     * @return
     */
    @RequestMapping("/findAll")
    public String findAll(Model model) {
        List<Question> questions = questionService.findAll();
        model.addAttribute("questions", questions);
        return "question_list";
    }


    /**
     * 提出一个问题
     *
     * @param question
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/add")
    public String add(Question question, HttpSession session, Model model) {
        User user = (User) session.getAttribute("USER_SESSION");
        // 如果当前积分小于提问积分
        if (user.getCredit() < question.getCredit()) {
            model.addAttribute("msg", "积分不足!");
            // 信息回显
            model.addAttribute("question", question);
            return "forward:/WEB-INF/pages/question_ask.jsp";
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

        // 扣除个人积分
        userService.addCredit(user.getUid(), -question.getCredit());

        User userNew = userService.findUserById(user.getUid());
        session.setAttribute("USER_SESSION", userNew);

        return "redirect:findAll";
    }


    /**
     * 查看问题的楼层信息
     *
     * @param qid
     * @param model
     * @return
     */
    @RequestMapping("/look")
    public String look(@RequestParam("qid") Integer qid, Model model) {
        // 找到该问题的内容和楼层信息
        Question question = questionService.findByQid(qid);
        model.addAttribute("question", question);
        return "question_floor_look";
    }


    /**
     * 回复问题
     *
     * @param qid
     * @param currentFloor
     * @param content
     * @param session
     * @param model
     * @return
     */
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

        return "redirect:look?qid=" + qid;
    }


    /**
     * 采纳回答
     *
     * @param qid    问题id
     * @param uid    被采纳者id
     * @param credit 问题悬赏积分
     * @return
     */
    @RequestMapping("/accept")
    public String accept(Integer qid, Integer uid, Integer fid, Integer credit, HttpServletRequest request) {
        // 增加被采纳者的积分
        userService.addCredit(uid, credit);
        // 将问题置为已解决
        questionService.updateStatus(qid, fid);

        return "redirect:look?qid=" + qid;
    }

}
