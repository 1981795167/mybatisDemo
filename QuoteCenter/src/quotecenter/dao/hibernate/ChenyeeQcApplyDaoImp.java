package com.landray.kmss.chenyee.quotecenter.dao.hibernate;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.landray.kmss.chenyee.quotecenter.dao.IChenyeeQcApplyDao;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcApply;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataDaoImp;

/**
 * 报价申请数据访问接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcApplyDaoImp extends ExtendDataDaoImp implements IChenyeeQcApplyDao {

	@Override
	public int updateApplyBill(String oldValue, String newValue, String fieldName) {
		
		StringBuilder builder = new StringBuilder(" update ")
				.append(ChenyeeQcApply.class.getName()).append(" apply ");
		if("fdProjectName".equals(fieldName)) {
			builder.append(" set apply.fdProjectName = :newValue where apply.fdProjectName = :oldValue ");
			
		}
		if("fdCustomerName".equals(fieldName)) {
			builder.append(" and apply.fdCustomerName = :newValue where apply.fdCustomerName = :oldValue ");
		}
		Query query = getHibernateSession().createQuery(builder.toString());
		query.setParameter("newValue", newValue.trim());
		query.setParameter("oldValue", oldValue.trim());
		return query.executeUpdate();
	}



	

	

}
