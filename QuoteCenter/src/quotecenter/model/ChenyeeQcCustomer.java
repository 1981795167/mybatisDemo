package com.landray.kmss.chenyee.quotecenter.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import com.landray.kmss.sys.organization.model.SysOrgPerson;
import com.landray.kmss.common.model.BaseModel;
import com.landray.kmss.common.convertor.ModelToFormPropertyMap;
import com.landray.kmss.common.convertor.ModelConvertor_ModelListToString;
import com.landray.kmss.common.convertor.ModelConvertor_ModelListToFormList;

import com.landray.kmss.sys.organization.model.SysOrgElement;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcCustomer;

import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcCustomerForm;
import com.landray.kmss.sys.organization.forms.SysOrgElementForm;



/**
 * 客户信息表
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcCustomer  extends BaseModel {

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
	 * 创建时间
	 */
	private Date docCreateTime;
	
	/**
	 * @return 创建时间
	 */
	public Date getDocCreateTime() {
		return this.docCreateTime;
	}
	
	/**
	 * @param docCreateTime 创建时间
	 */
	public void setDocCreateTime(Date docCreateTime) {
		this.docCreateTime = docCreateTime;
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
	

	//机制开始
	//机制结束

	public Class<ChenyeeQcCustomerForm> getFormClass() {
		return ChenyeeQcCustomerForm.class;
	}

	private static ModelToFormPropertyMap toFormPropertyMap;

	public ModelToFormPropertyMap getToFormPropertyMap() {
		if (toFormPropertyMap == null) {
			toFormPropertyMap = new ModelToFormPropertyMap();
			toFormPropertyMap.putAll(super.getToFormPropertyMap());
			toFormPropertyMap.put("docCreator.fdId", "docCreatorId");
			toFormPropertyMap.put("docCreator.fdName", "docCreatorName");
		}
		return toFormPropertyMap;
	}
}
