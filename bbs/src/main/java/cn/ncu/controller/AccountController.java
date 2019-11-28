package cn.ncu.controller;

import cn.ncu.domain.Account;
import cn.ncu.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 账户web
 */
@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("/findAll")
    public String findAll(Model model){
        List<Account> list = accountService.findAll();
        model.addAttribute("list", list);
        return "list";
    }

    @RequestMapping("/save")
    public String save(Account account){
        accountService.saveAccount(account);
        return "redirect:/account/findAll";
    }
}
