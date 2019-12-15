package cn.ncu.service.Impl;

import cn.ncu.dao.NoticeDao;
import cn.ncu.domain.Notice;
import cn.ncu.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService{

    @Autowired
    private NoticeDao noticeDao;

    @Override
    public List<Notice> findNotice(){
        return noticeDao.findNotice();
    }
}
