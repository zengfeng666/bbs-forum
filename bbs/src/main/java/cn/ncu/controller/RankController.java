package cn.ncu.controller;

import cn.ncu.domain.*;
import cn.ncu.service.Impl.RankServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/rank")
public class RankController {

    @Autowired
    private RankServiceImpl rankServiceImpl;


    @RequestMapping("/show")
    public String showRank(Model model) {
        List<User> list= rankServiceImpl.rankUser();
        model.addAttribute("list",list);
        return "rank_list";
    }

    @RequestMapping("/showC")
    public String showRankByCredit(Model model){
        List<User> list=rankServiceImpl.rankUserByCredit();
        model.addAttribute("list",list);
        return "rank_credit_list";
    }

}
