package lxf.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.po.Orders;
import com.po.User;
import com.po.UserQueryVo;

public class UserDaoImp extends SqlSessionDaoSupport implements UserDao {

	@Override
	public List<User> findUserByName(String name) {
		//继承 SqlSessionDaoSupport,通过 this.getSqlSession() 来获取 sqlSession
		SqlSession sqlSession = this.getSqlSession();
	List<User> list	= sqlSession.selectList("test.findUserByName",name);
		return list;
	}

	@Override
	public int findUserCount(UserQueryVo userQueryVo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<User> findUserListById(UserQueryVo userQueryVo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Orders> findOrdersUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Orders> findOrdersAndOrderDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> findUserAndProducts() {
		// TODO Auto-generated method stub
		return null;
	}

}
