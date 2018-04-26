package com.landray.kmss.chenyee.quotecenter.model;

import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcEarphoneForm;
import com.landray.kmss.common.convertor.ModelToFormPropertyMap;
import com.landray.kmss.common.model.BaseModel;

/**
 * 耳机档位表
 * 
 * @author
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcEarphone extends BaseModel {

	/**
	 * 低端耳机价格
	 */
	private Double fdLowPrice=null;

	/**
	 * @return 低端耳机价格
	 */
	public Double getFdLowPrice() {
		return this.fdLowPrice;
	}

	/**
	 * @param fdLowPrice
	 *            低端耳机价格
	 */
	public void setFdLowPrice(Double fdLowPrice) {
		this.fdLowPrice = fdLowPrice;
	}

	/**
	 * 中端耳机价格
	 */
	private Double fdMidPrice;

	/**
	 * @return 中端耳机价格
	 */
	public Double getFdMidPrice() {
		return this.fdMidPrice;
	}

	/**
	 * @param fdMidPrice
	 *            中端耳机价格
	 */
	public void setFdMidPrice(Double fdMidPrice) {
		this.fdMidPrice = fdMidPrice;
	}

	/**
	 * 高端耳机价格
	 */
	private Double fdHighPrice;

	/**
	 * @return 高端耳机价格
	 */
	public Double getFdHighPrice() {
		return this.fdHighPrice;
	}

	/**
	 * @param fdHighPrice
	 *            高端耳机价格
	 */
	public void setFdHighPrice(Double fdHighPrice) {
		this.fdHighPrice = fdHighPrice;
	}

	/**
	 * 默认耳机价格
	 */
	private Double fdDefaultPrice;

	/**
	 * @return 默认耳机价格
	 */
	public Double getFdDefaultPrice() {
		return this.fdDefaultPrice;
	}

	/**
	 * @param fdDefaultPrice
	 *            默认耳机价格
	 */
	public void setFdDefaultPrice(Double fdDefaultPrice) {
		this.fdDefaultPrice = fdDefaultPrice;
	}

	/**
	 * 产品ID
	 */
	private String fdProductId;

	/**
	 * @return 产品ID
	 */
	public String getFdProductId() {
		return this.fdProductId;
	}

	/**
	 * @param fdProductId
	 *            产品ID
	 */
	public void setFdProductId(String fdProductId) {
		this.fdProductId = fdProductId;
	}

	// chenyee liuxf 2018.3.19 add start
	private ChenyeeQcProduct fdProduct;

	public ChenyeeQcProduct getFdProduct() {
		return this.fdProduct;
	}

	public void setFdProduct(ChenyeeQcProduct fdProduct) {
		this.fdProduct = fdProduct;
	}

	// chenyee liuxf 2018.3.19 add end

	// 机制开始
	// 机制结束

	public Class<ChenyeeQcEarphoneForm> getFormClass() {
		return ChenyeeQcEarphoneForm.class;
	}

	private static ModelToFormPropertyMap toFormPropertyMap;

	public ModelToFormPropertyMap getToFormPropertyMap() {
		if (toFormPropertyMap == null) {
			toFormPropertyMap = new ModelToFormPropertyMap();
			toFormPropertyMap.putAll(super.getToFormPropertyMap());

			// chenyee liuxf 2018.3.19 add start
			toFormPropertyMap.put("fdProduct.fdId", "fdProductId");

			// chenyee liuxf 2018.3.19 add end
		}
		return toFormPropertyMap;
	}
}
