package cn.ncu.controller;

import cn.ncu.domain.Post;
import cn.ncu.service.AdminService;
import cn.ncu.service.PostService;
import cn.ncu.service.QuestionService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
        List<Post> list = postService.findPostsByKind(kind);
        model.addAttribute("postsList", list);
        return "admin_post_list";
    }
}
