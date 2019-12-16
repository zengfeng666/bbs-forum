package cn.ncu.service.Impl;

import cn.ncu.dao.PostFloorDao;
import cn.ncu.domain.PostFloor;
import cn.ncu.service.PostFloorService;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostFloorServiceimpl implements PostFloorService {
    @Autowired
    private PostFloorDao postFloorDao;

    @Override
    public void addOneFloor(PostFloor postFloor) {
        postFloorDao.addOneFloor(postFloor);
    }

    @Override
    public void deleteReply(Integer pid, Integer uid, Integer fid) {
        postFloorDao.deleteReply(pid, uid, fid);
    }

    @Override
    public List<PostFloor> findAllReplyByUid(Integer uid) {
        return postFloorDao.findAllReplyByUid(uid);
    }


    @Override
    public void editContent(PostFloor postFloor){
        postFloorDao.editContent(postFloor);
    }
}
