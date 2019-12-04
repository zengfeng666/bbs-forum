package cn.ncu.domain;

import java.io.Serializable;

public class PostUser implements Serializable {
    private Integer pid;   //帖子id
    private Integer uid;   //回帖人或发帖人id
    private Integer action;  //发布/回复

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
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
        return "PostUser{" +
                "pid=" + pid +
                ", uid=" + uid +
                ", action=" + action +
                '}';
    }
}
