package cn.ncu.dao;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;


@Repository
public interface AdminDao {

    @Update("update post set is_top = 1 where pid = #{pid}")
    void isTopPost(@Param("pid")Integer pid);

    @Update("update post set is_top = 0 where pid = #{pid}")
    void notTopPost(@Param("pid")Integer pid);

    @Update("update post set is_good = 1 where pid = #{pid}")
    void isGoodPost(@Param("pid")Integer pid);

    @Update("update post set is_good = 0 where pid = #{pid}")
    void notGoodPost(@Param("pid")Integer pid);

}
