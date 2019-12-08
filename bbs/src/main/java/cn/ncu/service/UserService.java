package cn.ncu.service;

import cn.ncu.domain.User;

import java.util.List;

public interface UserService {

    List<User> findAll();

    User findById(Integer id);
}
