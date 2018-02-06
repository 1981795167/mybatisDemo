package test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import bean.Person;

public class TestMybatis {
	String resource = "sqlMapConfig.xml";
	
	@Test
	public void testFindAll() throws IOException{
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		Person person = new Person();
		person.setName("old man");
		//person.setAge(null);
		List <Person> personList = sqlSession.selectList("mapper.PersonMapper.findAll",person);
		for(Person p : personList)
			System.out.println(p.toString());

	}
	
	@Test
	public void testInsert() throws IOException{
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		Person p  = new Person();
		p.setName("dark pig");
		p.setAge(40);
		
		sqlSession.insert("mapper.PersonMapper.insert", p);
		sqlSession.commit();
	}
	
	@Test
	public void testUpdate() throws IOException{
		InputStream inputStream = Resources.getResourceAsStream(resource);
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Person person1 = sqlSession.selectOne("mapper.PersonMapper.get", 5);
		person1.setName("fucking shit");
		person1.setAge(20);
		
		sqlSession.update("mapper.PersonMapper.update", person1);
		sqlSession.commit();
	}

}
