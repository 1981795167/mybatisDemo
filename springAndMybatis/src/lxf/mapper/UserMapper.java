package lxf.mapper;

import java.util.List;

import com.po.Orders;
import com.po.User;
import com.po.UserQueryVo;

public interface UserMapper {

	public List<User> findUserByName(String name);
	
	public int findUserCount(UserQueryVo userQueryVo);
	
	public List<User> findUserListById(UserQueryVo userQueryVo);
	
	public List<Orders> findOrdersUser();
	
	public List<Orders> findOrdersAndOrderDetail();
	
	public List<User> findUserAndProducts();
}
