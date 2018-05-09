package sqlmap;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;

import com.po.Orders;
import com.po.User;
import com.po.UserChild;
import com.po.UserQueryVo;

public class UserMapperTest {

	private SqlSessionFactory sqlSessionFactory;
	@Before
	public void setUp() throws IOException{
		String resource = "sqlMapConfig.xml";
		InputStream inputStream;
			inputStream = Resources.getResourceAsStream(resource);
			//创建会话工厂，传入 myBatis 配置信息
			  sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	@Test
	public void testFindUserByName() {
		SqlSession sqlSession =  sqlSessionFactory.openSession();
		List<User> list = sqlSession.getMapper(UserMapper.class).findUserByName("aw");
		System.out.println(list);
	}

	@Test
	public void testFindUserCount() {
		SqlSession sqlSession =  sqlSessionFactory.openSession();
		UserQueryVo userQueryVo = new UserQueryVo();
		UserChild userChild = new UserChild();
		userChild.setSex("male");
		userChild.setName("xf");
		userQueryVo.setUserChild(userChild);
		int count = sqlSession.getMapper(UserMapper.class).findUserCount(userQueryVo);
		System.out.println(count);
		
		//关闭SqlSession
		sqlSession.close();
	}
	@Test
	public void testFindUserListById(){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		UserQueryVo userQueryVo = new UserQueryVo();
		List<Integer> ids = new ArrayList<Integer>();
		ids.add(1);
		ids.add(4);
		userQueryVo.setIds(ids);
		
		List<User> list = sqlSession.getMapper(UserMapper.class).findUserListById(userQueryVo);
		System.out.println(list);
		
		//关闭SqlSession
		sqlSession.close();
	}
	
	@Test
	public void testfindOrdersUser(){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Orders> list = sqlSession.getMapper(UserMapper.class).findOrdersUser();
		System.out.println(list);
		
		//关闭sqlSession
		sqlSession.close();
	}
	
	@Test
	public void testfindOrdersAndOrderDetail(){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Orders> list = sqlSession.getMapper(UserMapper.class).findOrdersAndOrderDetail();
		System.out.println(list);
		
		//关闭sqlSession
		sqlSession.close();
	}
	
	@Test
	public void testfindUserAndProducts(){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<User> list = sqlSession.getMapper(UserMapper.class).findUserAndProducts();
		System.out.println(list);
		
		//关闭sqlSession
		sqlSession.close();
	}
	
	/**
	 * 查询订单关联查询用户，用户信息延迟加载 Test方法
	 */
	@Test
	public void testfindOrdersUserLazyloading(){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		//查询订单信息 （单表）
		List<Orders> list = sqlSession.getMapper(UserChildMapper.class).findOrdersUserLazyloading();
		
		for(Orders order:list){
			//遍历上列的订单列表，执行getUser() 去查询用户信息，这里实现按需加载
			User user = order.getUser();
			System.out.println(user.toString());
		}
		
		
		//关闭sqlSession
		sqlSession.close();
	}
}
