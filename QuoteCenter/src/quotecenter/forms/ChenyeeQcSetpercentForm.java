package com.landray.kmss.chenyee.quotecenter.forms;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionMapping;
import com.landray.kmss.common.forms.ExtendForm;
import com.landray.kmss.util.AutoArrayList;

import com.landray.kmss.common.convertor.FormToModelPropertyMap;
import com.landray.kmss.common.convertor.FormConvertor_FormListToModelList;
import com.landray.kmss.common.convertor.FormConvertor_IDToModel;
import com.landray.kmss.common.convertor.FormConvertor_IDsToModelList;

import com.landray.kmss.sys.organization.model.SysOrgElement;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcSetpercent;



/**
 * 预设比例表 Form
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcSetpercentForm  extends ExtendForm  {

	/**
	 * 预设比例
	 */
	private String fdPresetPercent;
	
	/**
	 * @return 预设比例
	 */
	public String getFdPresetPercent() {
		return this.fdPresetPercent;
	}
	
	/**
	 * @param fdPresetPercent 预设比例
	 */
	public void setFdPresetPercent(String fdPresetPercent) {
		this.fdPresetPercent = fdPresetPercent;
	}
	
	/**
	 * 创建时间
	 */
	private String docCreateTime;
	
	/**
	 * @return 创建时间
	 */
	public String getDocCreateTime() {
		return this.docCreateTime;
	}
	
	/**
	 * @param docCreateTime 创建时间
	 */
	public void setDocCreateTime(String docCreateTime) {
		this.docCreateTime = docCreateTime;
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
	
	//机制开始 
	//机制结束

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		fdPresetPercent = null;
		docCreateTime = null;
		fdUpdateTime = null;
		docCreatorId = null;
		docCreatorName = null;
		
 
		super.reset(mapping, request);
	}

	public Class<ChenyeeQcSetpercent> getModelClass() {
		return ChenyeeQcSetpercent.class;
	}
	
	private static FormToModelPropertyMap toModelPropertyMap;

	public FormToModelPropertyMap getToModelPropertyMap() {
		if (toModelPropertyMap == null) {
			toModelPropertyMap = new FormToModelPropertyMap();
			toModelPropertyMap.putAll(super.getToModelPropertyMap());
			toModelPropertyMap.put("docCreatorId",
					new FormConvertor_IDToModel("docCreator",
						SysOrgElement.class));
		}
		return toModelPropertyMap;
	}
}
