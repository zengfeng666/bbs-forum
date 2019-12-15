package cn.ncu.service;

import cn.ncu.domain.Notice;

import java.util.List;

public interface NoticeService {

    /**
     * 显示所有公告
     * @return
     */
    public List<Notice> findNotice();
}
