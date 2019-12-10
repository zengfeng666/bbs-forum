package cn.ncu.service;

import cn.ncu.domain.Floor;
import cn.ncu.domain.Post;

import java.sql.Timestamp;
import java.util.List;

public interface PostService {

    /**
     * 发帖
     * @param post
     */
    public void addPost(Post post);


    /**
     * 根据种类查询帖子
     * @param kind
     * @return
     */
    public List<Post> findPostsByKind(Integer kind);

    /**
     * 查询指定uid用户的所有发帖
     * @param uid
     * @return
     */
    public List<Post> findAllPostByUid(Integer uid);


    /**
     * 根据pid获取帖子对象
     * @param pid
     * @return
     */
    Post findPostByPid(Integer pid);

    /**
     * 根据pid获取所有的楼层信息
     * @param pid
     * @return
     */
    public List<Floor> findFloorsByPid(Integer pid);

    /**
     * 更新post表中的当前楼层收
     * @param pid
     * @param fid
     */
    public void updateCurrentFloor(Integer pid, Integer fid);

    /**
     * 根据uid查找所有回复的帖子
     * @param uid
     * @return
     */
    List<Post> findAllReplyByUid(Integer uid);

    /**
     * 获取uid用户的所有回复时间
     * @param uid
     * @return
     */
    List<Timestamp> findAllReplyTimeByUid(Integer uid);

    /**
     * 删除某个pid的帖子
     * @param pid
     */
    void deletePost(Integer pid);


}
