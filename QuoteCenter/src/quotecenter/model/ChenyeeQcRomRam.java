package com.landray.kmss.chenyee.quotecenter.model;

import java.util.Date;

import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcRomRamForm;
import com.landray.kmss.common.convertor.ModelToFormPropertyMap;
import com.landray.kmss.common.model.BaseModel;
import com.landray.kmss.sys.organization.model.SysOrgPerson;



/**
 * rom_ram价目表
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcRomRam  extends BaseModel {
	
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

	public Class<ChenyeeQcRomRamForm> getFormClass() {
		return ChenyeeQcRomRamForm.class;
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
