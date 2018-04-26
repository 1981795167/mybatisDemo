package com.landray.kmss.chenyee.quotecenter.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionMapping;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcCustOrder;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcProduct;
import com.landray.kmss.common.convertor.FormConvertor_IDToModel;
import com.landray.kmss.common.convertor.FormToModelPropertyMap;
import com.landray.kmss.common.forms.ExtendForm;
import com.landray.kmss.sys.organization.model.SysOrgElement;



/**
 * 客户定制价目表 Form
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcCustOrderForm  extends ExtendForm  {

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
	
	//机制开始 
	//机制结束

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		fdProjectName = null;
		fdCustomerName = null;
		fdRomRam = null;
		fdProductPrice = null;
		fdBottomPrice = null;
		fdPercent = null;
		fdUpdateTime = null;
		fdProductId = null;
		docCreatorId = null;
		docCreatorName = null;
		
 
		super.reset(mapping, request);
	}

	public Class<ChenyeeQcCustOrder> getModelClass() {
		return ChenyeeQcCustOrder.class;
	}
	
	private static FormToModelPropertyMap toModelPropertyMap;

	public FormToModelPropertyMap getToModelPropertyMap() {
		if (toModelPropertyMap == null) {
			toModelPropertyMap = new FormToModelPropertyMap();
			toModelPropertyMap.putAll(super.getToModelPropertyMap());
			toModelPropertyMap.put("docCreatorId",
					new FormConvertor_IDToModel("docCreator",
						SysOrgElement.class));
			
			//liuxf 2018.3.16 add start
			toModelPropertyMap.put("fdProductId", new FormConvertor_IDToModel(
					"fdProduct", ChenyeeQcProduct.class));
			//liuxf 2018.3.16 add end
		}
		return toModelPropertyMap;
	}
}
