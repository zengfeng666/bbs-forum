package cn.ncu.dao;

import cn.ncu.domain.PostFloor;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
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

    /**
     * 删除某个用户在某个帖子的所有回复
     * @param pid
     * @param uid
     */
    @Delete("delete from post_floor where pid = #{pid} and uid = #{uid} and fid = #{fid}")
    void deleteReply(@Param("pid")Integer pid, @Param("uid")Integer uid, @Param("fid")Integer fid);

}
