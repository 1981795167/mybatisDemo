package com.landray.kmss.chenyee.quotecenter.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.landray.kmss.chenyee.quotecenter.dao.IChenyeeQcBomDao;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcBom;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataDaoImp;

/**
 * bom信息数据访问接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcBomDaoImp extends ExtendDataDaoImp implements IChenyeeQcBomDao {

	@Override
	public List<ChenyeeQcBom> loadBomCode(String productId) {
		
		String hql = ""
				/*+ "select bom.fdBomName,bom.fdBomPrice,bom.fdBomCode,"
				+ "bom.fdFactory,bom.fdApplication,bom.fdVersionDescription,bom.fdVersion,"
				+ "bom.fdMaterielCode, bom.fdDimension,bom.fdMaterielPrice,bom.fdSerialNumber,bom.fdMaterialDescription,bom.fdBomPriceUpdateTime,"
				+ "bom.fdProduct.fdId "*/
				+ "from ChenyeeQcBom bom where bom.fdProduct.fdId='" + productId
				+ "'  group by bom.fdId,bom.fdBomName,bom.fdBomPrice,bom.fdBomCode,"
				+ "bom.fdFactory,bom.fdApplication,bom.fdVersionDescription,bom.fdVersion,"
				+ "bom.fdMaterielCode, bom.fdDimension,bom.fdMaterielPrice,bom.fdSerialNumber,bom.fdMaterialDescription,bom.fdBomPriceUpdateTime,"
				+ "bom.fdProduct.fdId";
		
		Query query = getHibernateSession().createQuery(hql);
		
		return query.list();
	}

	@Override
	public List<ChenyeeQcBom> loadBomInfo(String productId, String bomCode) {
		String hql = "select bom.fdBomName,bom.fdBomPrice,bom.fdFactory,bom.fdApplication,"
				+ "bom.fdVersionDescription,bom.fdVersion from ChenyeeQcBom bom where bom.fdProduct.fdId='" + productId
				+ "' and bom.fdBomCode='" + bomCode + "' group by bom.fdBomName,bom.fdBomPrice,bom.fdFactory,bom.fdApplication,"
				+ "bom.fdVersionDescription,bom.fdVersion";
		
		Query query = getHibernateSession().createQuery(hql);
		
		return query.list();
	}

	@Override
	public List<ChenyeeQcBom> loadBomListInfo(String productId,
			String bomCode) {
		String hql = "select bom.fdMaterielCode,bom.fdMaterialDescription,bom.fdDimension,bom.fdMaterielPrice"
				+ " from ChenyeeQcBom bom where bom.fdProduct.fdId='" + productId
				+ "' and bom.fdBomCode='" + bomCode + "' ";
		
		Query query = getHibernateSession().createQuery(hql);
		
		return query.list();
	}

}
