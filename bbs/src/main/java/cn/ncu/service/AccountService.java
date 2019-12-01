package cn.ncu.service;

import cn.ncu.domain.Account;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface AccountService {

        /**
         * 查询所有
         * @return
         */
        public List<Account> findAll();

        /**
         * 根据用户id查询账户信息
         * @param userId
         * @return
         */
        List<Account> findAccountByUid(Integer userId);

}
