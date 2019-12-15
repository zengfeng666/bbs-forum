package cn.ncu.service;

import cn.ncu.domain.ResetPassword;
import cn.ncu.domain.User;

import java.util.List;

public interface UserService {

    List<User> findAll();

    User findById(Integer id);

    /**
     * 登录
     * @param username
     * @param password
     * @return
     */
    public User findUser(String username,String password);

    /**
     * 注册
     * @param user
     */
    void register(User user);

    void reset(User user);

    User findEmail(String email);

    /**
     * 用户积分加上add增量
     * @param uid
     * @param add
     */
    void addCredit(Integer uid, Integer add);

    /**
     * 设置用户的等级经验
     * @param user
     */
    void setRankAndExp(User user);

    ResetPassword findResetPassword(String username);

    void updatePassword(String username, String password);

    /**
     * 更新用户的个人信息
     * @param user
     */
    void UpdateInfo(User user);

    /**
     * 根据uid查找用户
     * @param uid
     */
    User findUserById(Integer uid);
}
