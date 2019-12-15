package cn.ncu.controller;

import cn.ncu.domain.KindInfo;
import cn.ncu.domain.Notice;
import cn.ncu.domain.Post;
import cn.ncu.service.AdminService;
import cn.ncu.service.PostService;
import cn.ncu.service.QuestionService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    PostService postService;

    @Autowired
    QuestionService questionService;

    @Autowired
    AdminService adminService;

    /**
     * 删除pid这个帖子
     * @param pid
     * @return
     */
    @RequestMapping("/deletePost")
    public String deletePost(Integer pid ,int kind){
        postService.deletePost(pid);
        return "forward:showPosts?kind="+kind;
    }

    /**
     * 置顶
     * @param pid
     * @param kind
     * @return
     */
    @RequestMapping("/isTopPost")
    public String isTopPost(Integer pid ,int kind){
        adminService.isTopPost(pid);
        return "forward:showPosts?kind="+kind;
    }

    /**
     * 取消置顶
     * @param pid
     * @param kind
     * @return
     */
    @RequestMapping("/notTopPost")
    public String notTopPost(Integer pid ,int kind){
        adminService.notTopPost(pid);
        return "forward:showPosts?kind="+kind;
    }

    /**
     * 加精
     * @param pid
     * @param kind
     * @return
     */
    @RequestMapping("/isGoodPost")
    public String isGoodPost(Integer pid ,int kind){
        adminService.isGoodPost(pid);
        return "forward:showPosts?kind="+kind;
    }

    /**
     * 取消加精
     * @param pid
     * @param kind
     * @return
     */
    @RequestMapping("/notGoodPost")
    public String notGoodPost(Integer pid ,int kind){
        adminService.notGoodPost(pid);
        return "forward:showPosts?kind="+kind;
    }

    /**
     * 展示某类特定帖子
     * @param kind
     * @param model
     * @return
     */
    @RequestMapping("/showPosts")
    public String showPosts(@Param("kind")Integer kind, Model model){

        //版块信息
        KindInfo kindInfo = postService.getKindInfoByKind(kind);
        model.addAttribute("kindInfo", kindInfo);
        //帖子列表
        List<Post> list = postService.findPostsByKind(kind);
        model.addAttribute("postsList", list);
        return "admin_post_list";
    }

    /**
     * 显示所有公告
     * @param model
     * @return
     */
    @RequestMapping("/showNotices")
    public String showNotices(Model model){
        List<Notice> list = adminService.findNotice();
        model.addAttribute("noticesList", list);
        return "admin_notice_list";
    }


    /**
     * 发布公告
     * @param notice
     * @param model
     * @return
     */
    @RequestMapping("/addNotice")
    public String  addNotice(Notice notice, Model model){

        Date date = new Date();
        Timestamp noticeTime = new Timestamp(date.getTime());
        notice.setNoticeTime(noticeTime);
        adminService.addNotice(notice);
        return showNotices(model);
    }


    /**
     * 删除一条公告
     * @param nid
     * @param model
     * @return
     */
    @RequestMapping("/deleteNotice")
    public String deleteNotice(Integer nid,Model model){
        adminService.deleteNotice(nid);
        return showNotices(model);
    }

}
