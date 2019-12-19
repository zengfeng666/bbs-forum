package cn.ncu.controller;

import cn.ncu.domain.Post;
import cn.ncu.domain.Question;
import cn.ncu.domain.SecretProtection;
import cn.ncu.domain.User;
import cn.ncu.service.QuestionService;
import cn.ncu.service.UserService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private QuestionService questionService;

    /**
     * 登录
     * @param username
     * @param password
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "/login")
    public String login(String username, String password, Model model, HttpServletRequest request, HttpSession session) {
        //通过账号和密码查询用户
        User user = userService.findUser(username, password);
        if (user != null) {
            //将用户对象添加到Session
            session.setAttribute("USER_SESSION", user);
            //如果是管理员则跳转到管理员界面
            if (user.getUid() == 1) {
                return "admin";
            }

            // 获取登录之前的页面的地址
            String referer = request.getHeader("referer");
            if (referer.contains("login")){
                // 如果登录之前就在登录页面，则登录后返回到首页
                return "redirect:/index.jsp";
            }
            // 跳转回登录之前的页面
            return "redirect:" + referer;
        }
        model.addAttribute("msg", "账号或密码错误，请重新输入！");
        //返回到登录页面
        return "user_login";
    }

    /**
     * 注销
     *
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, HttpSession session) {
        session.removeAttribute("USER_SESSION");
        // 获取注销之前的页面的地址
        String referer = request.getHeader("referer");
        // 注销之后返回当前页
        return "redirect:" + referer;
    }


    @RequestMapping(value = "/forget")
    public String forget(Model model, String username) {
        //通过账号查询用户
        SecretProtection secretProtection = userService.findSecretProtection(username);
        if (secretProtection != null) {
            model.addAttribute("secretProtection", secretProtection);
            //返回密保问题界面
            return "user_secretProtection";
        } else {
            model.addAttribute("msg", "用户名不存在!");
            return "user_forget";
        }
    }

    @RequestMapping(value = "/secretAnswer")
    public String secretAnswer(Model model, String username, String answer) {
        //通过账号查询用户
        SecretProtection secretProtection = userService.findSecretProtection(username);
        model.addAttribute("secretProtection", secretProtection);
        if (secretProtection.getAnswer().equals(answer)) {
            return "user_reset";
        } else {
            model.addAttribute("msg", "密保答案错误！");
            return "user_secretProtection";
        }
    }

    @RequestMapping(value = "/reset")
    public String reset(Model model, String username, String password) {
        //通过账号和密码查询用户
        userService.updatePassword(username, password);
        return "user_secretProtectionSuccess";
    }


    /**
     * 注册
     *
     * @param user
     * @return
     */
    @RequestMapping(value = "/register")
    public String register(User user, @RequestParam("question") String question, @RequestParam("answer") String answer, Model model) {
        User user1 = userService.findUserByUsername(user.getUsername());
        if(user1 != null){
            model.addAttribute("msg", "该用户名已存在!");
            // 表单信息回显
            model.addAttribute("user", user);
            return "user_register";
        }
        userService.register(user);
        userService.addSecretProtection(user.getUsername(), question, answer);
        return "redirect:/page/login";
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
    public String askQ(@RequestParam(value="pn",defaultValue="1")Integer pn, HttpSession session, Model model) {
        User user = (User) session.getAttribute("USER_SESSION");
        int uid = user.getUid();
        //从第一条开始 每页查询15条数据
        PageHelper.startPage(pn, 15);
        List<Question> questionsAsked = questionService.findQuestionAskedByUser(uid);
        PageInfo page = new PageInfo(questionsAsked,15);
        model.addAttribute("pageInfo", page);

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
    public String replyQ(@RequestParam(value="pn",defaultValue="1")Integer pn, HttpSession session, Model model) {
        User user = (User) session.getAttribute("USER_SESSION");
        int uid = user.getUid();
        //从第一条开始 每页查询15条数据
        PageHelper.startPage(pn, 15);
        List<Question> questionsReplied = questionService.findQuestionRepliedByUser(uid);
        PageInfo page = new PageInfo(questionsReplied,15);
        model.addAttribute("pageInfo", page);
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
        return "forward:/question/look";
    }

    /**
     * 根据用户id查找用户
     * @param uid
     * @return
     */
    public void  findUserById(Integer uid){
        userService.findUserById(uid);
    }

    /**
     * 修改个人信息
     * @param user
     * @param model
     * @return
     */
    @RequestMapping("/editInfo")
    public String editInfo(User user, Model model, HttpSession session){

        // 获取当前用户的session
        User userNow = (User) session.getAttribute("USER_SESSION");
        user.setUid(userNow.getUid());

        userService.UpdateInfo(user);

        // 根据uid查找用户，覆盖session中原来的当前用户
        user = userService.findUserById(userNow.getUid());
        session.setAttribute("USER_SESSION", user);

        return "forward:/page/user_profile";
    }

    /**
     * 修改头像
     * @param photo
     * @param session
     * @return
     */
    @RequestMapping("/photoUpload")
    public String photoUpload(String photo, HttpSession session){

        System.out.println(photo);
        User user = (User) session.getAttribute("USER_SESSION");
        userService.photoUpload(user.getUid(), photo);

        return "forward:/page/user_profile";
    }
}
