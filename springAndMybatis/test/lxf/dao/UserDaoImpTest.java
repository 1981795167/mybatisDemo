package lxf.dao;


import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.po.User;

import lxf.mapper.UserMapper;

public class UserDaoImpTest {

	private ApplicationContext applicationContext;
	
	@Before
	public void setUp() throws Exception {
	     applicationContext = new ClassPathXmlApplicationContext
	    		 ("classpath:spring/applicationContext.xml");	
	}

	@Test
	public void testFindUserByName() {
		UserDao userDao = (UserDao) applicationContext.getBean("userDao");
		List<User> list = userDao.findUserByName("xf");

		System.out.println(list.toString());
	}

}
