package com.landray.kmss.chenyee.quotecenter.service;

import java.util.List;

import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcProductForm;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcProduct;
import com.landray.kmss.common.service.IBaseService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 产品信息表业务对象接口
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public interface IChenyeeQcProductService extends IBaseService {

	/**
	 * 返回所有项目名称
	 * @return
	 */
	JSONArray getProductName();

	/**
	 * 返回所有项目信息
	 * @return
	 */
	List<ChenyeeQcProduct> queryAll();
	
	JSONObject loadProductInfo(String productId) throws Exception;
	
	
	Long getCountByProductId(String productId,String whichModule);
	
	void updateProductModuleInfo(ChenyeeQcProductForm chenyeeQcProductForm);
	
	void updateHardWareInfo(ChenyeeQcProductForm chenyeeQcProductForm);
	
	void addHardWareInfo(ChenyeeQcProductForm chenyeeQcProductForm);
	
	/**
	 * 
	 * @param chenyeeQcProductForm
	 * 增加采购模块信息 该模块包括:采购信息 耳机信息  rom|ram信息
	 */
	void addPurchaseModuleInfo(ChenyeeQcProductForm chenyeeQcProductForm);
	
	/**
	 * 
	 * @param chenyeeQcProductForm
	 * 更新采购模块信息 该模块包括:采购信息 耳机信息  rom|ram信息
	 */
	void updatePurchaseModuleInfo(ChenyeeQcProductForm chenyeeQcProductForm);
	
	/**
	 * 
	 * @param chenyeeQcProductForm
	 */
	void updateSaleModuleInfo(ChenyeeQcProductForm chenyeeQcProductForm);
	
	
	
	ChenyeeQcProduct queryProductInfo(String productId) throws Exception;
	
	/**
	 * 
	 * @param productIds  产品ID数组集合
	 */
	void deleteProductModuleInfo(String[] productIds);

}
