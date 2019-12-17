package cn.ncu.dao;

import cn.ncu.domain.User;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RankDao {

    /**
     * 查询所有按经验排序
     *
     * @return
     */
    @Select("select * from user order by exp desc")
    @Results(id = "userMap", value = {
            @Result(id = true, column = "uid", property = "uid"),
            @Result(column = "username", property = "username"),
            @Result(column = "nickname", property = "nickname"),
            @Result(column = "password", property = "password"),
            @Result(column = "email", property = "email"),
            @Result(column = "credit", property = "credit"),
            @Result(column = "photo", property = "photo"),
            @Result(column = "tel", property = "tel"),
            @Result(column = "sex", property = "sex"),
            @Result(column = "description", property = "description"),
            @Result(column = "job", property = "job"),
            @Result(column = "company", property = "company"),
            @Result(column = "exp", property = "exp"),
            @Result(column = "rank", property = "rank"),
    })
    List<User> rankUsers();

    /**
     * 积分排行
     * @return
     */
    @Select("select * from user order by credit desc")
    @Results(id = "userCreditMap", value = {
            @Result(id = true, column = "uid", property = "uid"),
            @Result(column = "username", property = "username"),
            @Result(column = "nickname", property = "nickname"),
            @Result(column = "password", property = "password"),
            @Result(column = "email", property = "email"),
            @Result(column = "credit", property = "credit"),
            @Result(column = "photo", property = "photo"),
            @Result(column = "tel", property = "tel"),
            @Result(column = "sex", property = "sex"),
            @Result(column = "description", property = "description"),
            @Result(column = "job", property = "job"),
            @Result(column = "company", property = "company"),
            @Result(column = "exp", property = "exp"),
            @Result(column = "rank", property = "rank"),
    })
    List<User> rankUsersByCredit();
}