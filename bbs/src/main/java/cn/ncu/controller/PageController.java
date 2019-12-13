package cn.ncu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/page")
public class PageController {

    @RequestMapping("/main")
    public String main(){
        return "main";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/question_ask")
    public String question_ask(){
        return "question_ask";
    }

    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    @RequestMapping("/forget")
    public String forget(){
        return "forget";
    }
}
