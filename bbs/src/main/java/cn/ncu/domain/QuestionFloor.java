package cn.ncu.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class QuestionFloor implements Serializable {
    private Integer qid;            //需求id
    private Integer fid;            //楼层号
    private Integer uid;            //回复人或发布需求人id
    private Timestamp replyTime;    //回复时间
    private String content;         //回复内容
    private Integer isAccept;       //是否采纳

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
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

    public Integer getIsAccept() {
        return isAccept;
    }

    public void setIsAccept(Integer isAccept) {
        this.isAccept = isAccept;
    }

    @Override
    public String toString() {
        return "QuestionFloor{" +
                "qid=" + qid +
                ", fid=" + fid +
                ", uid=" + uid +
                ", replyTime=" + replyTime +
                ", content='" + content + '\'' +
                ", isAccept=" + isAccept +
                '}';
    }
}
