package cn.ncu.dao;

import cn.ncu.domain.User;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {

    /**
     * 查询所有
     * @return
     */
    @Select("select * from user")
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
//            一对多连接查询
//            @Result(property = "accounts", column = "id", many = @Many(select = "cn.ncu.dao.AccountDao.findAccountByUid", fetchType = FetchType.LAZY))
    })
    List<User> findAll();

    @Select("select* from user where uid = #{uid}")
    @ResultMap("userMap")
    User findById(Integer id);



}
