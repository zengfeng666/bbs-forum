package cn.ncu.dao;

import cn.ncu.domain.Notice;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface NoticeDao {

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
}
