package cn.ncu.dao;

import cn.ncu.domain.PostFloor;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

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
     * 编辑一层楼的内容
     * @param postFloor
     */

    @Update("UPDATE post_floor SET content = #{content} WHERE pid = #{pid} and fid = #{fid}")
    public void editContent(PostFloor postFloor);



    /**
     * 删除某个用户在某个帖子的某层回复
     * @param pid
     * @param uid
     */
    @Delete("delete from post_floor where pid = #{pid} and uid = #{uid} and fid = #{fid}")
    void deleteReply(@Param("pid")Integer pid, @Param("uid")Integer uid, @Param("fid")Integer fid);


    /**
     * 根据uid查找所有回复的楼层， 并根据回复时间排序
     * @param uid
     * @return
     */
    @Select("SELECT * FROM post_floor WHERE uid = #{uid} and fid != 1 order by reply_time asc ")
    @Results(id = "postFloorMap", value = {
            @Result(column = "reply_time", property = "replyTime")
    })
    List<PostFloor> findAllReplyByUid(Integer uid);
}
