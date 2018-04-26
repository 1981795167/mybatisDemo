package com.landray.kmss.chenyee.quotecenter.model;

import java.util.Date;

import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcCustOrderForm;
import com.landray.kmss.common.convertor.ModelToFormPropertyMap;
import com.landray.kmss.common.model.BaseModel;
import com.landray.kmss.sys.organization.model.SysOrgPerson;



/**
 * 客户定制价目表
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcCustOrder  extends BaseModel {

	/**
	 * 项目名称
	 */
	private String fdProjectName;
	
	public String getFdProjectName() {
		return fdProjectName;
	}

	public void setFdProjectName(String fdProjectName) {
		this.fdProjectName = fdProjectName;
	}
	
	/**
	 * 客户名称
	 */
	private String fdCustomerName;
	
	/**
	 * @return 客户名称
	 */
	public String getFdCustomerName() {
		return this.fdCustomerName;
	}
	
	/**
	 * @param fdCustomerName 客户名称
	 */
	public void setFdCustomerName(String fdCustomerName) {
		this.fdCustomerName = fdCustomerName;
	}
	
	/**
	 * rom+ram
	 */
	private String fdRomRam;
	
	/**
	 * @return rom+ram
	 */
	public String getFdRomRam() {
		return this.fdRomRam;
	}
	
	/**
	 * @param fdRomRam rom+ram
	 */
	public void setFdRomRam(String fdRomRam) {
		this.fdRomRam = fdRomRam;
	}
	
	/**
	 * 产品预估价
	 */
	private Double fdProductPrice;
	
	/**
	 * @return 产品预估价
	 */
	public Double getFdProductPrice() {
		return this.fdProductPrice;
	}
	
	/**
	 * @param fdProductPrice 产品预估价
	 */
	public void setFdProductPrice(Double fdProductPrice) {
		this.fdProductPrice = fdProductPrice;
	}
	
	/**
	 * 最低售价
	 */
	private Double fdBottomPrice;
	
	
	
	public Double getFdBottomPrice() {
		return fdBottomPrice;
	}

	public void setFdBottomPrice(Double fdBottomPrice) {
		this.fdBottomPrice = fdBottomPrice;
	}

	/**
	 * 比例
	 */
	private Double fdPercent;
	
	
	
	public Double getFdPercent() {
		return fdPercent;
	}

	public void setFdPercent(Double fdPercent) {
		this.fdPercent = fdPercent;
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
	
	// chenyee liuxf 2018.3.16 modify start  
			/**
			 * 所属项目
			 */
			private ChenyeeQcProduct fdProduct;
			
			/**
			 * @return 所属项目
			 */
			public ChenyeeQcProduct getFdProduct() {
				return this.fdProduct;
			}
			
			/**
			 * @param fdProject 所属项目
			 */
			public void setFdProduct(ChenyeeQcProduct fdProduct) {
				this.fdProduct = fdProduct;
			}
			// chenyee liuxf 2018.3.16 modify end 
	
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
	

	//机制开始
	//机制结束

	public Class<ChenyeeQcCustOrderForm> getFormClass() {
		return ChenyeeQcCustOrderForm.class;
	}

	private static ModelToFormPropertyMap toFormPropertyMap;

	public ModelToFormPropertyMap getToFormPropertyMap() {
		if (toFormPropertyMap == null) {
			toFormPropertyMap = new ModelToFormPropertyMap();
			toFormPropertyMap.putAll(super.getToFormPropertyMap());
			toFormPropertyMap.put("docCreator.fdId", "docCreatorId");
			toFormPropertyMap.put("docCreator.fdName", "docCreatorName");
			
			//liuxf 2018.3.16 add start
			toFormPropertyMap.put("fdProduct.fdId", "fdProductId");
			//liuxf 2018.3.16 add end
		}
		return toFormPropertyMap;
	}
}
