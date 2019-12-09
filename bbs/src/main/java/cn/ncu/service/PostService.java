package cn.ncu.service;

import cn.ncu.domain.Post;

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
}
