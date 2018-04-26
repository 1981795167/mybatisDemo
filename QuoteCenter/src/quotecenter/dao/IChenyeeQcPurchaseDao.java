package com.landray.kmss.chenyee.quotecenter.dao;

import java.util.List;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcPurchase;
import com.landray.kmss.common.dao.IBaseDao;

/**
 * 采购费用表数据访问接口
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public interface IChenyeeQcPurchaseDao extends IBaseDao {

	List<ChenyeeQcPurchase> findByProductId(String productId);

}
