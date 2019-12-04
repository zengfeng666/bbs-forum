package cn.ncu.domain;

import java.io.Serializable;

public class QuestionUser implements Serializable {
    private Integer qid;   //需求id
    private Integer uid;   //回复人或发布需求人id
    private Integer action;   //发布/回复

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

    public Integer getAction() {
        return action;
    }

    public void setAction(Integer action) {
        this.action = action;
    }

    @Override
    public String toString() {
        return "QuestionUser{" +
                "qid=" + qid +
                ", uid=" + uid +
                ", action=" + action +
                '}';
    }
}
