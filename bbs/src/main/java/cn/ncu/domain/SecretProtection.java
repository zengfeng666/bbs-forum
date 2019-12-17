package cn.ncu.domain;

import java.io.Serializable;

public class SecretProtection implements Serializable {
    private String username;   //用户名
    private String question;   //密保问题
    private String answer;     //密保答案

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "SecretProtection{" +
                "username='" + username + '\'' +
                ", question='" + question + '\'' +
                ", answer='" + answer + '\'' +
                '}';
    }
}
