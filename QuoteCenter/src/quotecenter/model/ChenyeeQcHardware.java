package com.landray.kmss.chenyee.quotecenter.model;

import java.util.Date;
import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcHardwareForm;
import com.landray.kmss.common.convertor.ModelToFormPropertyMap;
import com.landray.kmss.common.model.BaseModel;
import com.landray.kmss.sys.organization.model.SysOrgPerson;



/**
 * 硬件信息表
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcHardware  extends BaseModel {

	/**
	 * 硬件成本预估价
	 */
	private Double fdHardwarePrice;
	
	/**
	 * @return 硬件成本预估价
	 */
	public Double getFdHardwarePrice() {
		return this.fdHardwarePrice;
	}
	
	/**
	 * @param fdHardwarePrice 硬件成本预估价
	 */
	public void setFdHardwarePrice(Double fdHardwarePrice) {
		this.fdHardwarePrice = fdHardwarePrice;
	}
	
	
	/**
	 * 更新时间
	 */
	private Date fdUpdateTime;
	
	/**
	 * @return 更新时间
	 */
	public Date getFdUpdateTime() {
		return this.fdUpdateTime;
	}
	
	/**
	 * @param fdUpdateTime 更新时间
	 */
	public void setFdUpdateTime(Date fdUpdateTime) {
		this.fdUpdateTime = fdUpdateTime;
	}
	
	/**
	 * 创建者
	 */
	private SysOrgPerson docCreator;
	
	/**
	 * @return 创建者
	 */
	public SysOrgPerson getDocCreator() {
		return this.docCreator;
	}
	
	/**
	 * @param docCreator 创建者
	 */
	public void setDocCreator(SysOrgPerson docCreator) {
		this.docCreator = docCreator;
	}
	
	
	//chenyee liuxf 2018.3.19 add start
	private ChenyeeQcProduct fdProduct;
	
	public ChenyeeQcProduct getFdProduct() {
		return this.fdProduct;
	}

	public void setFdProduct(ChenyeeQcProduct fdProduct) {
		this.fdProduct = fdProduct;
	}
	
	//chenyee liuxf 2018.3.19 add end
	
	
	

	//机制开始
	//机制结束

	

	public Class<ChenyeeQcHardwareForm> getFormClass() {
		return ChenyeeQcHardwareForm.class;
	}

	private static ModelToFormPropertyMap toFormPropertyMap;

	public ModelToFormPropertyMap getToFormPropertyMap() {
		if (toFormPropertyMap == null) {
			toFormPropertyMap = new ModelToFormPropertyMap();
			toFormPropertyMap.putAll(super.getToFormPropertyMap());
			toFormPropertyMap.put("docCreator.fdId", "docCreatorId");
			toFormPropertyMap.put("docCreator.fdName", "docCreatorName");
			
			//chenyee liuxf 2018.3.19 add start
			toFormPropertyMap.put("fdProduct.fdId", "fdProductId");
			
			//chenyee liuxf 2018.3.19 add end
		}
		return toFormPropertyMap;
	}
}
