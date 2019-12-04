package cn.ncu.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class PostFloor implements Serializable {
    private Integer pid;   //帖子id
    private Integer fid;    //楼层号
    private Integer uid;    //回帖人或发帖人id
    private Timestamp replyTime;   //回帖时间
    private String content;    //回帖内容

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Timestamp getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(Timestamp replyTime) {
        this.replyTime = replyTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "PostFloor{" +
                "pid=" + pid +
                ", fid=" + fid +
                ", uid=" + uid +
                ", replyTime=" + replyTime +
                ", content='" + content + '\'' +
                '}';
    }
}
