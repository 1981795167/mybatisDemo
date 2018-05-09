package com.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.po.User;

import sqlmap.UserMapper;

public class MyTest {

	@Test
	public void findUserByIdTest(){
		
		String resource = "sqlMapConfig.xml";
		InputStream inputStream;
		SqlSession sqlSession = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			//创建会话工厂，传入 myBatis 配置信息
			SqlSessionFactory  sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
			sqlSession = sqlSessionFactory.openSession();
			
			//通过sqlSession 操作数据库
			//第一个参数：映射文件中 statement 的 id ，等于  namespace + "." + statement 的 id。
			//第二个参数：指定和映射文件中所匹配的parameterType 类型的参数。
			//sqlSession.selectOne 的结果是与映射文件中所匹配的 resultType 类型的对象。
			User user = sqlSession.selectOne("test.findUserById", 1);
			
			System.out.println(user);
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		
	}
	
	@Test
	public void findUserByNameTest(){
		
		String resource = "sqlMapConfig.xml";
		InputStream inputStream;
		SqlSession sqlSession = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			//创建会话工厂，传入 myBatis 配置信息
			SqlSessionFactory  sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
			sqlSession = sqlSessionFactory.openSession();
			
			//通过sqlSession 操作数据库
			//第一个参数：映射文件中 statement 的 id ，等于  namespace + "." + statement 的 id。
			//第二个参数：指定和映射文件中所匹配的parameterType 类型的参数。
			//sqlSession.selectOne 的结果是与映射文件中所匹配的 resultType 类型的对象。
			List<User> list = sqlSession.getMapper(UserMapper.class).findUserByName("liu");
			
			System.out.println(list);
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		
		
	}
	
	@Test
	public void insertUserTest(){
		
		String resource = "sqlMapConfig.xml";
		InputStream inputStream;
		SqlSession sqlSession = null;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			//创建会话工厂，传入 myBatis 配置信息
			SqlSessionFactory  sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
			sqlSession = sqlSessionFactory.openSession();
			
			//通过sqlSession 操作数据库
			
			User user = new User();
			user.setName("LawJack");
			user.setSex("male");
			user.setAddress("Town China");
			 sqlSession.insert("test.insertUser",user);
			
			 //提交事务
			 sqlSession.commit();
			 
			 //返回自增主键
			System.out.println(user.getId());
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		
		
	}
}
