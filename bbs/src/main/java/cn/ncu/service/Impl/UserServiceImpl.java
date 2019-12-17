package cn.ncu.service.Impl;

import cn.ncu.dao.UserDao;
import cn.ncu.domain.SecretProtection;
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
    public SecretProtection findSecretProtection(String username) {
        SecretProtection secretProtection = userDao.findSecretProtection(username);
        return  secretProtection;
    }

    @Override
    public void updatePassword(String username, String password) {
        userDao.updatePassword(username, password);
    }

    @Override
    public User findUserByUsername(String username) {
        return userDao.findUserByUsername(username);
    }

    @Override
    public void photoUpload(Integer uid, String photo){
        userDao.photoUpload(uid,photo);
    }

    @Override
    public void addSecretProtection(String username, String question, String answer) {
        userDao.addSecretProtection(username, question, answer);
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


    @Override
    public void UpdateInfo(User user) {
        userDao.updateInfo(user);
    }

    @Override
    public User findUserById(Integer uid) {
        return userDao.findUserById(uid);
    }


}
