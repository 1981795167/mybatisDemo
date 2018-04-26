package com.landray.kmss.chenyee.quotecenter.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionMapping;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcEarphone;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcProduct;
import com.landray.kmss.common.convertor.FormConvertor_IDToModel;
import com.landray.kmss.common.convertor.FormToModelPropertyMap;
import com.landray.kmss.common.forms.ExtendForm;



/**
 * 耳机档位表 Form
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcEarphoneForm  extends ExtendForm  {

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
	 * @param fdLowPrice 低端耳机价格
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
	 * @param fdMidPrice 中端耳机价格
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
	 * @param fdHighPrice 高端耳机价格
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
	 * @param fdDefaultPrice 默认耳机价格
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
	 * @param fdProductId 产品ID
	 */
	public void setFdProductId(String fdProductId) {
		this.fdProductId = fdProductId;
	}
	
	//机制开始 
	//机制结束

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		fdLowPrice = null;
		fdMidPrice = null;
		fdHighPrice = null;
		fdDefaultPrice = null;
		fdProductId = null;
		
 
		super.reset(mapping, request);
	}

	public Class<ChenyeeQcEarphone> getModelClass() {
		return ChenyeeQcEarphone.class;
	}
	
	private static FormToModelPropertyMap toModelPropertyMap;

	public FormToModelPropertyMap getToModelPropertyMap() {
		if (toModelPropertyMap == null) {
			toModelPropertyMap = new FormToModelPropertyMap();
			toModelPropertyMap.putAll(super.getToModelPropertyMap());
			
			//chenyee liuxf 2018.3.19 add start
			toModelPropertyMap.put("fdProductId",
					new FormConvertor_IDToModel("fdProduct",
							ChenyeeQcProduct.class));
			//chenyee liuxf 2018.3.19 add end
		}
		return toModelPropertyMap;
	}
}
