package cn.ncu.dao;

import cn.ncu.domain.KindInfo;
import cn.ncu.domain.Notice;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface AdminDao {

    /**
     * 置顶
     * @param pid
     */
    @Update("update post set is_top = 1 where pid = #{pid}")
    void isTopPost(@Param("pid")Integer pid);

    /**
     * 取消置顶
     * @param pid
     */
    @Update("update post set is_top = 0 where pid = #{pid}")
    void notTopPost(@Param("pid")Integer pid);

    /**
     * 加精
     * @param pid
     */
    @Update("update post set is_good = 1 where pid = #{pid}")
    void isGoodPost(@Param("pid")Integer pid);

    /**
     * 取消加精
     * @param pid
     */
    @Update("update post set is_good = 0 where pid = #{pid}")
    void notGoodPost(@Param("pid")Integer pid);


    /**
     * 查找所有公告
     * @return
     */
    @Select("select * from notice order by notice_time desc")
    @Results(id="noticeMap",
            value = {
                @Result(id = true, column = "nid", property = "nid"),
                @Result(column = "nid", property = "nid"),
                @Result(column = "notice_time", property = "noticeTime"),
                @Result(column = "title", property = "title"),
                @Result(column = "content", property = "content"),
            })
    public List<Notice> findNotice();


    /**
     * 发布一条公告
     * @param notice
     */

    @Insert("insert into notice values(null,#{noticeTime},#{title},#{content})")
    @Options(useGeneratedKeys = true, keyProperty = "nid", keyColumn = "nid")
    void addNotice(Notice notice);


    /**
     * 修改版块信息
     * @param kindInfo
     */
    @Update("UPDATE kind_info SET content = #{content} WHERE kind = #{kind} ")
    void changeKindInfo(KindInfo kindInfo);

    /**
     * 删除一条公告
     * @param nid
     */
    @Delete("delete from notice where nid = #{nid}")
    void deleteNotice(Integer nid);

    /**
     * 删除某个用户在某个帖子的某层回复
     *这里要加@param
     */
    @Delete("delete from post_floor where pid = #{pid} and fid = #{fid}")
    void deletePostReply(@Param("pid") Integer pid,@Param("fid") Integer fid);



}
