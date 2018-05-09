package lxf.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.po.User;

public class UserMapperTest {

	private ApplicationContext applicationContext;
	
	@Before
	public void setUp() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext
	    		 ("classpath:spring/applicationContext.xml");
	}

	@Test
	public void testFindUserByName() {
		UserMapper userMapper = (UserMapper) applicationContext.getBean("userMapper");
		List<User> list = userMapper.findUserByName("xf");
		System.out.println(list.toString());
	}

}
