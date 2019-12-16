package cn.ncu.controller;

import cn.ncu.domain.*;
import cn.ncu.service.Impl.RankService;
import cn.ncu.service.PostFloorService;
import cn.ncu.service.PostService;
import cn.ncu.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/rank")
public class RankController {

    @Autowired
    private RankService rankService;


    @RequestMapping("/show")
    public String showRank(Model model) {
        List<User> list=rankService.rankUser();
        model.addAttribute("list",list);
        return "rank_list";
    }
}
