package com.landray.kmss.chenyee.quotecenter.model;

import java.util.Date;

import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcPurchaseForm;
import com.landray.kmss.common.convertor.ModelToFormPropertyMap;
import com.landray.kmss.common.model.BaseModel;
import com.landray.kmss.sys.organization.model.SysOrgPerson;

/**
 * 采购费用表
 * 
 * @author
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcPurchase extends BaseModel {
	
	
	/**
	 * 制造费用
	 */
	private Double fdManufacturePrice;

	/**
	 * @return 制造费用
	 */
	public Double getFdManufacturePrice() {
		return this.fdManufacturePrice;
	}

	/**
	 * @param fdManufacturePrice
	 *            制造费用
	 */
	public void setFdManufacturePrice(Double fdManufacturePrice) {
		this.fdManufacturePrice = fdManufacturePrice;
	}

	/**
	 * 备品费用
	 */
	private Double fdStandbyPrice;

	/**
	 * @return 备品费用
	 */
	public Double getFdStandbyPrice() {
		return this.fdStandbyPrice;
	}

	/**
	 * @param fdStandbyPrice
	 *            备品费用
	 */
	public void setFdStandbyPrice(Double fdStandbyPrice) {
		this.fdStandbyPrice = fdStandbyPrice;
	}

	/**
	 * 财务费用
	 */
	private Double fdFinancialPrice;

	/**
	 * @return 财务费用
	 */
	public Double getFdFinancialPrice() {
		return this.fdFinancialPrice;
	}

	/**
	 * @param fdFinancialPrice
	 *            财务费用
	 */
	public void setFdFinancialPrice(Double fdFinancialPrice) {
		this.fdFinancialPrice = fdFinancialPrice;
	}

	/**
	 * 物流费用
	 */
	private Double fdLogisticsPrice;

	/**
	 * @return 物流费用
	 */
	public Double getFdLogisticsPrice() {
		return this.fdLogisticsPrice;
	}

	/**
	 * @param fdLogisticsPrice
	 *            物流费用
	 */
	public void setFdLogisticsPrice(Double fdLogisticsPrice) {
		this.fdLogisticsPrice = fdLogisticsPrice;
	}

	/**
	 * 高通专利费用
	 */
	private Double fdQualcommPatentPrice;

	/**
	 * @return 高通专利费用
	 */
	public Double getFdQualcommPatentPrice() {
		return this.fdQualcommPatentPrice;
	}

	/**
	 * @param fdQualcommPatentPrice
	 *            高通专利费用
	 */
	public void setFdQualcommPatentPrice(Double fdQualcommPatentPrice) {
		this.fdQualcommPatentPrice = fdQualcommPatentPrice;
	}

	/**
	 * 软件专利费用
	 */
	private Double fdSoftwarePatentPrice;

	/**
	 * @return 软件专利费用
	 */
	public Double getFdSoftwarePatentPrice() {
		return this.fdSoftwarePatentPrice;
	}

	/**
	 * @param fdSoftwarePatentPrice
	 *            软件专利费用
	 */
	public void setFdSoftwarePatentPrice(Double fdSoftwarePatentPrice) {
		this.fdSoftwarePatentPrice = fdSoftwarePatentPrice;
	}

	/**
	 * 皮套
	 */
	private Double fdHolster;

	/**
	 * @return 皮套
	 */
	public Double getFdHolster() {
		return this.fdHolster;
	}

	/**
	 * @param fdHolster
	 *            皮套
	 */
	public void setFdHolster(Double fdHolster) {
		this.fdHolster = fdHolster;
	}

	/**
	 * 钢化膜
	 */
	private Double fdMembrane;

	/**
	 * @return 钢化膜
	 */
	public Double getFdMembrane() {
		return this.fdMembrane;
	}

	/**
	 * @param fdMembrane
	 *            钢化膜
	 */
	public void setFdMembrane(Double fdMembrane) {
		this.fdMembrane = fdMembrane;
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
	 * @param fdUpdateTime
	 *            更新时间
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
	 * @param docCreator
	 *            创建者
	 */
	public void setDocCreator(SysOrgPerson docCreator) {
		this.docCreator = docCreator;
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

	public Class<ChenyeeQcPurchaseForm> getFormClass() {
		return ChenyeeQcPurchaseForm.class;
	}

	private static ModelToFormPropertyMap toFormPropertyMap;

	public ModelToFormPropertyMap getToFormPropertyMap() {
		if (toFormPropertyMap == null) {
			toFormPropertyMap = new ModelToFormPropertyMap();
			toFormPropertyMap.putAll(super.getToFormPropertyMap());
			toFormPropertyMap.put("docCreator.fdId", "docCreatorId");
			toFormPropertyMap.put("docCreator.fdName", "docCreatorName");

			// chenyee liuxf 2018.3.19 add start
			toFormPropertyMap.put("fdProduct.fdId", "fdProductId");

			// chenyee liuxf 2018.3.19 add end
		}
		return toFormPropertyMap;
	}
}
