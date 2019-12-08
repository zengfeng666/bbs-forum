package cn.ncu.controller;

import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/test")
public class TestController {



    @RequestMapping("/hello")
    public String hello(){
        return "forward:/pages/login.jsp";
    }
}
