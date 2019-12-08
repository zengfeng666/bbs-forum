package cn.ncu.service;

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
     * 更新用户积分
     * @param user
     */
    void updateCredit(User user);
}
