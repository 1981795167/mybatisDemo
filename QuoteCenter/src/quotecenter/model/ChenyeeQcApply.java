package com.landray.kmss.chenyee.quotecenter.model;

import java.util.Date;

import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcApplyForm;
import com.landray.kmss.common.convertor.ModelToFormPropertyMap;
import com.landray.kmss.common.model.BaseModel;
import com.landray.kmss.sys.attachment.forms.AttachmentDetailsForm;
import com.landray.kmss.sys.attachment.model.IAttachment;
import com.landray.kmss.sys.organization.model.SysOrgPerson;
import com.landray.kmss.sys.workflow.interfaces.ISysWfMainModel;
import com.landray.kmss.sys.workflow.interfaces.SysWfBusinessModel;
import com.landray.kmss.util.AutoHashMap;



/**
 * 报价申请
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcApply  extends BaseModel implements ISysWfMainModel, IAttachment {

	private String rfVersion;
	private String rfPrice;
	private String boxName;
	private String boxPrice;
	private String partsName;
	private String partsPrice;
	private String other;
	private String otherPrice;
	
	
	
	public String getRfVersion() {
		return rfVersion;
	}

	public void setRfVersion(String rfVersion) {
		this.rfVersion = rfVersion;
	}

	public String getRfPrice() {
		return rfPrice;
	}

	public void setRfPrice(String rfPrice) {
		this.rfPrice = rfPrice;
	}

	public String getBoxName() {
		return boxName;
	}

	public void setBoxName(String boxName) {
		this.boxName = boxName;
	}

	public String getBoxPrice() {
		return boxPrice;
	}

	public void setBoxPrice(String boxPrice) {
		this.boxPrice = boxPrice;
	}

	public String getPartsName() {
		return partsName;
	}

	public void setPartsName(String partsName) {
		this.partsName = partsName;
	}

	public String getPartsPrice() {
		return partsPrice;
	}

	public void setPartsPrice(String partsPrice) {
		this.partsPrice = partsPrice;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getOtherPrice() {
		return otherPrice;
	}

	public void setOtherPrice(String otherPrice) {
		this.otherPrice = otherPrice;
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
	 * 申请单标题
	 */
	private String fdApplicationTitle;
	
	/**
	 * @return 申请单标题
	 */
	public String getFdApplicationTitle() {
		return this.fdApplicationTitle;
	}
	
	/**
	 * @param fdApplicationTitle 申请单标题
	 */
	public void setFdApplicationTitle(String fdApplicationTitle) {
		this.fdApplicationTitle = fdApplicationTitle;
	}
	
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
	 * 耳机价格
	 */
	private Double fdPrice;
	
	/**
	 * @return 耳机价格
	 */
	public Double getFdPrice() {
		return this.fdPrice;
	}
	
	/**
	 * @param fdPrice 耳机价格
	 */
	public void setFdPrice(Double fdPrice) {
		this.fdPrice = fdPrice;
	}
	
	/**
	 * 最低售价
	 */
	private Double fdBottomPrice;
	
	/**
	 * @return 最低售价
	 */
	public Double getFdBottomPrice() {
		return this.fdBottomPrice;
	}
	
	/**
	 * @param fdBottomPrice 最低售价
	 */
	public void setFdBottomPrice(Double fdBottomPrice) {
		this.fdBottomPrice = fdBottomPrice;
	}
	
	/**
	 * 成本价
	 */
	private Double fdCostPrice;
	
	/**
	 * @return 成本价
	 */
	public Double getFdCostPrice() {
		return this.fdCostPrice;
	}
	
	/**
	 * @param fdCostPrice 成本价
	 */
	public void setFdCostPrice(Double fdCostPrice) {
		this.fdCostPrice = fdCostPrice;
	}
	
	/**
	 * 申请报价
	 */
	private Double fdApplicationPrice;
	
	/**
	 * @return 申请报价
	 */
	public Double getFdApplicationPrice() {
		return this.fdApplicationPrice;
	}
	
	/**
	 * @param fdApplicationPrice 申请报价
	 */
	public void setFdApplicationPrice(Double fdApplicationPrice) {
		this.fdApplicationPrice = fdApplicationPrice;
	}
	
	/**
	 * 申请时间
	 */
	private Date fdApplicationTime;
	
	/**
	 * @return 申请时间
	 */
	public Date getFdApplicationTime() {
		return this.fdApplicationTime;
	}
	
	/**
	 * @param fdApplicationTime 申请时间
	 */
	public void setFdApplicationTime(Date fdApplicationTime) {
		this.fdApplicationTime = fdApplicationTime;
	}
	
	/**
	 * 审批状态
	 */
	private String docStatus;
	
	/**
	 * @return 审批状态
	 */
	public String getDocStatus() {
		return this.docStatus;
	}
	
	/**
	 * @param docStatus 审批状态
	 */
	public void setDocStatus(String docStatus) {
		this.docStatus = docStatus;
	}
	
	/**
	 * 报价单路径
	 */
	private String fdQuotePath;
	
	/**
	 * @return 报价单路径
	 */
	public String getFdQuotePath() {
		return this.fdQuotePath;
	}
	
	/**
	 * @param fdQuotePath 报价单路径
	 */
	public void setFdQuotePath(String fdQuotePath) {
		this.fdQuotePath = fdQuotePath;
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
	 * 申请报价比例
	 */
	private Double fdApplyQuotePercent;
	
	/**
	 * @return 申请报价比例
	 */
	public Double getFdApplyQuotePercent() {
		return this.fdApplyQuotePercent;
	}
	
	/**
	 * @param fdApplyQuotePercent 申请报价比例
	 */
	public void setFdApplyQuotePercent(Double fdApplyQuotePercent) {
		this.fdApplyQuotePercent = fdApplyQuotePercent;
	}
	
	/**
	 * 毛利率
	 */
	private Double fdGm;
	
	/**
	 * @return 毛利率
	 */
	public Double getFdGm() {
		return this.fdGm;
	}
	
	/**
	 * @param fdGm 毛利率
	 */
	public void setFdGm(Double fdGm) {
		this.fdGm = fdGm;
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

	public Class<ChenyeeQcApplyForm> getFormClass() {
		return ChenyeeQcApplyForm.class;
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
	
	//流程附件
	private SysWfBusinessModel sysWfBusinessModel = new SysWfBusinessModel();

	public SysWfBusinessModel getSysWfBusinessModel() {
		return sysWfBusinessModel;
	}
	
	AutoHashMap autoHashMap = new AutoHashMap(AttachmentDetailsForm.class);

	@Override
	public AutoHashMap getAttachmentForms() {
		return autoHashMap;
	}

	@Override
	public String getDocSubject() {
		return this.fdApplicationTitle;
	}

	@Override
	public Date getDocCreateTime() {
		return this.fdApplicationTime;
	}

	@Override
	public void setDocCreateTime(Date createTime) {
		this.setFdApplicationTime(createTime);
	}
}
