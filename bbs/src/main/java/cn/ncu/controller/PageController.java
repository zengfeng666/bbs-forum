package cn.ncu.controller;

import cn.ncu.domain.User;
import cn.ncu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/page")
public class PageController {

    @Autowired
    private UserService userService;

    @RequestMapping("/admin")
    public String admin(){return "admin";}

    @RequestMapping("/main")
    public String main(){
        return "main";
    }

    @RequestMapping("/login")
    public String login(){
        return "user_login";
    }

    @RequestMapping("/question_ask")
    public String question_ask(){
        return "question_ask";
    }

    @RequestMapping("/register")
    public String register(){
        return "user_register";
    }

    @RequestMapping("/forget")
    public String forget(){
        return "user_forget";
    }

    @RequestMapping("/user_profile")
    public String profile(HttpSession session){
        User user = (User) session.getAttribute("USER_SESSION");
        user = userService.findUserById(user.getUid());
        session.setAttribute("USER_SESSION", user);
        return "user_profile";
    }

    @RequestMapping("/post_post")
    public String post_post(){
        return "post_post";
    }

    @RequestMapping("/post_searched")
    public String post_searched(){
        return "post_searched";
    }

}
