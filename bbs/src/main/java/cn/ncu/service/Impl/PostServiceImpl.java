package cn.ncu.service.Impl;

import cn.ncu.dao.PostDao;
import cn.ncu.domain.Post;
import cn.ncu.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    private PostDao postDao;

    @Override
    public void addPost(Post post) {
        postDao.addPost(post);
    }

    @Override
    public List<Post> findPostsByKind(Integer kind) {
        return postDao.findPostsByKind(kind);
    }

    @Override
    public List<Post> findAllPostByUid(Integer uid) {
        return postDao.findAllPostByUid(uid);
    }


}
