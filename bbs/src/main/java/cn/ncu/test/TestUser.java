package cn.ncu.test;

import cn.ncu.dao.UserDao;
import cn.ncu.domain.User;
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


public class TestUser {

    InputStream is;
    private UserDao dao;
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
        dao = sqlSession.getMapper(UserDao.class);
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
        List<User> users = dao.findAll();
        for(User user: users){
            System.out.println(user);
        }
    }

    @Test
    public void run3() throws IOException, ParseException {
        User user2;

        user2 = dao.findById(26);
        System.out.println(user2);
    }

}
