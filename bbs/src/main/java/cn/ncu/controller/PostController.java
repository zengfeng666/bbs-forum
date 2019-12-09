package cn.ncu.controller;

import cn.ncu.domain.Post;
import cn.ncu.domain.PostFloor;
import cn.ncu.domain.User;
import cn.ncu.service.PostFloorService;
import cn.ncu.service.PostService;
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
@RequestMapping("/post")
public class PostController {

    @Autowired
    private PostService postService;

    @Autowired
    private PostFloorService postFloorService;


    /**
     * 发帖
     * @param post
     * @return
     */
    @RequestMapping("/addPost")
    public String  addPost(Post post, Model model, HttpSession session ){

        System.out.println("id是啥");
        // 发帖的时候要更新三张表

        /*Post{pid=null, uid=null, postTime=null, title='aaa', content='傻逼
', currentFloor=null, likenum=null, isGood=null, isTop=null, kind=1,*/

        // 获取到当前登录者的user对象
        User user = (User) session.getAttribute("USER_SESSION");

        // 更新post表
        post.setUid(user.getUid());
        Date date = new Date();
        Timestamp postTime = new Timestamp(date.getTime());
        post.setPostTime(postTime);
        post.setCurrentFloor(1);
        post.setLikenum(0);
        post.setIsGood(0);              // 是否是精品
        post.setIsTop(0);               // 是否置顶
        post.setLastActiveTime(postTime);
        post.setNickName(user.getNickname());       // 获取昵称
        postService.addPost(post);
        System.out.println(post);

         // 更新post_floor表
        PostFloor postFloor = new PostFloor();
        /* private Integer pid;   //帖子id
    private Integer fid;    //楼层号
    private Integer uid;    //回帖人或发帖人id
    private Timestamp replyTime;   //回帖时间
    private String content;    //回帖内容*/
        postFloor.setPid(post.getPid());
        postFloor.setUid(1);
        postFloor.setReplyTime(postTime);
        postFloor.setContent(post.getContent());
        postFloor.setFid(1);


        postFloorService.addOneFloor(postFloor);


        /*// 更新post_user表
        PostUser postUser = new PostUser();
        postUserService.add(postUser);*/

        return "post_success";
    }

    @RequestMapping("/transitKind")
    public String transitKind(@Param("kind")Integer kind, Model model){
        System.out.println(kind);
        model.addAttribute("kind", kind);
        return "post_post";
    }

    @RequestMapping("/showPosts")
    public String showPosts(@Param("kind")Integer kind, Model model){
        List<Post> list = postService.findPostsByKind(kind);
        model.addAttribute("postsList", list);

        return "show_posts";
    }

    /**
     * 查询当前用户的所有发帖
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/findAllPostByMe")
    public String findAllPostByMe(HttpSession session, Model model){
        User user = (User) session.getAttribute("USER_SESSION");
        System.out.println("你好啊---------------------------------------------------");
        List<Post> list = postService.findAllPostByUid(user.getUid());

        System.out.println("不好-------------------------------------------");

        for(Post p : list){
            System.out.println(p);
        }
        model.addAttribute("posstListByMe", list);
        return "all_posts_by_me";
    }

}
