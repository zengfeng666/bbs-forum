package cn.ncu.service;

import cn.ncu.domain.KindInfo;
import cn.ncu.domain.Notice;

import java.util.List;

public interface AdminService {

    /**
     * 置顶某个帖子
     * @param pid 帖子ID号
     */
    public void isTopPost(Integer pid);

    /**
     * 取消置顶
     * @param pid
     */
    public void notTopPost(Integer pid);

    /**
     * 加精
     * @param pid
     */
    public void isGoodPost(Integer pid);

    /**
     * 取消加精
     * @param pid
     */
    public void notGoodPost(Integer pid);

    /**
     * 显示所有公告
     * @return
     */
    public List<Notice> findNotice();

    /**
     * 发布公告
     * @param notice
     */
    public void addNotice(Notice notice);


    /**
     * 修改版块信息
     * @param kindInfo
     */
    public void changeKindInfo(KindInfo kindInfo);


    /**
     * 删除一条公告
     * @param nid
     */
    public void deleteNotice(Integer nid);

    public void deletePostReply(Integer pid,Integer fid);
}
