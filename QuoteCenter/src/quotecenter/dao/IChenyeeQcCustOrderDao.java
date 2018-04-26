package com.landray.kmss.chenyee.quotecenter.dao;

import java.util.List;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcCustOrder;
import com.landray.kmss.common.dao.IBaseDao;

/**
 * 客户定制价目表数据访问接口
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public interface IChenyeeQcCustOrderDao extends IBaseDao {

	List<ChenyeeQcCustOrder> getCustomerPrice(String customerName, String productId, String romram);

	List<ChenyeeQcCustOrder> getCustOrderInfoWithProductId(String productId);

}
