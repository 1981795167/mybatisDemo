package com.landray.kmss.chenyee.quotecenter.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.landray.kmss.chenyee.quotecenter.dao.IChenyeeQcCustOrderDao;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcCustOrder;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataDaoImp;

/**
 * 客户定制价目表数据访问接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcCustOrderDaoImp extends ExtendDataDaoImp implements IChenyeeQcCustOrderDao {

	@Override
	public List<ChenyeeQcCustOrder> getCustomerPrice(String customerName, String productId, String romram) {
		StringBuilder builder = new StringBuilder();
		builder.append(" from " + ChenyeeQcCustOrder.class.getName() + " order");
		builder.append(" where order.fdCustomerName = :customerName and order.fdRomRam = :romram and order.fdProduct.fdId = :productId");
		Query query = getHibernateSession().createQuery(builder.toString());
		query.setParameter("customerName", customerName);
		query.setParameter("romram", romram);
		query.setParameter("productId", productId);
		return query.list();
	}
	
	@Override
	public List<ChenyeeQcCustOrder> getCustOrderInfoWithProductId(String productId) {
		//StringBuilder builder = new StringBuilder();
		String hql = " "
				/*+ "ords.fdId,ords.fdProjectName,ords.fdCustomerName, "
				+ "ords.fdRomRam,ords.fdProductPrice,ords.fdBottomPrice,ords.fdPercent,ords.fdUpdateTime,"
				+ "ords.fdProduct.fdId,ords.docCreator.fdId "*/
				+ "from ChenyeeQcCustOrder ords where ords.fdProduct.fdId='" + productId
				+ "'  and ords.fdCustomerName!='' group by ords.fdCustomerName,ords.fdId,ords.fdProjectName"
				/*+ ", ords.fdId,ords.fdProjectName,"*/
				+ ",ords.fdRomRam,ords.fdProductPrice,ords.fdBottomPrice,ords.fdPercent,ords.fdUpdateTime,"
				+ "ords.fdProduct.fdId,ords.docCreator.fdId";
		//builder.append("from chenyee_qc_cust_order group by fdCustomerName");
		
		Query query = getHibernateSession().createQuery(hql);
		return  query.list();
	}

}
