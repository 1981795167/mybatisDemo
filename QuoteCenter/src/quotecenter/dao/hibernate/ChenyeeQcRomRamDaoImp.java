package com.landray.kmss.chenyee.quotecenter.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.landray.kmss.chenyee.quotecenter.dao.IChenyeeQcRomRamDao;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcRomRam;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataDaoImp;

/**
 * rom_ram价目表数据访问接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcRomRamDaoImp extends ExtendDataDaoImp implements IChenyeeQcRomRamDao {

	@Override
	public List<ChenyeeQcRomRam> findByProductId(String productId) {
		StringBuilder builder = new StringBuilder();
		builder.append(" from ");
		builder.append(ChenyeeQcRomRam.class.getName() + " rom_ram ");
		builder.append(" where rom_ram.fdProduct.fdId = :productId");
		Query query = getHibernateSession().createQuery(builder.toString());
		query.setParameter("productId", productId);
		return query.list();
	}

}
