package com.landray.kmss.chenyee.quotecenter.forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionMapping;
import org.aspectj.weaver.AjAttribute.PrivilegedAttribute;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcApply;
import com.landray.kmss.common.convertor.FormConvertor_IDToModel;
import com.landray.kmss.common.convertor.FormToModelPropertyMap;
import com.landray.kmss.common.forms.ExtendForm;
import com.landray.kmss.sys.attachment.forms.AttachmentDetailsForm;
import com.landray.kmss.sys.attachment.forms.IAttachmentForm;
import com.landray.kmss.sys.organization.model.SysOrgElement;
import com.landray.kmss.sys.workflow.interfaces.ISysWfMainForm;
import com.landray.kmss.sys.workflow.interfaces.SysWfBusinessForm;
import com.landray.kmss.util.AutoHashMap;



/**
 * 报价申请 Form
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcApplyForm  extends ExtendForm implements ISysWfMainForm, IAttachmentForm {

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
	private String fdMembrane;
	
	/**
	 * @return 钢化膜
	 */
	public String getFdMembrane() {
		return this.fdMembrane;
	}
	
	/**
	 * @param fdMembrane 钢化膜
	 */
	public void setFdMembrane(String fdMembrane) {
		this.fdMembrane = fdMembrane;
	}
	
	/**
	 * 皮套
	 */
	private String fdHolster;
	
	/**
	 * @return 皮套
	 */
	public String getFdHolster() {
		return this.fdHolster;
	}
	
	/**
	 * @param fdHolster 皮套
	 */
	public void setFdHolster(String fdHolster) {
		this.fdHolster = fdHolster;
	}
	
	/**
	 * 耳机价格
	 */
	private String fdPrice;
	
	/**
	 * @return 耳机价格
	 */
	public String getFdPrice() {
		return this.fdPrice;
	}
	
	/**
	 * @param fdPrice 耳机价格
	 */
	public void setFdPrice(String fdPrice) {
		this.fdPrice = fdPrice;
	}
	
	/**
	 * 最低售价
	 */
	private String fdBottomPrice;
	
	/**
	 * @return 最低售价
	 */
	public String getFdBottomPrice() {
		return this.fdBottomPrice;
	}
	
	/**
	 * @param fdBottomPrice 最低售价
	 */
	public void setFdBottomPrice(String fdBottomPrice) {
		this.fdBottomPrice = fdBottomPrice;
	}
	
	/**
	 * 成本价
	 */
	private String fdCostPrice;
	
	/**
	 * @return 成本价
	 */
	public String getFdCostPrice() {
		return this.fdCostPrice;
	}
	
	/**
	 * @param fdCostPrice 成本价
	 */
	public void setFdCostPrice(String fdCostPrice) {
		this.fdCostPrice = fdCostPrice;
	}
	
	/**
	 * 申请报价
	 */
	private String fdApplicationPrice;
	
	/**
	 * @return 申请报价
	 */
	public String getFdApplicationPrice() {
		return this.fdApplicationPrice;
	}
	
	/**
	 * @param fdApplicationPrice 申请报价
	 */
	public void setFdApplicationPrice(String fdApplicationPrice) {
		this.fdApplicationPrice = fdApplicationPrice;
	}
	
	/**
	 * 申请时间
	 */
	private String fdApplicationTime;
	
	/**
	 * @return 申请时间
	 */
	public String getFdApplicationTime() {
		return this.fdApplicationTime;
	}
	
	/**
	 * @param fdApplicationTime 申请时间
	 */
	public void setFdApplicationTime(String fdApplicationTime) {
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
	 * 申请报价比例
	 */
	private String fdApplyQuotePercent;
	
	/**
	 * @return 申请报价比例
	 */
	public String getFdApplyQuotePercent() {
		return this.fdApplyQuotePercent;
	}
	
	/**
	 * @param fdApplyQuotePercent 申请报价比例
	 */
	public void setFdApplyQuotePercent(String fdApplyQuotePercent) {
		this.fdApplyQuotePercent = fdApplyQuotePercent;
	}
	
	/**
	 * 毛利率
	 */
	private String fdGm;
	
	/**
	 * @return 毛利率
	 */
	public String getFdGm() {
		return this.fdGm;
	}
	
	/**
	 * @param fdGm 毛利率
	 */
	public void setFdGm(String fdGm) {
		this.fdGm = fdGm;
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
		
		rfVersion = null;
		rfPrice = null;
		boxName = null;
		boxPrice = null;
		partsName = null;
		partsPrice = null;
		other = null;
		otherPrice = null;
		
		fdAndroidVersion = null;
		fdRearCamera = null;
		fdBatteryCapacity = null;
		fdFrontCamera = null;
		fdScreeSize = null;
		fdHardwarePlatform = null;
		fdApplicationTitle = null;
		fdProjectName = null;
		fdCustomerName = null;
		fdRomRam = null;
		fdMembrane = null;
		fdHolster = null;
		fdPrice = null;
		fdBottomPrice = null;
		fdCostPrice = null;
		fdApplicationPrice = null;
		fdApplicationTime = null;
		docStatus = null;
		fdQuotePath = null;
		fdPresetPercent = null;
		fdApplyQuotePercent = null;
		fdGm = null;
		docCreatorId = null;
		docCreatorName = null;
		sysWfBusinessForm = new SysWfBusinessForm();
 
		super.reset(mapping, request);
	}

	public Class<ChenyeeQcApply> getModelClass() {
		return ChenyeeQcApply.class;
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

	//附件
	AutoHashMap autoHashMap = new AutoHashMap(AttachmentDetailsForm.class);
	
	@Override
	public AutoHashMap getAttachmentForms() {
		return autoHashMap;
	}

	//流程
	private SysWfBusinessForm sysWfBusinessForm = new SysWfBusinessForm();

	public SysWfBusinessForm getSysWfBusinessForm() {
		return sysWfBusinessForm;
	}

	@Override
	public String toString() {
		return "ChenyeeQcApplyForm [fdApplicationTitle=" + fdApplicationTitle + ", fdProjectName=" + fdProjectName
				+ ", fdCustomerName=" + fdCustomerName + ", fdRomRam=" + fdRomRam + ", fdMembrane=" + fdMembrane
				+ ", fdHolster=" + fdHolster + ", fdPrice=" + fdPrice + ", fdBottomPrice=" + fdBottomPrice
				+ ", fdCostPrice=" + fdCostPrice + ", fdApplicationPrice=" + fdApplicationPrice + ", fdApplicationTime="
				+ fdApplicationTime + ", docStatus=" + docStatus + ", fdQuotePath=" + fdQuotePath + ", fdPresetPercent="
				+ fdPresetPercent + ", fdApplyQuotePercent=" + fdApplyQuotePercent + ", fdGm=" + fdGm
				+ ", docCreatorId=" + docCreatorId + ", docCreatorName=" + docCreatorName + "]";
	}
	
	
}
