package cn.ncu.service;

import cn.ncu.dao.PostFloorDao;
import cn.ncu.domain.PostFloor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 帖子楼层表的业务层
 */

public interface PostFloorService {

    /**
     * 给相应的帖子添加一层回复
     * @param postFloor
     */
    public void addOneFloor(PostFloor postFloor);

    /**
     * 删除一层楼
     * @param pid
     */
    void deleteReply(Integer pid, Integer uid, Integer fid);

    /**
     * 根据uid查找所有回复的楼层
     * @param uid
     * @return
     */
    List<PostFloor> findAllReplyByUid(Integer uid);

}
