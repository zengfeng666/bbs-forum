package cn.ncu.domain;


import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

//公告类
public class Notice implements Serializable {
    private Integer nid;  //公告id
    private Timestamp noticeTime;  //公告发布时间
    private String title;    //公告标题
    private String content;  //公告内容

    public Integer getNid() {
        return nid;
    }

    public void setNid(Integer nid) {
        this.nid = nid;
    }

    public Timestamp getNoticeTime() {
        return noticeTime;
    }

    public void setNoticeTime(Timestamp noticeTime) {
        this.noticeTime = noticeTime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "nid=" + nid +
                ", noticeTime=" + noticeTime +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
