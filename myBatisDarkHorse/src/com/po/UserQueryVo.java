package com.po;

import java.util.List;

public class UserQueryVo {
	private UserChild userChild;  //继承自父类 User

	private List<Integer> ids;
	public List<Integer> getIds() {
		return ids;
	}

	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}

	public UserChild getUserChild() {
		return userChild;
	}

	public void setUserChild(UserChild userChild) {
		this.userChild = userChild;
	}
	
	//可以在这里包装其他的查询条件，如商品，订单等

}
