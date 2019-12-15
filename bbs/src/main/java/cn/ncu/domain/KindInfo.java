package cn.ncu.domain;

import java.io.Serializable;
import java.sql.Timestamp;


//版块信息类
public class KindInfo {


    private Integer kind;  //版块种类

    private Timestamp time;  //版块最后修改时间

    private String content;  //版块信息内容


    public Integer getKind() {
        return kind;
    }

    public void setKind(Integer kind) {
        this.kind = kind;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    @Override
    public String toString() {
        return "KindInfo{" +
                "kind=" + kind +
                ", time=" + time +
                ", content='" + content + '\'' +
                '}';
    }
}
