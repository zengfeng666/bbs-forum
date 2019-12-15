package cn.ncu.service.Impl;

import cn.ncu.domain.Notice;
import cn.ncu.service.AdminService;
import cn.ncu.dao.AdminDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public List<Notice> findNotice(){
        return adminDao.findNotice();
    }

    @Override
    public void addNotice(Notice notice){
        adminDao.addNotice(notice);
    }

    @Override
    public void deleteNotice(Integer nid){
        adminDao.deleteNotice(nid);
    }
}
