package com.landray.kmss.chenyee.quotecenter.service;

import java.util.List;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcCustOrder;
import com.landray.kmss.common.service.IBaseService;

import net.sf.json.JSONArray;
/**
 * 客户定制价目表业务对象接口
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public interface IChenyeeQcCustOrderService extends IBaseService {

	JSONArray getCustomerPrice(String customerName, String productId, String romram);
	
	List<ChenyeeQcCustOrder> getCustOrderInfoWithProductId(String id);

}
