package cn.ncu.controller;

import cn.ncu.domain.*;
import cn.ncu.service.AdminService;
import cn.ncu.service.PostService;
import cn.ncu.service.QuestionService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.xml.internal.bind.v2.model.core.ID;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
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
     * 注销
     *
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("USER_SESSION");
        return "redirect:/index.jsp";
    }

    /**
     * 展示某类帖子
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
     * 展示所有问题
     * @param model
     * @return
     */
    @RequestMapping("showQ")
    public String showQuestion(@RequestParam(value="pn",defaultValue="1")Integer pn, Model model){
        //从第一条开始 每页查询10条数据
        PageHelper.startPage(pn, 10);
        List<Question> list=questionService.findAll();
        PageInfo page = new PageInfo(list,10);
        model.addAttribute("pageInfo", page);
        return "admin_question_list";
    };


    /**
     * 删除问题
     * @param qid
     * @return
     */
    @RequestMapping("/delQ")
    public String delQ(Integer qid) {
        questionService.deleteQuestion(qid);
        // 问题删除成功，重定向回我的提问页面
        return "redirect:showQ";
    }


    /**
     * 查看问题的楼层信息
     *
     * @param qid
     * @param model
     * @return
     */
    @RequestMapping("/lookQ")
    public String look(Integer qid, Model model) {
        // 找到该问题的内容和楼层信息
        Question question = questionService.findByQid(qid);
        model.addAttribute("question", question);
        return "admin_question_floor_look";
    }

    /**
     * 查看帖子楼层信息
     * @param pid
     * @param model
     * @return
     */
    @RequestMapping("/lookP")
    public String lookP(Integer pid ,Model model){
        Post post=postService.findPostByPid(pid);
        // 查找这个帖子的所有楼层信息
        List<Floor> list = postService.findFloorsByPid(pid);
        post.setFloors(list);
        model.addAttribute("postWithAllFloor", post);

        return "admin_post_all_floors";
    }

    /**
     * 删除问题回复
     * @param qid
     * @param fid
     * @return
     */
    @RequestMapping("/delQR")
    public String delQR(Integer qid,Integer fid){
        questionService.deleteQuestionFloor(qid, fid);
        // 注意：qid也被传入lookQ中了
        return "forward:lookQ";
    }

    @RequestMapping("delPR")
    public String delPR(Integer pid,Integer fid){
        adminService.deletePostReply(pid,fid);
        return "forward:lookP";
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
     * 更改版块信息
     * @param kindInfo
     * @return
     */
    @RequestMapping("/changeKindInfo")
    public String changeKindInfo(KindInfo kindInfo,Model model){
        model.addAttribute("kind", kindInfo.getKind());
        adminService.changeKindInfo(kindInfo);

        //跳转到提示修改成功的页面
        return "admin_change_kind_info_success";
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
