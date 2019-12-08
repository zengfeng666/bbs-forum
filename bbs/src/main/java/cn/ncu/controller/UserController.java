package cn.ncu.controller;

import cn.ncu.domain.User;
import cn.ncu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/findAll")
    public String findAll(Model model){

        return null;
    }


    /**
     * 核对用户登录
     * @param username
     * @param password
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(String username, String password, Model model, HttpSession session){
        //通过账号和密码查询用户
        User user = userService.findUser(username,password);
        if(user != null){
            //将用户对象添加到Session
            session.setAttribute("USER_SESSION",user);
            //跳转到主页面
            return "register";
        }
        model.addAttribute("msg","账号或密码错误，请重新输入！");
        //返回到登录页面
        return "login";
    }

    @RequestMapping(value = "/forget",method = RequestMethod.POST)
    public String forget(String email,Model model, HttpSession session){
        //通过邮箱查询是否存在用户
        User user = userService.findEmail(email);
        if(user != null){
            //将用户对象添加到Session
            session.setAttribute("USER_SESSION",user);
            //跳转到主页面
            return "reset";
        }
        model.addAttribute("msg","邮箱错误，请重新输入！");
        //返回到登录页面
        return "forget";

    }


    /**
     * 注册
     * @param user
     * @return
     */
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(User user){
        userService.register(user);
        return "login";
    }

    /**
     * 重置密码
     * @param user
     * @return
     */
    @RequestMapping(value = "/reset",method = RequestMethod.POST)
    public String reset(User user){
        userService.reset(user);
        return "login";
    }




}
