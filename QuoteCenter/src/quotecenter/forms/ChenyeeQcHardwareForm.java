package com.landray.kmss.chenyee.quotecenter.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionMapping;
import com.landray.kmss.common.forms.ExtendForm;
import com.landray.kmss.common.convertor.FormToModelPropertyMap;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcHardware;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcProduct;
import com.landray.kmss.common.convertor.FormConvertor_IDToModel;
import com.landray.kmss.sys.organization.model.SysOrgElement;



/**
 * 硬件信息表 Form
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcHardwareForm  extends ExtendForm  {

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
	
	//chenyee liuxf 2018.3.19 add start
	private String fdProductId = null;
	
	public String getFdProductId() {
		return this.fdProductId;
	}

	public void setFdProductId(String fdProductId) {
		this.fdProductId = fdProductId;
	}
	//chenyee liuxf 2018.3.19 add end
	
	//机制开始 
	//机制结束

	

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		fdHardwarePrice = null;
		fdUpdateTime = null;
		docCreatorId = null;
		docCreatorName = null;
		
		fdProductId = null;
 
		super.reset(mapping, request);
	}

	public Class<ChenyeeQcHardware> getModelClass() {
		return ChenyeeQcHardware.class;
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
