package com.landray.kmss.chenyee.quotecenter.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionMapping;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcProduct;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcPurchase;
import com.landray.kmss.common.convertor.FormConvertor_IDToModel;
import com.landray.kmss.common.convertor.FormToModelPropertyMap;
import com.landray.kmss.common.forms.ExtendForm;
import com.landray.kmss.sys.organization.model.SysOrgElement;



/**
 * 采购费用表 Form
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcPurchaseForm  extends ExtendForm  {

	
	
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
	 * @param fdManufacturePrice 制造费用
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
	 * @param fdStandbyPrice 备品费用
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
	 * @param fdFinancialPrice 财务费用
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
	 * @param fdLogisticsPrice 物流费用
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
	 * @param fdQualcommPatentPrice 高通专利费用
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
	 * @param fdSoftwarePatentPrice 软件专利费用
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
	 * @param fdHolster 皮套
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
	 * @param fdMembrane 钢化膜
	 */
	public void setFdMembrane(Double fdMembrane) {
		this.fdMembrane = fdMembrane;
	}
	
	/**
	 * 更新时间
	 */
	private String fdUpdateTime;
	
	/**
	 * @return 更新时间
	 */
	public String getFdUpdateTime() {
		return this.fdUpdateTime;
	}
	
	/**
	 * @param fdUpdateTime 更新时间
	 */
	public void setFdUpdateTime(String fdUpdateTime) {
		this.fdUpdateTime = fdUpdateTime;
	}
	
	/**
	 * 创建者的ID
	 */
	private String docCreatorId;
	
	/**
	 * @return 创建者的ID
	 */
	public String getDocCreatorId() {
		return this.docCreatorId;
	}
	
	/**
	 * @param docCreatorId 创建者的ID
	 */
	public void setDocCreatorId(String docCreatorId) {
		this.docCreatorId = docCreatorId;
	}
	
	/**
	 * 创建者的名称
	 */
	private String docCreatorName;
	
	/**
	 * @return 创建者的名称
	 */
	public String getDocCreatorName() {
		return this.docCreatorName;
	}
	
	/**
	 * @param docCreatorName 创建者的名称
	 */
	public void setDocCreatorName(String docCreatorName) {
		this.docCreatorName = docCreatorName;
	}
	
	//chenyee liuxf 2018.3.21 add start
	private String fdProductId = null;
			
	public String getFdProductId() {
		return this.fdProductId;
	}

	public void setFdProductId(String fdProductId) {
		this.fdProductId = fdProductId;
	}
	//chenyee liuxf 2018.3.21 add end
	
	//机制开始 
	//机制结束

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		fdManufacturePrice = null;
		fdStandbyPrice = null;
		fdFinancialPrice = null;
		fdLogisticsPrice = null;
		fdQualcommPatentPrice = null;
		fdSoftwarePatentPrice = null;
		fdHolster = null;
		fdMembrane = null;
		fdUpdateTime = null;
		docCreatorId = null;
		docCreatorName = null;
		
		fdProductId = null;
 
		super.reset(mapping, request);
	}

	public Class<ChenyeeQcPurchase> getModelClass() {
		return ChenyeeQcPurchase.class;
	}
	
	private static FormToModelPropertyMap toModelPropertyMap;

	public FormToModelPropertyMap getToModelPropertyMap() {
		if (toModelPropertyMap == null) {
			toModelPropertyMap = new FormToModelPropertyMap();
			toModelPropertyMap.putAll(super.getToModelPropertyMap());
			toModelPropertyMap.put("docCreatorId",
					new FormConvertor_IDToModel("docCreator",
						SysOrgElement.class));
			
			//chenyee liuxf 2018.3.19 add start
			toModelPropertyMap.put("fdProductId",
					new FormConvertor_IDToModel("fdProduct",
							ChenyeeQcProduct.class));
			//chenyee liuxf 2018.3.19 add end
		}
		return toModelPropertyMap;
	}
}
