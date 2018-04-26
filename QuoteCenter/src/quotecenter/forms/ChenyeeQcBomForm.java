package com.landray.kmss.chenyee.quotecenter.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionMapping;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcBom;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcProduct;
import com.landray.kmss.common.convertor.FormConvertor_IDToModel;
import com.landray.kmss.common.convertor.FormToModelPropertyMap;
import com.landray.kmss.common.forms.ExtendForm;



/**
 * bom信息 Form
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcBomForm  extends ExtendForm  {

	/**
	 * 母件名称
	 */
	private String fdBomName;
	
	/**
	 * @return 母件名称
	 */
	public String getFdBomName() {
		return this.fdBomName;
	}
	
	/**
	 * @param fdBomName 母件名称
	 */
	public void setFdBomName(String fdBomName) {
		this.fdBomName = fdBomName;
	}
	
	/**
	 * Bom成本价
	 */
	private String fdBomPrice;
	
	/**
	 * @return Bom成本价
	 */
	public String getFdBomPrice() {
		return this.fdBomPrice;
	}
	
	/**
	 * @param fdBomPrice Bom成本价
	 */
	public void setFdBomPrice(String fdBomPrice) {
		this.fdBomPrice = fdBomPrice;
	}
	
	/**
	 * 母件编码
	 */
	private String fdBomCode;
	
	/**
	 * @return 母件编码
	 */
	public String getFdBomCode() {
		return this.fdBomCode;
	}
	
	/**
	 * @param fdBomCode 母件编码
	 */
	public void setFdBomCode(String fdBomCode) {
		this.fdBomCode = fdBomCode;
	}
	
	/**
	 * 工厂
	 */
	private String fdFactory;
	
	/**
	 * @return 工厂
	 */
	public String getFdFactory() {
		return this.fdFactory;
	}
	
	/**
	 * @param fdFactory 工厂
	 */
	public void setFdFactory(String fdFactory) {
		this.fdFactory = fdFactory;
	}
	
	/**
	 * 用途
	 */
	private String fdApplication;
	
	/**
	 * @return 用途
	 */
	public String getFdApplication() {
		return this.fdApplication;
	}
	
	/**
	 * @param fdApplication 用途
	 */
	public void setFdApplication(String fdApplication) {
		this.fdApplication = fdApplication;
	}
	
	/**
	 * 版本说明
	 */
	private String fdVersionDescription;
	
	/**
	 * @return 版本说明
	 */
	public String getFdVersionDescription() {
		return this.fdVersionDescription;
	}
	
	/**
	 * @param fdVersionDescription 版本说明
	 */
	public void setFdVersionDescription(String fdVersionDescription) {
		this.fdVersionDescription = fdVersionDescription;
	}
	
	/**
	 * 版本
	 */
	private String fdVersion;
	
	/**
	 * @return 版本
	 */
	public String getFdVersion() {
		return this.fdVersion;
	}
	
	/**
	 * @param fdVersion 版本
	 */
	public void setFdVersion(String fdVersion) {
		this.fdVersion = fdVersion;
	}
	
	/**
	 * 物料编码
	 */
	private String fdMaterielCode;
	
	/**
	 * @return 物料编码
	 */
	public String getFdMaterielCode() {
		return this.fdMaterielCode;
	}
	
	/**
	 * @param fdMaterielCode 物料编码
	 */
	public void setFdMaterielCode(String fdMaterielCode) {
		this.fdMaterielCode = fdMaterielCode;
	}
	
	/**
	 * 大小量纲
	 */
	private String fdDimension;
	
	/**
	 * @return 大小量纲
	 */
	public String getFdDimension() {
		return this.fdDimension;
	}
	
	/**
	 * @param fdDimension 大小量纲
	 */
	public void setFdDimension(String fdDimension) {
		this.fdDimension = fdDimension;
	}
	
	/**
	 * 价格
	 */
	private String fdMaterielPrice;
	
	/**
	 * @return 价格
	 */
	public String getFdMaterielPrice() {
		return this.fdMaterielPrice;
	}
	
	/**
	 * @param fdMaterielPrice 价格
	 */
	public void setFdMaterielPrice(String fdMaterielPrice) {
		this.fdMaterielPrice = fdMaterielPrice;
	}
	
	/**
	 * 序号
	 */
	private String fdSerialNumber;
	
	/**
	 * @return 序号
	 */
	public String getFdSerialNumber() {
		return this.fdSerialNumber;
	}
	
	/**
	 * @param fdSerialNumber 序号
	 */
	public void setFdSerialNumber(String fdSerialNumber) {
		this.fdSerialNumber = fdSerialNumber;
	}
	
	/**
	 * 物料描述
	 */
	private String fdMaterialDescription;
	
	/**
	 * @return 物料描述
	 */
	public String getFdMaterialDescription() {
		return this.fdMaterialDescription;
	}
	
	/**
	 * @param fdMaterialDescription 物料描述
	 */
	public void setFdMaterialDescription(String fdMaterialDescription) {
		this.fdMaterialDescription = fdMaterialDescription;
	}
	
	/**
	 * Bom成本总价更新时间
	 */
	private String fdBomPriceUpdateTime;
	
	/**
	 * @return Bom成本总价更新时间
	 */
	public String getFdBomPriceUpdateTime() {
		return this.fdBomPriceUpdateTime;
	}
	
	/**
	 * @param fdBomPriceUpdateTime Bom成本总价更新时间
	 */
	public void setFdBomPriceUpdateTime(String fdBomPriceUpdateTime) {
		this.fdBomPriceUpdateTime = fdBomPriceUpdateTime;
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
		fdBomName = null;
		fdBomPrice = null;
		fdBomCode = null;
		fdFactory = null;
		fdApplication = null;
		fdVersionDescription = null;
		fdVersion = null;
		fdMaterielCode = null;
		fdDimension = null;
		fdMaterielPrice = null;
		fdSerialNumber = null;
		fdMaterialDescription = null;
		fdBomPriceUpdateTime = null;
		
		fdProductId = null;
 
		super.reset(mapping, request);
	}

	public Class<ChenyeeQcBom> getModelClass() {
		return ChenyeeQcBom.class;
	}
	
	private static FormToModelPropertyMap toModelPropertyMap;

	public FormToModelPropertyMap getToModelPropertyMap() {
		if (toModelPropertyMap == null) {
			toModelPropertyMap = new FormToModelPropertyMap();
			toModelPropertyMap.putAll(super.getToModelPropertyMap());
			
			//chenyee liuxf 2018.3.19 add start
			toModelPropertyMap.put("fdProductId",
					new FormConvertor_IDToModel("fdProduct",
							ChenyeeQcProduct.class));
			//chenyee liuxf 2018.3.19 add end
		}
		return toModelPropertyMap;
	}
}
