package com.landray.kmss.chenyee.quotecenter.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.landray.kmss.chenyee.quotecenter.dao.IChenyeeQcCustomerDao;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcCustomer;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataDaoImp;

/**
 * 客户信息表数据访问接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcCustomerDaoImp extends ExtendDataDaoImp implements IChenyeeQcCustomerDao {

	public List<ChenyeeQcCustomer> getCustomerName() {
		StringBuilder builder = new StringBuilder();
		builder.append("select customer.fdId, customer.fdCustomerName from ");
		builder.append(ChenyeeQcCustomer.class.getName() + " customer ");
		Query query = getHibernateSession().createQuery(builder.toString());
		
		return query.list();
	}

}
