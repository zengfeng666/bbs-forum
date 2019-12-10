package cn.ncu.service.Impl;

import cn.ncu.dao.UserDao;
import cn.ncu.domain.User;
import cn.ncu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;


    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public User findById(Integer id) {
        return userDao.findById(id);
    }

    @Override
    public User findUser(String username, String password) {
        User user = this.userDao.findUser(username, password);
        return user;
    }

    @Override
    public void register(User user) {
        userDao.register(user);
    }

    @Override
    public void reset(User user) {
        userDao.reset(user);
    }

    @Override
    public User findEmail(String email) {
        User user = this.userDao.findEmail(email);
        return user;
    }

    @Override
    public void addCredit(Integer uid, Integer add) {
        userDao.addCredit(uid, add);
    }

    @Override
    public void setRankAndExp(User user) {
        userDao.setRankAndExp(user);
    }

}
