package cn.ncu.service.Impl;

import cn.ncu.dao.RankDao;
import cn.ncu.dao.UserDao;
import cn.ncu.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RankService {
    @Autowired
    RankDao rankDao;

    public List<User> rankUser(){
        return rankDao.rankUsers();
    }
}
