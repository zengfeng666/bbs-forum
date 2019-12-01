package cn.ncu.dao;

import cn.ncu.domain.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.mapping.FetchType;
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
            @Result(id = true, column = "id", property = "userId"),
            @Result(column = "username", property = "userName"),
            @Result(column = "birthday", property = "userBirthday"),
            @Result(column = "sex", property = "userSex"),
            @Result(column = "address", property = "userAddress"),
            @Result(property = "accounts", column = "id", many = @Many(select = "cn.ncu.dao.AccountDao.findAccountByUid", fetchType = FetchType.LAZY))
    })
    List<User> findAll();

    @Select("select* from user where id = #{id}")
    @ResultMap("userMap")
    User findById(Integer id);


    @Insert("insert into user values( null, #{username}, #{birthday}, #{sex}, #{address})")
    @ResultMap("userMap")
    void saveUser(User user);

    @Update("update user set username = #{username}, birthday = #{birthday}, sex = #{sex}, address = #{address} where id = #{id}")
    @ResultMap("userMap")
    void updateUser(User user);

    @Delete("delete from user where username = #{username}")
    @ResultMap("userMap")
    void deleteUser(User user);

    /**
     * 根据用户名模糊查询
     * @param username
     * @return
     */
    @Select("select * from user where username like #{username}")
    @ResultMap("userMap")
    List<User> findByName(String username);


    @Select("select count(*) from user")
    @ResultMap("userMap")
    int findTotalUser();
}
