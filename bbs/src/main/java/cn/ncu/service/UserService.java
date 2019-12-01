package cn.ncu.service;

import cn.ncu.domain.User;

import java.util.List;

public interface UserService {
    /**
     * 查询所有
     *
     * @return
     */
    List<User> findAll();

    User findById(Integer id);


    void saveUser(User user);

    void updateUser(User user);

    void deleteUser(User user);

    /**
     * 根据用户名模糊查询
     *
     * @param username
     * @return
     */
    List<User> findByName(String username);


    int findTotalUser();
}
