package cn.ncu.service.Impl;

import cn.ncu.dao.RankDao;
import cn.ncu.dao.UserDao;
import cn.ncu.domain.User;
import cn.ncu.service.RankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RankServiceImpl implements RankService {
    @Autowired
    RankDao rankDao;

    @Override
    public List<User> rankUser(){
        return rankDao.rankUsers();
    }

    @Override
    public List<User> rankUserByCredit(){
        return rankDao.rankUsersByCredit();
    }
}
