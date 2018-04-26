package com.landray.kmss.chenyee.quotecenter.service;

import com.landray.kmss.common.service.IBaseService;

import net.sf.json.JSONArray;
/**
 * 采购费用表业务对象接口
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public interface IChenyeeQcPurchaseService extends IBaseService {

	JSONArray getPurchase(String productId);

}
