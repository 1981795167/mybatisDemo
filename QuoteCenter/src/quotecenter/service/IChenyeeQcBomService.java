package com.landray.kmss.chenyee.quotecenter.service;

import com.landray.kmss.common.service.IBaseService;

import net.sf.json.JSONArray;
/**
 * bom信息业务对象接口
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public interface IChenyeeQcBomService extends IBaseService {

	JSONArray loadBomCode(String productId);

	JSONArray loadBomInfo(String productId, String bomCode);

	JSONArray loadBomListInfo(String productId, String bomCode);
}
