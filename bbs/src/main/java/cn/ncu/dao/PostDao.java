package cn.ncu.dao;

import cn.ncu.domain.Post;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

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
     * 查询给定种类的所有帖子
     * @param kind
     * @return
     */
    @Select("select * from post where kind = #{kind}")
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
    @Select("select * from post where uid = #{uid}")
    @ResultMap("postMap")
    public List<Post> findAllPostByUid(Integer uid);



}
