package cn.ncu.dao;

import cn.ncu.domain.Floor;
import cn.ncu.domain.Post;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;

@Repository
public interface PostDao {


    /* private Integer pid;     //帖子id
    private Integer uid;      //发帖人id
    private Timestamp askTime;  //发帖时间
    private String title;    //帖子标题
    private String content;   //发帖内容
    private Integer currentFloor;  //帖子楼层数
    private Integer likenum;   //点赞数
    private Integer isGood;    //是否精品
    private Integer isTop;    //是否置顶
    private Integer kind;       // 帖子的种类
    private Timestamp LastActiveTime;   // 帖子的最后活跃时间
*/
    /**
     * 发帖
     * @param post1
     */
    @Insert("insert into post values(null, #{uid}, #{postTime}, #{title}, #{content}, #{currentFloor}, #{likenum}," +
            "#{isGood}, #{isTop}, #{kind}, #{lastActiveTime}, #{nickName})")
    @SelectKey(keyColumn = "pid", keyProperty = "pid", resultType = Integer.class, before = false,
    statement = {"select last_insert_id()"})
    public void addPost(Post post1);


    /**
     * 查询给定种类的所有帖子, 并做降序排序
     * @param kind
     * @return
     */
    @Select("select * from post where kind = #{kind} order by last_active_time desc")
    @Results(id = "postMap",
            value = {
                @Result(id = true, column = "pid", property = "pid"),
                @Result(column = "uid", property = "uid"),
                @Result(column = "post_time", property = "postTime"),
                @Result(column = "title", property = "title"),
                @Result(column = "content", property = "content"),
                @Result(column = "current_floor", property = "currentFloor"),
                @Result(column = "likenum", property = "likenum"),
                @Result(column = "is_good", property = "isGood"),
                @Result(column = "is_top", property = "isTop"),
                @Result(column = "kind", property = "kind"),
                @Result(column = "last_active_time", property = "lastActiveTime"),
                @Result(column = "nick_name", property = "nickName")
            })
    public List<Post> findPostsByKind(Integer kind);


    /**
     * 查询个性uid用户的所有发帖
     * @param uid
     * @return
     */
    @Select("select * from post where uid = #{uid} order by post_time desc")
    @ResultMap("postMap")
    public List<Post> findAllPostByUid(Integer uid);


    /**
     * 根据贴子的pid查询帖子的所有楼层信息
     * @param pid
     * @return
     */
    @Select("SELECT pid, fid, user.uid id, reply_time, content, exp, rank, " +
            "username, nickname, `password`, email, credit, photo, tel, sex, description " +
            "FROM post_floor, USER " +
            "WHERE post_floor.pid = #{pid} AND post_floor.uid = user.uid " +
            "ORDER BY fid ASC")
    @Results(id = "postFloorMap", value = {
            @Result(column = "id", property = "uid"),
            @Result(column = "reply_time", property = "replyTime"),
    })
    List<Floor> findFloorsByPid(Integer pid);

    /**
     * 根据pid获取post对象
     * @param pid
     * @return
     */
    @Select("select * from post where pid = #{pid}")
    @ResultMap("postMap")
    Post findPostByPid(Integer pid);

    /**
     * 更新当成楼层数
     * @param pid
     * @param fid
     */
    @Update("update post set current_floor = #{fid} where pid = #{pid}")
    void updateFid(@Param("pid")Integer pid, @Param("fid")Integer fid);

    /**
     * 根据uid查找所有回复的帖子的pid， 并根据回复时间排序
     * @param uid
     * @return
     */
    @Select("SELECT * FROM post WHERE pid IN( " +
            "SELECT  DISTINCT pid " +
            "FROM post_floor " +
            "WHERE uid = #{uid} AND fid != 1 " +
            "ORDER BY reply_time " +
            ")")
    @ResultMap("postMap")
    List<Post> findAllReplyByUid(Integer uid);


    /**
     * 获取uid用户的所有回复时间
     * @param uid
     * @return
     */
    @Select("SELECT reply_time FROM post WHERE pid IN( " +
            "SELECT  DISTINCT pid " +
            "FROM post_floor " +
            "WHERE uid = 4 AND fid != 1 " +
            "ORDER BY reply_time " +
            ")")
    List<Timestamp> findAllReplyTimeByUid(Integer uid);

    /**
     * 删除pid这个帖子
     * @param pid
     */
    @Delete("delete from post where pid = #{pid}")
    void deletePost(Integer pid);


}
