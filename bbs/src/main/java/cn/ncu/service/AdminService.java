package cn.ncu.service;

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
}
