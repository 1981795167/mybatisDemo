package com.landray.kmss.chenyee.quotecenter.service.spring;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;

import com.landray.kmss.chenyee.quotecenter.dao.IChenyeeQcProductDao;
import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcHardwareForm;
import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcProductForm;
import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcRomRamForm;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcBom;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcProduct;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcProductService;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataServiceImp;
import com.landray.kmss.util.UserUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 产品信息表业务接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcProductServiceImp extends ExtendDataServiceImp implements IChenyeeQcProductService {

	public IChenyeeQcProductDao getProductDao() {
		return (IChenyeeQcProductDao) this.getBaseDao();
	}
	
	@Override
	public JSONArray getProductName() {
		List<ChenyeeQcProduct> quotes = getProductDao().getProductName();
		if(quotes != null && quotes.size() > 0) {
			return JSONArray.fromObject(quotes);
		}
		return null;
	}
	
	@Override
	public List<ChenyeeQcProduct> queryAll() {
		List<ChenyeeQcProduct> products = getProductDao().queryAll();
		if(products != null && products.size() > 0) {
			return products;
		}
		return null;
	}

	@Override
	public JSONObject loadProductInfo(String productId) throws Exception {
		ChenyeeQcProduct  chenyeeQcProduct = (ChenyeeQcProduct)findByPrimaryKey(productId, null, true);
		//chenyee_yht modify start 增加bom信息非空判断，去掉制式设置
		if(chenyeeQcProduct != null) {
			//System.out.println(chenyeeQcProduct.toString());
			List<ChenyeeQcBom> boms = chenyeeQcProduct.getFdBom();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("fdProjectName", chenyeeQcProduct.getFdProjectName());
			//jsonObject.put("fdStandard", chenyeeQcProduct.getFdStandard());
			jsonObject.put("fdAndroidVersion", chenyeeQcProduct.getFdAndroidVersion());
			jsonObject.put("fdRearCamera", chenyeeQcProduct.getFdRearCamera());
			jsonObject.put("fdBatteryCapacity", chenyeeQcProduct.getFdBatteryCapacity());
			jsonObject.put("fdFrontCamera", chenyeeQcProduct.getFdFrontCamera());
			jsonObject.put("fdScreeSize", chenyeeQcProduct.getFdScreeSize());
			jsonObject.put("fdHardwarePlatform", chenyeeQcProduct.getFdHardwarePlatform());
			jsonObject.put("bomName", boms == null || boms.size() == 0 ? "" : chenyeeQcProduct.getFdBom().get(0).getFdBomName());
			return jsonObject;
			//chenyee_yht modify end 增加bom信息非空判断，去掉制式设置
			/*JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setExcludes(new String[]{"handler","hibernateLazyInitializer"});
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			JSONObject jsonObject = JSONObject.fromObject(chenyeeQcProduct, jsonConfig);
			return jsonObject;*/
		}
		return null;
	}
	
	@Override
	public ChenyeeQcProduct queryProductInfo(String productId) throws Exception {
		ChenyeeQcProduct  chenyeeQcProduct = (ChenyeeQcProduct)findByPrimaryKey(productId, null, true);
		return chenyeeQcProduct;
	}

	@Override
	public Long getCountByProductId(String productId,String whichModule) {
		return getProductDao().getCountByProductId(productId,whichModule);
	}

	@Override
	public void updateProductModuleInfo(ChenyeeQcProductForm chenyeeQcProductForm) {
		  Double presetPercent = getProductDao().getPresetPercent();
		  String productId = chenyeeQcProductForm.getFdId();
		  List<ChenyeeQcRomRamForm> romRamForms = chenyeeQcProductForm.getRomRamForms();
		  getProductDao().updateProductInfo(chenyeeQcProductForm);
		  if(null!=romRamForms){
			  Iterator<ChenyeeQcRomRamForm> iterator = romRamForms.iterator();
			  while(iterator.hasNext()){
				  ChenyeeQcRomRamForm chenyeeQcRomRamForm= iterator.next();
				  String romRam = chenyeeQcRomRamForm.getFdRomRam();
				  Double productPrice = chenyeeQcRomRamForm.getFdProductPrice();
				  getProductDao().updateRomRamForProductByProductId(productId, productPrice,romRam,presetPercent);
				  getProductDao().updateCustOrderForProductByProductId(productId, productPrice, romRam,presetPercent);
			  }
		  }
	}

	@Override
	public void updateHardWareInfo(ChenyeeQcProductForm chenyeeQcProductForm) {
          getProductDao().updateHardWareInfo(chenyeeQcProductForm);		
	}

	@Override
	public void addHardWareInfo(ChenyeeQcProductForm chenyeeQcProductForm) {
		getProductDao().addHardWareInfo(chenyeeQcProductForm);
	}

	@Override
	public void addPurchaseModuleInfo(ChenyeeQcProductForm chenyeeQcProductForm) {
		getProductDao().addPurchaseInfo(chenyeeQcProductForm);
		getProductDao().addEarphoneInfo(chenyeeQcProductForm);
		getProductDao().addRomRamInfo(chenyeeQcProductForm);
	}

	/**
	 * 更新采购模块信息:先删除与采购模块相关表信息,再插入页面信息
	 */
	@Override
	public void updatePurchaseModuleInfo(ChenyeeQcProductForm chenyeeQcProductForm) {
		String productId = chenyeeQcProductForm.getFdId();
		getProductDao().delEarPhoneInfoByProductId(productId);
		getProductDao().delPurchaseInfoByProductId(productId);
		getProductDao().delRomRamInfoByProductId(productId);
		getProductDao().delCustOrderInfoByProductId(productId);
		this.addPurchaseModuleInfo(chenyeeQcProductForm);
	}

	@Override
	public void updateSaleModuleInfo(ChenyeeQcProductForm chenyeeQcProductForm) {
		String productId = chenyeeQcProductForm.getFdId();
		getProductDao().delCustOrderInfoByProductId(productId);
		getProductDao().addCustOrderInfo(chenyeeQcProductForm);
		
	}

	@Override
	public void deleteProductModuleInfo(String[] productIds) {
       if(null!=productIds&&productIds.length>0){
    	 getProductDao().deleteHardwareInfoByProductIds(productIds);
    	 getProductDao().deletePurchaseInfoByProductIds(productIds);
    	 getProductDao().deleteEarphoneInfoByProductIds(productIds);
    	 getProductDao().deleteRomRamInfoByProductIds(productIds);
    	 getProductDao().deleteCustOrderInfoByProductIds(productIds);
    	 getProductDao().deleteProductInfoByProductIds(productIds);
       }		
	}  

}
