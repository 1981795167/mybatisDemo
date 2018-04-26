package com.landray.kmss.chenyee.quotecenter.model;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.FieldSelector;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.Collector;
import org.apache.lucene.search.Explanation;
import org.apache.lucene.search.Filter;
import org.apache.lucene.search.HitCollector;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Searchable;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.TopFieldDocs;
import org.apache.lucene.search.Weight;

import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcProductForm;
import com.landray.kmss.common.convertor.ModelConvertor_ModelListToFormList;
import com.landray.kmss.common.convertor.ModelConvertor_ModelListToString;
import com.landray.kmss.common.convertor.ModelToFormPropertyMap;
import com.landray.kmss.common.model.BaseModel;
import com.landray.kmss.sys.attachment.forms.AttachmentDetailsForm;
import com.landray.kmss.sys.attachment.model.IAttachment;
import com.landray.kmss.sys.organization.model.SysOrgPerson;
import com.landray.kmss.util.AutoHashMap;



/**
 * 产品信息表
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcProduct  extends BaseModel implements Searchable,IAttachment{

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
	
	//chenyee liuxf modify 2018.3.20 start
	/**
	 * BomID
	 */
	private List<ChenyeeQcBom> fdBom;
	
	/**
	 * @return BomID
	 */
	public List<ChenyeeQcBom> getFdBom() {
		return this.fdBom;
	}
	
	/**
	 * @param fdBom BomID
	 */
	public void setFdBom(List<ChenyeeQcBom> fdBom) {
		this.fdBom = fdBom;
	}
	
	/**
	 * 采购ID
	 */
	private List<ChenyeeQcPurchase> fdPurchase;
	
	/**
	 * @return 采购ID
	 */
	public List<ChenyeeQcPurchase> getFdPurchase() {
		return this.fdPurchase;
	}
	
	/**
	 * @param fdPurchase 采购ID
	 */
	public void setFdPurchase(List<ChenyeeQcPurchase> fdPurchase) {
		this.fdPurchase = fdPurchase;
	}
	
	
	/**
	 * 硬件ID
	 */
	private List<ChenyeeQcHardware> fdHardware;
	
	/**
	 * @return 硬件ID
	 */
	public List<ChenyeeQcHardware> getFdHardware() {
		return this.fdHardware;
	}
	
	/**
	 * @param fdHardware 硬件ID
	 */
	public void setFdHardware(List<ChenyeeQcHardware> fdHardware) {
		this.fdHardware = fdHardware;
	}
	
	
	/**
	 * 耳机ID
	 */
	private List<ChenyeeQcEarphone> fdEarphone;
	
	/**
	 * @return 耳机ID
	 */
	public List<ChenyeeQcEarphone> getFdEarphone() {
		return this.fdEarphone;
	}
	
	/**
	 * @param fdEarphone 耳机ID
	 */
	public void setFdEarphone(List<ChenyeeQcEarphone> fdEarphone) {
		this.fdEarphone = fdEarphone;
	}
	//chenyee liuxf modify 2018.3.21 end
	
	/**
	 * rom_ram
	 */
	private List<ChenyeeQcRomRam> fdRomrams;
	
	/**
	 * @return rom_ram
	 */
	public List<ChenyeeQcRomRam> getFdRomrams() {
		return this.fdRomrams;
	}
	
	/**
	 * @param fdRomrams rom_ram
	 */
	public void setFdRomrams(List<ChenyeeQcRomRam> fdRomrams) {
		this.fdRomrams = fdRomrams;
	}
	
	/**
	 * 客户定制价目表集合
	 */
	private List<ChenyeeQcCustOrder> fdCustomerOrders;
	
	/**
	 * @return 客户定制价目表集合
	 */
	public List<ChenyeeQcCustOrder> getFdCustomerOrders() {
		return this.fdCustomerOrders;
	}
	
	/**
	 * @param fdCustomerOrders 客户定制价目表集合
	 */
	public void setFdCustomerOrders(List<ChenyeeQcCustOrder> fdCustomerOrders) {
		this.fdCustomerOrders = fdCustomerOrders;
	}
	

	//机制开始
	//机制结束

	public Class<ChenyeeQcProductForm> getFormClass() {
		return ChenyeeQcProductForm.class;
	}

	private static ModelToFormPropertyMap toFormPropertyMap;

	public ModelToFormPropertyMap getToFormPropertyMap() {
		if (toFormPropertyMap == null) {
			toFormPropertyMap = new ModelToFormPropertyMap();
			toFormPropertyMap.putAll(super.getToFormPropertyMap());
			toFormPropertyMap.put("docCreator.fdId", "docCreatorId");
			toFormPropertyMap.put("docCreator.fdName", "docCreatorName");
			
			toFormPropertyMap.put("fdRomrams",
					new ModelConvertor_ModelListToString(
							"fdRomramIds:fdRomramNames", "fdId:fdId"));
			toFormPropertyMap.put("fdCustomerOrders",
					new ModelConvertor_ModelListToString(
							"fdCustomerOrderIds:fdCustomerOrderNames", "fdId:fdId"));
			//liuxf 2018.3.16 add start
			toFormPropertyMap.put("fdRomrams",
					new ModelConvertor_ModelListToFormList(
							"romRamForms"));
			toFormPropertyMap.put("fdCustomerOrders",
					new ModelConvertor_ModelListToFormList(
							"custOrderForms"));
			//liuxf 2018.3.16 add end
			
			//liuxf 2018.3.21 add start
			toFormPropertyMap.put("fdHardware",
					new ModelConvertor_ModelListToFormList(
							"fdHardwareForm"));
			toFormPropertyMap.put("fdBom",
					new ModelConvertor_ModelListToFormList(
							"fdBomForm"));
			toFormPropertyMap.put("fdPurchase",
					new ModelConvertor_ModelListToFormList(
							"fdPurchaseForm"));
			toFormPropertyMap.put("fdEarphone",
					new ModelConvertor_ModelListToFormList(
							"fdEarphoneForm"));
			
			//liuxf 2018.3.21 add end
		}
		return toFormPropertyMap;
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

	@Override
	public void close() throws IOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Document doc(int arg0) throws CorruptIndexException, IOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Document doc(int arg0, FieldSelector arg1)
			throws CorruptIndexException, IOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int docFreq(Term arg0) throws IOException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int[] docFreqs(Term[] arg0) throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Explanation explain(Weight arg0, int arg1) throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int maxDoc() throws IOException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Query rewrite(Query arg0) throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void search(Weight arg0, Filter arg1, HitCollector arg2)
			throws IOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void search(Weight arg0, Filter arg1, Collector arg2)
			throws IOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public TopDocs search(Weight arg0, Filter arg1, int arg2)
			throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TopFieldDocs search(Weight arg0, Filter arg1, int arg2, Sort arg3)
			throws IOException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String toString() {
		return "ChenyeeQcProduct [fdProjectName=" + fdProjectName + ", fdStandard=" + fdStandard + ", fdAndroidVersion="
				+ fdAndroidVersion + ", fdRearCamera=" + fdRearCamera + ", fdBatteryCapacity=" + fdBatteryCapacity
				+ ", fdFrontCamera=" + fdFrontCamera + ", fdScreeSize=" + fdScreeSize + ", fdHardwarePlatform="
				+ fdHardwarePlatform + ", docCreateTime=" + docCreateTime + ", fdUpdateTime=" + fdUpdateTime
				+ ", docCreator=" + docCreator + ", fdBom=" + fdBom + ", fdPurchase=" + fdPurchase + ", fdHardware="
				+ fdHardware + ", fdEarphone=" + fdEarphone + ", fdRomrams=" + fdRomrams + ", fdCustomerOrders="
				+ fdCustomerOrders + "]";
	}
	
}
