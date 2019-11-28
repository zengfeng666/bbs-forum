package cn.ncu.test;

import cn.ncu.dao.AccountDao;
import cn.ncu.domain.Account;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;


public class TestMybatis {

    @Test
    public void run1() throws IOException {
        // 加载配置文件
        InputStream is = Resources.getResourceAsStream("SqlMapConfig.xml");
        // 创建SqlSessionFactory对象
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
        // 创建SqlSession对象
        SqlSession sqlSession = factory.openSession();
        // 获取到代理对学习
        AccountDao dao = sqlSession.getMapper(AccountDao.class);
        // 查询所有数据
        List<Account> list = dao.findAll();
        for(Account a: list){
            System.out.println(a);
        }
        // 关闭资源
        sqlSession.close();
        is.close();

    }

    @Test
    public void run2() throws IOException {
        // 加载配置文件
        InputStream is = Resources.getResourceAsStream("SqlMapConfig.xml");
        // 创建SqlSessionFactory对象
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
        // 创建SqlSession对象
        SqlSession sqlSession = factory.openSession();
        // 获取到代理对学习
        AccountDao dao = sqlSession.getMapper(AccountDao.class);

        Account account = new Account();
        account.setName("王五");
        account.setMoney(500.0);

        dao.saveAccount(account);
        // 提交事务
        sqlSession.commit();

        // 关闭资源
        sqlSession.close();
        is.close();

    }
}
