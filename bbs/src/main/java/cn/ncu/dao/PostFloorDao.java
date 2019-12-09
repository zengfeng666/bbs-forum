package cn.ncu.dao;

import cn.ncu.domain.PostFloor;
import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

/**
 * 帖子楼层表
 */
@Repository
public interface PostFloorDao {

    /*  private Integer pid;   //帖子id
    private Integer fid;    //楼层号
    private Integer uid;    //回帖人或发帖人id
    private Timestamp replyTime;   //回帖时间
    private String content;    //回帖内容*/

    /**
     * 给相应帖子添加一层回复
     * @param postFloor
     */
    @Insert("insert into post_floor values(#{pid}, #{fid}," +
            "#{uid}, #{replyTime}, #{content})")
    public void addOneFloor(PostFloor postFloor);
}
