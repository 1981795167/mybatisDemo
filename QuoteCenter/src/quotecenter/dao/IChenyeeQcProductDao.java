package com.landray.kmss.chenyee.quotecenter.dao;

import java.util.List;

import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcProductForm;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcCustOrder;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcProduct;
import com.landray.kmss.common.dao.IBaseDao;

/**
 * 产品信息表数据访问接口
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public interface IChenyeeQcProductDao extends IBaseDao {

	List<ChenyeeQcProduct> getProductName();

	List<ChenyeeQcProduct> queryAll();
	
	List<ChenyeeQcCustOrder> getCustOrderInfoByProductId(String productId); 
	
	public void setUpdateTime(String fdId,String execModel);
	
	Long getCountByProductId(String productId,String whichModule);

	/**
	 * 更新产品信息
	 * @param chenyeeQcProductForm
	 */
	void updateProductInfo(ChenyeeQcProductForm chenyeeQcProductForm);
	
	/**
	 * 更新硬件信息
	 * @param chenyeeQcProductForm
	 */
	void updateHardWareInfo(ChenyeeQcProductForm chenyeeQcProductForm);
	
	/**
	 * 插入硬件信息
	 * @param chenyeeQcProductForm
	 */
	void addHardWareInfo(ChenyeeQcProductForm chenyeeQcProductForm);
	
	/**
	 * 增加采购信息 仅针对采购信息表
	 */
	void addPurchaseInfo(ChenyeeQcProductForm chenyeeQcProductForm);
	
	
	/**
	 * 更新采购信息 仅针对采购信息表
	 */
	void updatePurchaseInfo(ChenyeeQcProductForm chenyeeQcProductForm);
	
	/**
	 * 增加耳机信息
	 */
	void  addEarphoneInfo(ChenyeeQcProductForm chenyeeQcProductForm);
	
	/**
	 * 更新耳机信息
	 */
	void  updateEarphoneInfo(ChenyeeQcProductForm chenyeeQcProductForm);
	
	/**
	 * 增加rom_ram信息
	 * @param chenyeeQcProductForm
	 */
	void addRomRamInfo(ChenyeeQcProductForm chenyeeQcProductForm);
	
	/**
	 * 通过产品Id删除耳机信息
	 * @param productId
	 */
	void delEarPhoneInfoByProductId(String productId);
	
	/**
	 * 通过产品Id删除采购信息
	 * @param productId
	 */
	void delPurchaseInfoByProductId(String productId);
	
	/**
	 * 通过产品Id 删除Rom_Ram信息
	 * @param productId
	 */
	void delRomRamInfoByProductId(String productId);
	
	/**
	 * 通过产品Id删除客户定制信息
	 * @param productId
	 */
	void delCustOrderInfoByProductId(String productId);
	
	/**
	 * 根据产品ID更新RomRam表信息
	 * @param productId
	 * @param productPrice
	 * @param romRam
	 */
	void updateRomRamForProductByProductId(String productId,Double productPrice,String romRam,Double presetPercent);
	
	/**
	 * 根据产品ID该更新客户定指标信息
	 * @param productId
	 * @param productPrice
	 *  @param romRam
	 */
	void updateCustOrderForProductByProductId(String productId,Double productPrice,String romRam,Double presetPercent);
	
	/**
	 * 获取预设比例
	 * @return
	 */
	Double getPresetPercent();
	
	/**
	 * 根据产品Id删除客户定制信息
	 * @param productId
	 */
	void deleteCustOrderInfoByProductId(String productId);
	
	/**
	 * 增加客户定制信息
	 * @param chenyeeQcProductForm
	 */
	void addCustOrderInfo(ChenyeeQcProductForm chenyeeQcProductForm);
	
	/**
	 * 通过产品ID数组删除硬件信息
	 * @param productIds
	 */
	void deleteHardwareInfoByProductIds(String[] productIds);
	
	/**
	 * 通过产品ID数组删除采购信息
	 * @param productIds
	 */
	void deletePurchaseInfoByProductIds(String[] productIds);
	
	/**
	 * 通过产品ID数组耳机信息
	 * @param productIds
	 */
	void deleteEarphoneInfoByProductIds(String[] productIds);
	
	/**
	 * 通过产品ID数组删除rom_ram信息
	 * @param productIds
	 */
	void deleteRomRamInfoByProductIds(String[] productIds);
	
	/**
	 * 通过产品ID数组删除客户定制信息
	 * @param productIds
	 */
	void deleteCustOrderInfoByProductIds(String[] productIds);
	
	/**
	 * 通过产品ID数组删除产品信息
	 * @param productIds
	 */
	void deleteProductInfoByProductIds(String[] productIds);
}
