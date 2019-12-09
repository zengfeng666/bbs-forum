package cn.ncu.domain;

import java.io.Serializable;
import java.sql.Timestamp;

// 由QuestionFloor, PostFloor, User三个对象组成的实体类
public class Floor implements Serializable{
    private Integer qid;            //需求id
    private Integer fid;            //楼层号
    private Integer uid;            //回复人或发布需求人id
    private Timestamp replyTime;    //回复时间
    private String content;         //回复内容
    private Integer isAccept;       //是否采纳

    private Integer pid;            //帖子id

    private String username;        //用户名(账号)
    private String nickname;        //昵称
    private String password;        //密码
    private String email;           //邮箱
    private Integer credit;         //积分
    private String photo;           //头像
    private String tel;             //电话
    private String sex;             //性别
    private String description;     //个性签名
    private String job;             //工作
    private String company;         //工作单位
    private Integer exp;            //经验
    private Integer rank;           //等级

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

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public Integer getExp() {
        return exp;
    }

    public void setExp(Integer exp) {
        this.exp = exp;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    @Override
    public String toString() {
        return "Floor{" +
                "qid=" + qid +
                ", fid=" + fid +
                ", uid=" + uid +
                ", replyTime=" + replyTime +
                ", content='" + content + '\'' +
                ", isAccept=" + isAccept +
                ", pid=" + pid +
                ", username='" + username + '\'' +
                ", nickname='" + nickname + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", credit=" + credit +
                ", photo='" + photo + '\'' +
                ", tel='" + tel + '\'' +
                ", sex='" + sex + '\'' +
                ", description='" + description + '\'' +
                ", job='" + job + '\'' +
                ", company='" + company + '\'' +
                ", exp=" + exp +
                ", rank=" + rank +
                '}';
    }
}
