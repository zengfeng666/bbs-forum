package cn.ncu.service;

import cn.ncu.domain.User;

import java.util.List;

public interface RankService {

    /**
     * 根据经验排行
     * @return
     */
    public List<User> rankUser();

    public List<User> rankUserByCredit();

}
