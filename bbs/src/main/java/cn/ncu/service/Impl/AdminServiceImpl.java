package cn.ncu.service.Impl;

import cn.ncu.service.AdminService;
import cn.ncu.dao.AdminDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminDao adminDao;

    @Override
    public void isTopPost(Integer pid){
        adminDao.isTopPost(pid);
    }

    @Override
    public void notTopPost(Integer pid){
        adminDao.notTopPost(pid);
    }

    @Override
    public void isGoodPost(Integer pid){
        adminDao.isGoodPost(pid);
    }

    @Override
    public void notGoodPost(Integer pid){
        adminDao.notGoodPost(pid);
    }
}
