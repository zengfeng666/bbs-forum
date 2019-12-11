package cn.ncu.controller;

import cn.ncu.domain.Question;
import cn.ncu.domain.User;
import cn.ncu.service.QuestionService;
import cn.ncu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private QuestionService questionService;

    /**
     * 核对用户登录
     *
     * @param username
     * @param password
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(String username, String password, Model model, HttpSession session) {
        //通过账号和密码查询用户
        User user = userService.findUser(username, password);
        if (user != null) {
            //将用户对象添加到Session
            session.setAttribute("USER_SESSION", user);
            //跳转到主页面
            return "redirect:/index.jsp";
        }
        model.addAttribute("msg", "账号或密码错误，请重新输入！");
        //返回到登录页面
        return "login";
    }

    @RequestMapping(value = "/forget", method = RequestMethod.POST)
    public String forget(String email, Model model, HttpSession session) {
        //通过邮箱查询是否存在用户
        User user = userService.findEmail(email);
        if (user != null) {
            //将用户对象添加到Session
            session.setAttribute("USER_SESSION", user);
            //跳转到主页面
            return "reset";
        }
        model.addAttribute("msg", "邮箱错误，请重新输入！");
        //返回到登录页面
        return "forget";

    }


    /**
     * 注册
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(User user) {
        userService.register(user);
        return "login";
    }

    /**
     * 重置密码
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/reset", method = RequestMethod.POST)
    public String reset(User user) {
        userService.reset(user);
        return "login";
    }

    /**
     * 我的提问
     *
     * @param session
     * @param model
     * @return
     */
    @SuppressWarnings("all")
    @RequestMapping("/askQ")
    public String askQ(HttpSession session, Model model) {
        User user = (User) session.getAttribute("USER_SESSION");
        int uid = user.getUid();
        List<Question> questionsAsked = questionService.findQuestionAskedByUser(uid);
        model.addAttribute("questionsAsked", questionsAsked);

        return "question_my_asked";
    }


    /**
     * 我的回复
     *
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/replyQ")
    public String replyQ(HttpSession session, Model model) {
        User user = (User) session.getAttribute("USER_SESSION");
        int uid = user.getUid();
        List<Question> questionsReplied = questionService.findQuestionRepliedByUser(uid);
        model.addAttribute("questionsReplied", questionsReplied);

        return "question_my_replied";
    }


    /**
     * 删除提问
     *
     * @param qid
     * @return
     */
    @RequestMapping("/delQ")
    public String delQ(Integer qid) {
        questionService.deleteQuestion(qid);
        // 问题删除成功，重定向回我的提问页面
        return "redirect:askQ";
    }


    /**
     * 删除某一楼回复(自己的回复)
     *
     * @param qid
     * @param fid
     * @return
     */
    @RequestMapping("/delR")
    public String delR(Integer qid, Integer fid, HttpServletRequest request, HttpServletResponse response) {
        questionService.deleteQuestionFloor(qid, fid);
        // 注意：qid也被传入look中了
        return  "forward:/question/look";
    }

}
