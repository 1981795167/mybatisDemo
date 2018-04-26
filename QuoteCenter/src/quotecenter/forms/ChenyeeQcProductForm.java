package com.landray.kmss.chenyee.quotecenter.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionMapping;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcCustOrder;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcProduct;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcRomRam;
import com.landray.kmss.common.convertor.FormConvertor_FormListToModelList;
import com.landray.kmss.common.convertor.FormConvertor_IDToModel;
import com.landray.kmss.common.convertor.FormConvertor_IDsToModelList;
import com.landray.kmss.common.convertor.FormToModelPropertyMap;
import com.landray.kmss.common.forms.ExtendForm;
import com.landray.kmss.sys.attachment.forms.AttachmentDetailsForm;
import com.landray.kmss.sys.attachment.forms.IAttachmentForm;
import com.landray.kmss.sys.organization.model.SysOrgElement;
import com.landray.kmss.util.AutoArrayList;
import com.landray.kmss.util.AutoHashMap;



/**
 * 产品信息表 Form
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcProductForm  extends ExtendForm  implements IAttachmentForm{

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
	 * 制式
	 */
	private String fdStandard;
	
	/**
	 * @return 制式
	 */
	public String getFdStandard() {
		return this.fdStandard;
	}
	
	/**
	 * @param fdStandard 制式
	 */
	public void setFdStandard(String fdStandard) {
		this.fdStandard = fdStandard;
	}
	
	/**
	 * 安卓版本
	 */
	private String fdAndroidVersion;
	
	/**
	 * @return 安卓版本
	 */
	public String getFdAndroidVersion() {
		return this.fdAndroidVersion;
	}
	
	/**
	 * @param fdAndroidVersion 安卓版本
	 */
	public void setFdAndroidVersion(String fdAndroidVersion) {
		this.fdAndroidVersion = fdAndroidVersion;
	}
	
	/**
	 * 后置摄像头
	 */
	private String fdRearCamera;
	
	/**
	 * @return 后置摄像头
	 */
	public String getFdRearCamera() {
		return this.fdRearCamera;
	}
	
	/**
	 * @param fdRearCamera 后置摄像头
	 */
	public void setFdRearCamera(String fdRearCamera) {
		this.fdRearCamera = fdRearCamera;
	}
	
	/**
	 * 电池容量
	 */
	private String fdBatteryCapacity;
	
	/**
	 * @return 电池容量
	 */
	public String getFdBatteryCapacity() {
		return this.fdBatteryCapacity;
	}
	
	/**
	 * @param fdBatteryCapacity 电池容量
	 */
	public void setFdBatteryCapacity(String fdBatteryCapacity) {
		this.fdBatteryCapacity = fdBatteryCapacity;
	}
	
	/**
	 * 前置摄像头
	 */
	private String fdFrontCamera;
	
	/**
	 * @return 前置摄像头
	 */
	public String getFdFrontCamera() {
		return this.fdFrontCamera;
	}
	
	/**
	 * @param fdFrontCamera 前置摄像头
	 */
	public void setFdFrontCamera(String fdFrontCamera) {
		this.fdFrontCamera = fdFrontCamera;
	}
	
	/**
	 * 屏幕大小
	 */
	private String fdScreeSize;
	
	/**
	 * @return 屏幕大小
	 */
	public String getFdScreeSize() {
		return this.fdScreeSize;
	}
	
	/**
	 * @param fdScreeSize 屏幕大小
	 */
	public void setFdScreeSize(String fdScreeSize) {
		this.fdScreeSize = fdScreeSize;
	}
	
	/**
	 * 硬件平台
	 */
	private String fdHardwarePlatform;
	
	/**
	 * @return 硬件平台
	 */
	public String getFdHardwarePlatform() {
		return this.fdHardwarePlatform;
	}
	
	/**
	 * @param fdHardwarePlatform 硬件平台
	 */
	public void setFdHardwarePlatform(String fdHardwarePlatform) {
		this.fdHardwarePlatform = fdHardwarePlatform;
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
	
	/**
	 * BomID的ID
	 */
	private String fdBomId;
	
	/**
	 * @return BomID的ID
	 */
	public String getFdBomId() {
		return this.fdBomId;
	}
	
	/**
	 * @param fdBomId BomID的ID
	 */
	public void setFdBomId(String fdBomId) {
		this.fdBomId = fdBomId;
	}
	
	/**
	 * BomID的名称
	 */
	private String fdBomName;
	
	/**
	 * @return BomID的名称
	 */
	public String getFdBomName() {
		return this.fdBomName;
	}
	
	/**
	 * @param fdBomName BomID的名称
	 */
	public void setFdBomName(String fdBomName) {
		this.fdBomName = fdBomName;
	}
	
	/**
	 * 采购ID的ID
	 */
	private String fdPurchaseId;
	
	/**
	 * @return 采购ID的ID
	 */
	public String getFdPurchaseId() {
		return this.fdPurchaseId;
	}
	
	/**
	 * @param fdPurchaseId 采购ID的ID
	 */
	public void setFdPurchaseId(String fdPurchaseId) {
		this.fdPurchaseId = fdPurchaseId;
	}
	
	/**
	 * 采购ID的名称
	 */
	private String fdPurchaseName;
	
	/**
	 * @return 采购ID的名称
	 */
	public String getFdPurchaseName() {
		return this.fdPurchaseName;
	}
	
	/**
	 * @param fdPurchaseName 采购ID的名称
	 */
	public void setFdPurchaseName(String fdPurchaseName) {
		this.fdPurchaseName = fdPurchaseName;
	}
	
	/**
	 * 硬件ID的ID
	 */
	private String fdHardwareId;
	
	/**
	 * @return 硬件ID的ID
	 */
	public String getFdHardwareId() {
		return this.fdHardwareId;
	}
	
	/**
	 * @param fdHardwareId 硬件ID的ID
	 */
	public void setFdHardwareId(String fdHardwareId) {
		this.fdHardwareId = fdHardwareId;
	}
	
	/**
	 * 硬件ID的名称
	 */
	private String fdHardwareName;
	
	/**
	 * @return 硬件ID的名称
	 */
	public String getFdHardwareName() {
		return this.fdHardwareName;
	}
	
	/**
	 * @param fdHardwareName 硬件ID的名称
	 */
	public void setFdHardwareName(String fdHardwareName) {
		this.fdHardwareName = fdHardwareName;
	}
	
	/**
	 * 耳机ID的ID
	 */
	private String fdEarphoneId;
	
	/**
	 * @return 耳机ID的ID
	 */
	public String getFdEarphoneId() {
		return this.fdEarphoneId;
	}
	
	/**
	 * @param fdEarphoneId 耳机ID的ID
	 */
	public void setFdEarphoneId(String fdEarphoneId) {
		this.fdEarphoneId = fdEarphoneId;
	}
	
	/**
	 * 耳机ID的名称
	 */
	private String fdEarphoneName;
	
	/**
	 * @return 耳机ID的名称
	 */
	public String getFdEarphoneName() {
		return this.fdEarphoneName;
	}
	
	/**
	 * @param fdEarphoneName 耳机ID的名称
	 */
	public void setFdEarphoneName(String fdEarphoneName) {
		this.fdEarphoneName = fdEarphoneName;
	}
	
	/**
	 * rom_ram的ID列表
	 */
	private String fdRomramIds;
	
	/**
	 * @return rom_ram的ID列表
	 */
	public String getFdRomramIds() {
		return this.fdRomramIds;
	}
	
	/**
	 * @param fdRomramIds rom_ram的ID列表
	 */
	public void setFdRomramIds(String fdRomramIds) {
		this.fdRomramIds = fdRomramIds;
	}
	
	/**
	 * rom_ram的名称列表
	 */
	private String fdRomramNames;
	
	/**
	 * @return rom_ram的名称列表
	 */
	public String getFdRomramNames() {
		return this.fdRomramNames;
	}
	
	/**
	 * @param fdRomramNames rom_ram的名称列表
	 */
	public void setFdRomramNames(String fdRomramNames) {
		this.fdRomramNames = fdRomramNames;
	}
	
	/**
	 * 客户定制价目表集合的ID列表
	 */
	private String fdCustomerOrderIds;
	
	/**
	 * @return 客户定制价目表集合的ID列表
	 */
	public String getFdCustomerOrderIds() {
		return this.fdCustomerOrderIds;
	}
	
	/**
	 * @param fdCustomerOrderIds 客户定制价目表集合的ID列表
	 */
	public void setFdCustomerOrderIds(String fdCustomerOrderIds) {
		this.fdCustomerOrderIds = fdCustomerOrderIds;
	}
	
	/**
	 * 客户定制价目表集合的名称列表
	 */
	private String fdCustomerOrderNames;
	
	/**
	 * @return 客户定制价目表集合的名称列表
	 */
	public String getFdCustomerOrderNames() {
		return this.fdCustomerOrderNames;
	}
	
	/**
	 * @param fdCustomerOrderNames 客户定制价目表集合的名称列表
	 */
	public void setFdCustomerOrderNames(String fdCustomerOrderNames) {
		this.fdCustomerOrderNames = fdCustomerOrderNames;
	}
	
	//liuxf 2018.3.16 add
	 /**
     * rom+ram
     */
    protected AutoArrayList romRamForms = new AutoArrayList(ChenyeeQcRomRamForm.class);
    
    /**
     * 客户定制价目
     */
    protected AutoArrayList custOrderForms = new AutoArrayList(ChenyeeQcCustOrderForm.class);
    
   
    public AutoArrayList getRomRamForms() {
		return romRamForms;
	}

	public void setRomRamForms(AutoArrayList romRamForms) {
		this.romRamForms = romRamForms;
	}

	public AutoArrayList getCustOrderForms() {
		return custOrderForms;
	}

	public void setCustOrderForms(AutoArrayList custOrderForms) {
		this.custOrderForms = custOrderForms;
	}
	//liuxf 2018.3.16 add
	
	//liuxf 2018.3.21 add start
	private AutoArrayList fdHardwareForm = new AutoArrayList(ChenyeeQcHardwareForm.class);
	
	public AutoArrayList getFdHardwareForm() {
		return fdHardwareForm;
	}

	public void setFdHardwareForm(AutoArrayList fdHardwareForm) {
		this.fdHardwareForm = fdHardwareForm;
	}
	
    private AutoArrayList fdPurchaseForm = new AutoArrayList(ChenyeeQcPurchaseForm.class);
	
	public AutoArrayList getFdPurchaseForm() {
		return fdPurchaseForm;
	}

	public void setFdPurchaseForm(AutoArrayList fdPurchaseForm) {
		this.fdPurchaseForm = fdPurchaseForm;
	}
	
    private AutoArrayList fdEarphoneForm = new AutoArrayList(ChenyeeQcEarphoneForm.class);
	
	public AutoArrayList getFdEarphoneForm() {
		return fdEarphoneForm;
	}

	public void setFdEarphoneForm(AutoArrayList fdEarphoneForm) {
		this.fdEarphoneForm = fdEarphoneForm;
	}
	
    private AutoArrayList fdBomForm = new AutoArrayList(ChenyeeQcBomForm.class);
	
	public AutoArrayList getFdBomForm() {
		return fdBomForm;
	}

	public void setFdBomForm(AutoArrayList fdBomForm) {
		this.fdBomForm = fdBomForm;
	}
	
	//liuxf 2018.3.21 add end
	
	//机制开始 
	//机制结束

	

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		fdProjectName = null;
		fdStandard = null;
		fdAndroidVersion = null;
		fdRearCamera = null;
		fdBatteryCapacity = null;
		fdFrontCamera = null;
		fdScreeSize = null;
		fdHardwarePlatform = null;
		docCreateTime = null;
		fdUpdateTime = null;
		docCreatorId = null;
		docCreatorName = null;
		fdBomId = null;
		fdBomName = null;
		fdPurchaseId = null;
		fdPurchaseName = null;
		fdHardwareId = null;
		fdHardwareName = null;
		fdEarphoneId = null;
		fdEarphoneName = null;
		fdRomramIds = null;
		fdRomramNames = null;
		fdCustomerOrderIds = null;
		fdCustomerOrderNames = null;
		
		//liuxf 2018.3.16 add start
		romRamForms = new AutoArrayList(ChenyeeQcRomRamForm.class);
		custOrderForms = new AutoArrayList(ChenyeeQcCustOrderForm.class);
		//liuxf 2018.3.16 add end

		//liuxf 2018.3.21 add start
		fdHardwareForm = new AutoArrayList(ChenyeeQcHardwareForm.class);
		fdPurchaseForm = new AutoArrayList(ChenyeeQcPurchaseForm.class);
		fdEarphoneForm = new AutoArrayList(ChenyeeQcEarphoneForm.class);
		fdBomForm = new AutoArrayList(ChenyeeQcBomForm.class);
		
		//liuxf 2018.3.21 add end
		
		super.reset(mapping, request);
	}

	

	public Class<ChenyeeQcProduct> getModelClass() {
		return ChenyeeQcProduct.class;
	}
	
	private static FormToModelPropertyMap toModelPropertyMap;

	public FormToModelPropertyMap getToModelPropertyMap() {
		if (toModelPropertyMap == null) {
			toModelPropertyMap = new FormToModelPropertyMap();
			toModelPropertyMap.putAll(super.getToModelPropertyMap());
			toModelPropertyMap.put("docCreatorId",
					new FormConvertor_IDToModel("docCreator",
						SysOrgElement.class));
			
			toModelPropertyMap.put("fdRomramIds", new FormConvertor_IDsToModelList(
					"fdRomrams", ChenyeeQcRomRam.class));
			toModelPropertyMap.put("fdCustomerOrderIds", new FormConvertor_IDsToModelList(
					"fdCustomerOrders", ChenyeeQcCustOrder.class));
			
			//liuxf 2018.3.16 add start
			toModelPropertyMap.put("romRamForms",
					new FormConvertor_FormListToModelList("fdRomrams",
							"fdProduct"));
			toModelPropertyMap.put("custOrderForms",
					new FormConvertor_FormListToModelList("fdCustomerOrders",
							"fdProduct"));
			//liuxf 2018.3.16 add end
			
			//liuxf 2018.3.21 add start
			
			toModelPropertyMap.put("fdHardwareForm",
					new FormConvertor_FormListToModelList("fdHardware",
							"fdProduct"));
			toModelPropertyMap.put("fdPurchaseForm",
					new FormConvertor_FormListToModelList("fdPurchase",
							"fdProduct"));
			toModelPropertyMap.put("fdEarphoneForm",
					new FormConvertor_FormListToModelList("fdEarphone",
							"fdProduct"));
			toModelPropertyMap.put("fdBomForm",
					new FormConvertor_FormListToModelList("fdBom",
							"fdProduct"));
			//liuxf 2018.3.21 add end
		}
		return toModelPropertyMap;
	}

	/**
     * 附件实现
     */
	AutoHashMap autoHashMap = new AutoHashMap(AttachmentDetailsForm.class);
	
	@Override
	public AutoHashMap getAttachmentForms() {
		// TODO Auto-generated method stub
		return autoHashMap;
	}
}
