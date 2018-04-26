package com.landray.kmss.chenyee.quotecenter.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionMapping;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcProduct;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcRomRam;
import com.landray.kmss.common.convertor.FormConvertor_IDToModel;
import com.landray.kmss.common.convertor.FormToModelPropertyMap;
import com.landray.kmss.common.forms.ExtendForm;
import com.landray.kmss.sys.organization.model.SysOrgElement;



/**
 * rom_ram价目表 Form
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcRomRamForm  extends ExtendForm  {

	
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
	 * Bom预估价
	 */
	private Double fdBomPrice;
	
	/**
	 * @return Bom预估价
	 */
	public Double getFdBomPrice() {
		return this.fdBomPrice;
	}
	
	/**
	 * @param fdBomPrice Bom预估价
	 */
	public void setFdBomPrice(Double fdBomPrice) {
		this.fdBomPrice = fdBomPrice;
	}
	
	/**
	 * 采购预估价
	 */
	private Double fdPurchasePrice;
	
	/**
	 * @return 采购预估价
	 */
	public Double getFdPurchasePrice() {
		return this.fdPurchasePrice;
	}
	
	/**
	 * @param fdPurchasePrice 采购预估价
	 */
	public void setFdPurchasePrice(Double fdPurchasePrice) {
		this.fdPurchasePrice = fdPurchasePrice;
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
	 * 预设比例
	 */
	private Double fdPresetPercent;
	
	/**
	 * @return 预设比例
	 */
	public Double getFdPresetPercent() {
		return this.fdPresetPercent;
	}
	
	/**
	 * @param fdPresetPercent 预设比例
	 */
	public void setFdPresetPercent(Double fdPresetPercent) {
		this.fdPresetPercent = fdPresetPercent;
	}
	
	/**
	 * 预设最低售价
	 */
	private Double fdPresetBottomPrice;
	
	/**
	 * @return 预设最低售价
	 */
	public Double getFdPresetBottomPrice() {
		return this.fdPresetBottomPrice;
	}
	
	/**
	 * @param fdPresetBottomPrice 预设最低售价
	 */
	public void setFdPresetBottomPrice(Double fdPresetBottomPrice) {
		this.fdPresetBottomPrice = fdPresetBottomPrice;
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
		fdRomRam = null;
		fdBomPrice = null;
		fdPurchasePrice = null;
		fdProductPrice = null;
		fdPresetPercent = null;
		fdPresetBottomPrice = null;
		fdProductId = null;
		docCreatorId = null;
		docCreatorName = null;
		
 
		super.reset(mapping, request);
	}

	public Class<ChenyeeQcRomRam> getModelClass() {
		return ChenyeeQcRomRam.class;
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
