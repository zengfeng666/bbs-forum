package cn.ncu.test;

import cn.ncu.dao.AccountDao;
import cn.ncu.domain.Account;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.List;

public class TestAccount {
    InputStream is;
    private AccountDao dao;
    private SqlSession sqlSession;

    @Before
    public void before() throws IOException {
        // 加载配置文件
        is = Resources.getResourceAsStream("SqlMapConfig.xml");
        // 创建SqlSessionFactory对象
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
        // 创建SqlSession对象
        sqlSession = factory.openSession();
        // 获取到代理对象
        dao = sqlSession.getMapper(AccountDao.class);
    }

    @After
    public void after() throws IOException {
        // 提交事务
        sqlSession.commit();
        // 关闭资源
        sqlSession.close();
        is.close();
    }


    @Test
    public void run4() throws IOException, ParseException {
        List<Account> accounts = dao.findAll();
        for(Account account: accounts){
            System.out.println(account);
            System.out.println(account.getUser());
        }
    }

}
