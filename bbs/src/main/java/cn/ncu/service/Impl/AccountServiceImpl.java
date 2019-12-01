package cn.ncu.service.Impl;

import cn.ncu.dao.AccountDao;
import cn.ncu.domain.Account;
import cn.ncu.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("accountService")
public class AccountServiceImpl implements AccountService{

    @Autowired
    private AccountDao accountDao;

    @Override
    public List<Account> findAll() {
        return accountDao.findAll();
    }

    @Override
    public List<Account> findAccountByUid(Integer userId) {
        return accountDao.findAccountByUid(userId);
    }

}
