package com.landray.kmss.chenyee.quotecenter.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.landray.kmss.chenyee.quotecenter.dao.IChenyeeQcPurchaseDao;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcPurchase;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataDaoImp;

/**
 * 采购费用表数据访问接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcPurchaseDaoImp extends ExtendDataDaoImp implements IChenyeeQcPurchaseDao {

	@Override
	public List<ChenyeeQcPurchase> findByProductId(String productId) {
		StringBuilder builder = new StringBuilder();
		builder.append(" from ");
		builder.append(ChenyeeQcPurchase.class.getName() + " purchase ");
		builder.append(" where purchase.fdProduct.fdId = :productId");
		Query query = getHibernateSession().createQuery(builder.toString());
		query.setParameter("productId", productId);
		return query.list();
	}

}
