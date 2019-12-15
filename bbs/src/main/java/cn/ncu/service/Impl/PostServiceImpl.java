package cn.ncu.service.Impl;

import cn.ncu.dao.PostDao;
import cn.ncu.domain.Floor;
import cn.ncu.domain.Post;
import cn.ncu.domain.PostFloor;
import cn.ncu.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    private PostDao postDao;

    @Override
    public List<Post> search(String title) {
        return postDao.search(title);
    }

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

    @Override
    public Post findPostByPid(Integer pid) {
        return postDao.findPostByPid(pid);
    }

    @Override
    public List<Floor> findFloorsByPid(Integer pid){
        return postDao.findFloorsByPid(pid);
    }

    @Override
    public void updateCurrentFloor(Integer pid, Integer fid) {
        postDao.updateFid(pid, fid);
    }

    @Override
    public List<Timestamp> findAllReplyTimeByUid(Integer uid) {
        return postDao.findAllReplyTimeByUid(uid);
    }

    @Override
    public void deletePost(Integer pid) {
        postDao.deletePost(pid);
    }


}
