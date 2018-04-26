package com.landray.kmss.chenyee.quotecenter.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.landray.kmss.chenyee.quotecenter.dao.IChenyeeQcSetpercentDao;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcSetpercent;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataDaoImp;

/**
 * 预设比例表数据访问接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcSetpercentDaoImp extends ExtendDataDaoImp implements IChenyeeQcSetpercentDao {

	@Override
	public List loadPresetPercent() {
		StringBuilder builder = new StringBuilder();
		builder.append("select percent.fdPresetPercent from ");
		builder.append(ChenyeeQcSetpercent.class.getName() + " percent ");
		Query query = getHibernateSession().createQuery(builder.toString());
		return query.list();
	}

	
	@Override
	public void addPercent(String fdId, double percent) {
		String hql = "delete ChenyeeQcSetpercent" ;
		Query query = getHibernateSession().createQuery(hql);
		query.executeUpdate();
		
		String sql = "insert into chenyee_qc_setpercent(fd_id,fd_preset_percent) values(?,?) ";

		Query query2 = getHibernateSession().createSQLQuery(sql);
		query2.setParameter(0, fdId);
		query2.setParameter(1, percent);
		query2.executeUpdate();
		
	}

}
