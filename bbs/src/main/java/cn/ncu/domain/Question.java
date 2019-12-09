package cn.ncu.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

public class Question implements Serializable {
    private Integer qid;            //需求id
    private Integer uid;            //需求发布者的id
    private Timestamp postTime;     //需求发布的时间
    private String title;           //需求标题
    private String content;         //需求内容
    private Integer currentFloor;   //楼层数
    private Integer credit;         //悬赏积分

    private List<Floor> floors;     // 这个问题对应的所有楼层(即所有回复)

    public List<Floor> getFloors() {
        return floors;
    }

    public void setFloors(List<Floor> floors) {
        this.floors = floors;
    }

    public Integer getQid() {
        return qid;
    }

    public void setQid(Integer qid) {
        this.qid = qid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Timestamp getPostTime() {
        return postTime;
    }

    public void setPostTime(Timestamp postTime) {
        this.postTime = postTime;
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

    public Integer getCurrentFloor() {
        return currentFloor;
    }

    public void setCurrentFloor(Integer currentFloor) {
        this.currentFloor = currentFloor;
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    @Override
    public String toString() {
        return "Question{" +
                "qid=" + qid +
                ", uid=" + uid +
                ", postTime=" + postTime +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", currentFloor=" + currentFloor +
                ", credit=" + credit +
                '}';
    }
}
