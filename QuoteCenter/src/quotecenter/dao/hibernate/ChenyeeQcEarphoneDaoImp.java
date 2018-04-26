package com.landray.kmss.chenyee.quotecenter.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.landray.kmss.chenyee.quotecenter.dao.IChenyeeQcEarphoneDao;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcEarphone;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataDaoImp;

/**
 * 耳机档位表数据访问接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcEarphoneDaoImp extends ExtendDataDaoImp implements IChenyeeQcEarphoneDao {

	@Override
	public List<ChenyeeQcEarphone> findByProductId(String productId) {
		StringBuilder builder = new StringBuilder();
		builder.append(" from ");
		builder.append(ChenyeeQcEarphone.class.getName() + " ear ");
		builder.append(" where ear.fdProduct.fdId = :productId");
		Query query = getHibernateSession().createQuery(builder.toString());
		query.setParameter("productId", productId);
		return query.list();
	}

}
