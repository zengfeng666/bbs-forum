package cn.ncu.controller;

import cn.ncu.domain.Notice;
import cn.ncu.service.NoticeService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    NoticeService noticeService;

    /**
     * 显示所有公告
     * @param model
     * @return
     */
    @RequestMapping("/showNotices")
    public String showNotices(Model model){
        List<Notice> list = noticeService.findNotice();
        model.addAttribute("noticesList", list);
        return "notice_list";
    }

}
