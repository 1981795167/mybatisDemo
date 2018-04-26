package com.landray.kmss.chenyee.quotecenter.dao.hibernate;

import com.landray.kmss.common.model.IBaseModel;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataDaoImp;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcCustOrder;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcProduct;
import com.landray.kmss.chenyee.quotecenter.util.ComomUtil;
import com.landray.kmss.util.UserUtil;
import java.util.Date;
import java.util.Iterator;

import com.landray.kmss.chenyee.quotecenter.dao.IChenyeeQcProductDao;
import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcCustOrderForm;
import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcEarphoneForm;
import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcHardwareForm;
import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcProductForm;
import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcPurchaseForm;
import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcRomRamForm;

import java.util.List;
import org.hibernate.Query;

/**
 * 产品信息表数据访问接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcProductDaoImp extends ExtendDataDaoImp implements IChenyeeQcProductDao {
	
	public String add(IBaseModel modelObj) throws Exception {
		ChenyeeQcProduct createInfoModel = (ChenyeeQcProduct) modelObj;
		if (createInfoModel.getDocCreator() == null) {
			// 创建者
			createInfoModel.setDocCreator(UserUtil.getUser());
		}
		if (createInfoModel.getDocCreateTime() == null) {
			// 创建时间
			createInfoModel.setDocCreateTime(new Date());
		}
		return super.add(modelObj);
	}


	@Override
	public List<ChenyeeQcProduct> getProductName() {
		StringBuilder builder = new StringBuilder();
		builder.append("select quote.fdId, quote.fdProjectName from ");
		builder.append(ChenyeeQcProduct.class.getName() + " quote ");
		Query query = getHibernateSession().createQuery(builder.toString());
		return query.list();
	}


	@Override
	public List<ChenyeeQcProduct> queryAll() {
		StringBuilder builder = new StringBuilder();
		builder.append(" from ");
		builder.append(ChenyeeQcProduct.class.getName() + " quote ");
		Query query = getHibernateSession().createQuery(builder.toString());
		return query.list();
	}


	@Override
	public List<ChenyeeQcCustOrder> getCustOrderInfoByProductId(String productId) {
		StringBuilder builder = new StringBuilder();
		builder.append("from chenyee_qc_cust_order group by fdCustomerName");
		Query query = getHibernateSession().createQuery(builder.toString());
		return query.list();
	}


	@Override
	public void setUpdateTime(String fdId,String execModel) {
		StringBuilder builder = new StringBuilder();
		Date date = new Date();
		if("product".equals(execModel)){
			builder.append("update ChenyeeQcProduct t set t.fdUpdateTime = :date");
			builder.append(" where fdId = :fdId");
		}else if("hardware".equals(execModel)){
			builder.append("update ChenyeeQcHardWare t set t.fdUpdateTime = :date");
			builder.append(" where t.fdProductId = :fdId");
		}else if("purchase".equals(execModel)){
			builder.append("update ChenyeeQcPurchase t set t.fdUpdateTime = :date");
			builder.append(" where t.fdProductId = :fdId");
		}else if("sale".equals(execModel)){
			builder.append("update ChenyeeQcCustOrder t set t.fdUpdateTime = :date");
			builder.append(" where fdProductId = :fdId");
		}
		Query query = getHibernateSession().createQuery(builder.toString());
		query.setParameter("date", date);
		query.setParameter("fdId", fdId);
		query.executeUpdate();
		}
	
	@Override
	public Long getCountByProductId(String productId,String whichModule) {
		StringBuilder  sb = new StringBuilder();
		String hql = null;
		if("hardware".equals(whichModule)){
			hql = "select count(*) from ChenyeeQcHardware where fdProduct.fdId =:fdProductId";
		}else if("purchase".equals(whichModule)){
			hql = "select count(*) from ChenyeeQcPurchase where fdProduct.fdId =:fdProductId";
		}
		sb.append(hql);
		Query query = getHibernateSession().createQuery(sb.toString());
		query.setParameter("fdProductId", productId);
		return (Long)query.uniqueResult();
	}


	@Override
	public void updateProductInfo(ChenyeeQcProductForm chenyeeQcProductForm) {
		String hql = "update ChenyeeQcProduct set ";
		StringBuilder  sb = new StringBuilder(hql);
		String productId = chenyeeQcProductForm.getFdId();
		String projectName = chenyeeQcProductForm.getFdProjectName();
		String androidVersion = chenyeeQcProductForm.getFdAndroidVersion();
		String frontCamera = chenyeeQcProductForm.getFdFrontCamera();
		String rearCamera = chenyeeQcProductForm.getFdRearCamera();
		String batteryCapacity= chenyeeQcProductForm.getFdBatteryCapacity();
		String hardwarePlatform = chenyeeQcProductForm.getFdHardwarePlatform();
		String screeSize = chenyeeQcProductForm.getFdScreeSize();
		if(null!=projectName){
			sb.append("fdProjectName=:projectName,");
		}
		if(null!=androidVersion){
			sb.append("fdAndroidVersion=:androidVersion,");
		}
		if(null!=frontCamera){
			sb.append("fdFrontCamera=:frontCamera,");
		}
		if(null!=batteryCapacity){
			sb.append("fdBatteryCapacity=:batteryCapacity,");
		}
		if(null!=rearCamera){
			sb.append("fdRearCamera=:rearCamera,");
		}
		if(null!=hardwarePlatform){
			sb.append("fdHardwarePlatform=:hardwarePlatform,");
		}
		if(null!=screeSize){
			sb.append("fdScreeSize=:screeSize,");
		}
		if(sb.toString().contains(",")){
			sb = new StringBuilder(sb.toString().substring(0,sb.toString().lastIndexOf(",")));
			sb.append(",fdUpdateTime=:updateTime");
			sb.append(",docCreator.fdId=:docCreatorId");
			sb.append(" where fdId=:productId");
			Query query = getHibernateSession().createQuery(sb.toString());
			query.setParameter("projectName", projectName);
			query.setParameter("androidVersion", androidVersion);
			query.setParameter("frontCamera", frontCamera);
			query.setParameter("batteryCapacity", batteryCapacity);
			query.setParameter("rearCamera", rearCamera);
			query.setParameter("hardwarePlatform", hardwarePlatform);
			query.setParameter("screeSize", screeSize);
			query.setParameter("productId", productId);
			query.setParameter("updateTime", new Date());
			query.setParameter("docCreatorId",UserUtil.getUser().getFdId());
			query.executeUpdate();
		}
	}


	@Override
	public void updateHardWareInfo(ChenyeeQcProductForm chenyeeQcProductForm) {
		String productId = chenyeeQcProductForm.getFdId();
		ChenyeeQcHardwareForm chenyeeQcHardwareForm = (ChenyeeQcHardwareForm)chenyeeQcProductForm.getFdHardwareForm().get(0);
		Double hardWarePrice = chenyeeQcHardwareForm.getFdHardwarePrice();
        if(chenyeeQcHardwareForm.getFdHardwarePrice()!=null){
        	String hql = "update ChenyeeQcHardware set fdHardwarePrice=:hardWarePrice,fdUpdateTime=:updateTime where fdProduct.fdId=:productId";
        	Query query = getHibernateSession().createQuery(hql);
        	query.setParameter("hardWarePrice", hardWarePrice);
        	query.setParameter("updateTime", new Date());
        	query.setParameter("productId", productId);
        	query.executeUpdate();
        }		
	}


	@Override
	public void addHardWareInfo(ChenyeeQcProductForm chenyeeQcProductForm) {
		String productId = chenyeeQcProductForm.getFdId();
		String sql = "insert into chenyee_qc_hardware(fd_id,fd_hardware_price,fd_update_time,fd_product_id,doc_creator_id,position) values(?,?,?,?,?,0)";
		ChenyeeQcHardwareForm chenyeeQcHardwareForm = (ChenyeeQcHardwareForm)chenyeeQcProductForm.getFdHardwareForm().get(0);
		Double hardWarePrice = chenyeeQcHardwareForm.getFdHardwarePrice();
		Query query = getHibernateSession().createSQLQuery(sql);
		query.setParameter(0, ComomUtil.getUUID());
		query.setParameter(1, hardWarePrice);
		query.setParameter(2, new Date());
		query.setParameter(3, productId);
		query.setParameter(4, UserUtil.getUser().getFdId());
		query.executeUpdate();
	}


	@Override
	public void addPurchaseInfo(ChenyeeQcProductForm chenyeeQcProductForm) {
		System.out.println("enter addpurchaseinfo");
		String productId = chenyeeQcProductForm.getFdId();
	    ChenyeeQcPurchaseForm chenyeeQcPurchaseForm = (ChenyeeQcPurchaseForm)chenyeeQcProductForm.getFdPurchaseForm().get(0);
	    Double manufacturePrice = chenyeeQcPurchaseForm.getFdManufacturePrice();
	    Double standbyPrice = chenyeeQcPurchaseForm.getFdStandbyPrice();
	    Double financialPrice = chenyeeQcPurchaseForm.getFdFinancialPrice();
	    Double logisticsPrice = chenyeeQcPurchaseForm.getFdLogisticsPrice();
	    Double qualcommPatentPrice = chenyeeQcPurchaseForm.getFdQualcommPatentPrice();
	    Double softwarePatentPrice = chenyeeQcPurchaseForm.getFdSoftwarePatentPrice();
	    Double holster = chenyeeQcPurchaseForm.getFdHolster();
	    Double membrane = chenyeeQcPurchaseForm.getFdMembrane();
	    String creatorId = UserUtil.getUser().getFdId();
		String sql = "insert into chenyee_qc_purchase(fd_id,fd_manufacture_price,fd_standby_price,fd_financial_price,fd_logistics_price,"
				                                   + "fd_qualcomm_patent_price,fd_software_patent_price,fd_holster,fd_membrane,"
				                                   + "fd_update_time,doc_creator_id,fd_product_id,position)"
				                            + "values("
				                                   + "?,?,?,?,?,?,?,?,?,?,?,?,?"
				                                   + ")";
		Query query = getHibernateSession().createSQLQuery(sql);
		query.setParameter(0, ComomUtil.getUUID());
		query.setParameter(1, manufacturePrice);
		query.setParameter(2, standbyPrice);
		query.setParameter(3, financialPrice);
		query.setParameter(4, logisticsPrice);
		query.setParameter(5, qualcommPatentPrice);
		query.setParameter(6, softwarePatentPrice);
		query.setParameter(7, holster);
		query.setParameter(8, membrane);
		query.setParameter(9, new Date());
		query.setParameter(10, creatorId);
		query.setParameter(11, productId);
		query.setParameter(12, 0);
		query.executeUpdate();
		System.out.println("leave addPurchaseInfo");
	}


	@Override
	public void updatePurchaseInfo(ChenyeeQcProductForm chenyeeQcProductForm) {
	    ChenyeeQcPurchaseForm chenyeeQcPurchaseForm = (ChenyeeQcPurchaseForm)chenyeeQcProductForm.getFdPurchaseForm().get(0);
	    String id = chenyeeQcProductForm.getFdId();
	    Double manufacturePrice = chenyeeQcPurchaseForm.getFdManufacturePrice();
	    Double standbyPrice = chenyeeQcPurchaseForm.getFdStandbyPrice();
	    Double financialPrice = chenyeeQcPurchaseForm.getFdFinancialPrice();
	    Double logisticsPrice = chenyeeQcPurchaseForm.getFdLogisticsPrice();
	    Double qualcommPatentPrice = chenyeeQcPurchaseForm.getFdQualcommPatentPrice();
	    Double softwarePatentPrice = chenyeeQcPurchaseForm.getFdSoftwarePatentPrice();
	    Double holster = chenyeeQcPurchaseForm.getFdHolster();
	    Double membrane = chenyeeQcPurchaseForm.getFdMembrane();
	    String creatorId = UserUtil.getUser().getFdId();
	    String sql = "update chenyee_qc_purchase set fd_manufacture_price=?,fd_standby_price=?,fd_financial_price=?,"
				      +"fd_qualcomm_patent_price=?,fd_software_patent_price=?,fd_holster=?,fd_membrane=?"
				      +"fd_update_time=?,doc_creator_id=? where fd_id=?";
	    Query query = getHibernateSession().createSQLQuery(sql);
		query.setParameter(0, manufacturePrice);
		query.setParameter(1, standbyPrice);
		query.setParameter(2, financialPrice);
		query.setParameter(3, logisticsPrice);
		query.setParameter(4, qualcommPatentPrice);
		query.setParameter(5, softwarePatentPrice);
		query.setParameter(6, holster);
		query.setParameter(7, membrane);
		query.setParameter(8, new Date());
		query.setParameter(9, creatorId);
		query.setParameter(10, id);
		query.executeUpdate();
	}


	@Override
	public void addEarphoneInfo(ChenyeeQcProductForm chenyeeQcProductForm) {
		System.out.println("enter addEarphoneInfo");
		String productId = chenyeeQcProductForm.getFdId();
		ChenyeeQcEarphoneForm chenyeeQcEarphoneForm = (ChenyeeQcEarphoneForm)chenyeeQcProductForm.getFdEarphoneForm().get(0);
		Double lowPrice= chenyeeQcEarphoneForm.getFdLowPrice();
		Double midPrice = chenyeeQcEarphoneForm.getFdMidPrice();
		Double highPrice= chenyeeQcEarphoneForm.getFdHighPrice();
		Double defaultPrice= chenyeeQcEarphoneForm.getFdDefaultPrice();
		
		String sql = "insert into chenyee_qc_earphone(fd_id,fd_low_price,fd_mid_price,fd_high_price,fd_default_price,fd_product_id,position)"
				     +"values("
				            +"?,?,?,?,?,?,?"
				           + ")";
		Query query = getHibernateSession().createSQLQuery(sql);
		query.setParameter(0, ComomUtil.getUUID());
		query.setParameter(1, lowPrice);
		query.setParameter(2, midPrice);
		query.setParameter(3, highPrice);
		query.setParameter(4, defaultPrice);
		query.setParameter(5, productId);
		query.setParameter(6, 0);
		query.executeUpdate();
		System.out.println("leave addEarphoneInfo");
	}


	@Override
	public void updateEarphoneInfo(ChenyeeQcProductForm chenyeeQcProductForm) {
		ChenyeeQcEarphoneForm chenyeeQcEarphoneForm = (ChenyeeQcEarphoneForm)chenyeeQcProductForm.getFdPurchaseForm().get(0);
		String id = chenyeeQcEarphoneForm.getFdId();
		String sql = "update chenyee_qc_earphone set fd_low_price=?,fd_mid_price=?,fd_high_price=?,fd_default_price=? where fd_id=?";
		Double lowPrice= chenyeeQcEarphoneForm.getFdLowPrice();
		Double midPrice = chenyeeQcEarphoneForm.getFdMidPrice();
		Double highPrice= chenyeeQcEarphoneForm.getFdHighPrice();
		Double defaultPrice= chenyeeQcEarphoneForm.getFdDefaultPrice();
		Query query = getHibernateSession().createSQLQuery(sql);
		query.setParameter(0, lowPrice);
		query.setParameter(1, midPrice);
		query.setParameter(2, highPrice);
		query.setParameter(3, defaultPrice);
		query.setParameter(4, id);
		query.executeUpdate();
	}


	@Override
	public void addRomRamInfo(ChenyeeQcProductForm chenyeeQcProductForm) {
		System.out.println("enter addRomRamInfo");
		String productId = chenyeeQcProductForm.getFdId();
		String projectName = chenyeeQcProductForm.getFdProjectName();
		List<ChenyeeQcRomRamForm>  romRamForms = chenyeeQcProductForm.getRomRamForms();
		Iterator<ChenyeeQcRomRamForm> iterator= romRamForms.iterator();
		int i =0;
		while(iterator.hasNext()){
			ChenyeeQcRomRamForm  chenyeeQcRomRamForm = iterator.next();
			String romRam = chenyeeQcRomRamForm.getFdRomRam();
			Double bomPrice = chenyeeQcRomRamForm.getFdBomPrice();
			Double purchasePrice = chenyeeQcRomRamForm.getFdPurchasePrice();
			String creatorId = UserUtil.getUser().getFdId();
			int position = i;
			
			/**
			 * 插入chenyee_qc_rom_ram表sql语句
			 */
			String sql_rom_ram = "insert into chenyee_qc_rom_ram(fd_id,fd_rom_ram,fd_bom_price,fd_purchase_price,"
					                                          + "fd_product_id,doc_creator_id,position)"
					                                   + "values("
					                                           +"?,?,?,?,?,?,?" 
					                                         + ")";
			 Query rom_ram_query = getHibernateSession().createSQLQuery(sql_rom_ram);
			 rom_ram_query.setParameter(0, ComomUtil.getUUID());
			 rom_ram_query.setParameter(1, romRam);
			 rom_ram_query.setParameter(2, bomPrice);
			 rom_ram_query.setParameter(3, purchasePrice);
			 rom_ram_query.setParameter(4, productId);
			 rom_ram_query.setParameter(5, creatorId);
			 rom_ram_query.setParameter(6, position);
			 rom_ram_query.executeUpdate();
			
			/**
			 * 插入chenyee_qc_cust_order语句
			 */
			String sql_cust_order = "insert into chenyee_qc_cust_order(fd_id,fd_project_name,fd_rom_ram,fd_update_time,"
	                                                                 + "fd_product_id,doc_creator_id,position)"
	                                                          + "values("
	                                                                   +"?,?,?,?,?,?,?" 
	                                                                 +")" ;
		   Query cust_order_query = getHibernateSession().createSQLQuery(sql_cust_order);
		   cust_order_query.setParameter(0, ComomUtil.getUUID());
		   cust_order_query.setParameter(1, projectName);
		   cust_order_query.setParameter(2, romRam);
		   cust_order_query.setParameter(3, new Date());
		   cust_order_query.setParameter(4, productId);
		   cust_order_query.setParameter(5, creatorId);
		   cust_order_query.setParameter(6, position);
		   cust_order_query.executeUpdate();
		   
		   i++;
		   System.out.println("leave addRomRamInfo");
		}
	}


	@Override
	public void delEarPhoneInfoByProductId(String productId) {
        String sql = "delete from chenyee_qc_earphone where fd_product_id=?";	
        Query query = getHibernateSession().createSQLQuery(sql);
        query.setParameter(0, productId);
        query.executeUpdate();
	}


	@Override
	public void delPurchaseInfoByProductId(String productId) {
		String sql = "delete from chenyee_qc_purchase where fd_product_id=?";	
        Query query = getHibernateSession().createSQLQuery(sql);
        query.setParameter(0, productId);
        query.executeUpdate();
	}


	@Override
	public void delRomRamInfoByProductId(String productId) {
		String sql = "delete from chenyee_qc_rom_ram where fd_product_id=?";	
        Query query = getHibernateSession().createSQLQuery(sql);
        query.setParameter(0, productId);
        query.executeUpdate();
	}


	@Override
	public void delCustOrderInfoByProductId(String productId) {
		String sql = "delete from chenyee_qc_cust_order where fd_product_id=?";	
        Query query = getHibernateSession().createSQLQuery(sql);
        query.setParameter(0, productId);
        query.executeUpdate();
	}


	@Override
	public void updateRomRamForProductByProductId(String productId,Double productPrice,String romRam,Double presetPercent) {
		if(null==presetPercent){
			presetPercent = 10.0;
		}
		Double presetBottomPrice = productPrice+productPrice*10.0/100;
        String sql = "update chenyee_qc_rom_ram set fd_product_price=?,fd_preset_percent = ?,fd_preset_bottom_price = ? where fd_product_id = ? and fd_rom_ram=?";
        Query query = getHibernateSession().createSQLQuery(sql);
        query.setParameter(0, productPrice);
        query.setParameter(1, presetPercent);
        query.setParameter(2, presetBottomPrice);
        query.setParameter(3, productId);
        query.setParameter(4, romRam);
        query.executeUpdate();
	}


	@Override
	public void updateCustOrderForProductByProductId(String productId,Double productPrice,String romRam,Double presetPercent) {
		if(null==presetPercent){
			presetPercent = 10.0;
		}
		Double presetBottomPrice = productPrice+productPrice*10.0/100;
		String sql = "update chenyee_qc_cust_order set fd_product_price=?,fd_update_time=? ,fd_percent = ?,fd_bottom_price = ? where fd_product_id = ? and fd_rom_ram=?";
        Query query = getHibernateSession().createSQLQuery(sql);
        query.setParameter(0, productPrice);
        query.setParameter(1, new Date());
        query.setParameter(2, presetPercent);
        query.setParameter(3, presetBottomPrice);
        query.setParameter(4, productId);
        query.setParameter(5, romRam);
        query.executeUpdate();
	}


	@Override
	public Double getPresetPercent() {
		String sql = "select  fd_preset_percent from chenyee_qc_setpercent fd_preset_percent";
		Query query = getHibernateSession().createSQLQuery(sql);
		Double presetPercent = (Double)query.uniqueResult();
		return presetPercent;
	}


	@Override
	public void deleteCustOrderInfoByProductId(String productId) {
		String sql = "delete from chenyee_qc_cust_order where productId = ?";
		Query query = getHibernateSession().createSQLQuery(sql);
		query.executeUpdate();
	}


	@Override
	public void addCustOrderInfo(ChenyeeQcProductForm chenyeeQcProductForm) {
		String productId = chenyeeQcProductForm.getFdId();
		String projectName = chenyeeQcProductForm.getFdProjectName();
		List<ChenyeeQcCustOrderForm> custOrderForms = chenyeeQcProductForm.getCustOrderForms();	
		Iterator<ChenyeeQcCustOrderForm> iterator = custOrderForms.iterator();
		int i = 0;
		
		while(iterator.hasNext()){
			int position = i;
			ChenyeeQcCustOrderForm chenyeeQcCustOrderForm = iterator.next();
			String customerName = chenyeeQcCustOrderForm.getFdCustomerName();
			String romRam = chenyeeQcCustOrderForm.getFdRomRam();
			Double bottomPrice = chenyeeQcCustOrderForm.getFdBottomPrice();
			Double percent = chenyeeQcCustOrderForm.getFdPercent();
			Double productPrice = chenyeeQcCustOrderForm.getFdProductPrice();
			String sql = "insert into chenyee_qc_cust_order(fd_id,fd_project_name,fd_customer_name,fd_rom_ram,fd_product_price,"
					                                    + "fd_bottom_price,fd_percent,fd_update_time,fd_product_id,doc_creator_id,position) "
					                                    + "values(?,?,?,?,?,?,?,?,?,?,?)";
			Query query = getHibernateSession().createSQLQuery(sql);
			query.setParameter(0, ComomUtil.getUUID());
			query.setParameter(1, projectName);
			query.setParameter(2, customerName);
			query.setParameter(3, romRam);
			query.setParameter(4, productPrice);
			query.setParameter(5, bottomPrice);
			query.setParameter(6, percent);
			query.setParameter(7, new Date());
			query.setParameter(8, productId);
			query.setParameter(9, UserUtil.getUser().getFdId());
			query.setParameter(10, position);
			query.executeUpdate();
			i++;
		}
	}


	@Override
	public void deleteHardwareInfoByProductIds(String[] productIds) {
		String sql = "delete from chenyee_qc_hardware where fd_product_id in (";
		StringBuilder sb = new StringBuilder(sql);
		for(String id:productIds){
			System.out.println(id);
			sb.append("'"+id+"'").append(",");
		}
		int position = sb.toString().lastIndexOf(",");
		sb = new StringBuilder(sb.toString().substring(0,position)).append(")");
		getHibernateSession().createSQLQuery(sb.toString()).executeUpdate();
		
	}


	@Override
	public void deletePurchaseInfoByProductIds(String[] productIds) {
		String sql = "delete from chenyee_qc_purchase where fd_product_id in (";
		StringBuilder sb = new StringBuilder(sql);
		for(String id:productIds){
			sb.append("'"+id+"'").append(",");
		}
		int position = sb.toString().lastIndexOf(",");
		sb = new StringBuilder(sb.toString().substring(0,position)).append(")");
		getHibernateSession().createSQLQuery(sb.toString()).executeUpdate();
		
	}


	@Override
	public void deleteEarphoneInfoByProductIds(String[] productIds) {
		String sql = "delete from chenyee_qc_earphone where fd_product_id in (";
		StringBuilder sb = new StringBuilder(sql);
		for(String id:productIds){
			sb.append("'"+id+"'").append(",");
		}
		int position = sb.toString().lastIndexOf(",");
		sb = new StringBuilder(sb.toString().substring(0,position)).append(")");
		getHibernateSession().createSQLQuery(sb.toString()).executeUpdate();
		
	}


	@Override
	public void deleteRomRamInfoByProductIds(String[] productIds) {
		String sql = "delete from chenyee_qc_rom_ram where fd_product_id in (";
		StringBuilder sb = new StringBuilder(sql);
		for(String id:productIds){
			sb.append("'"+id+"'").append(",");
		}
		int position = sb.toString().lastIndexOf(",");
		sb = new StringBuilder(sb.toString().substring(0,position)).append(")");
		getHibernateSession().createSQLQuery(sb.toString()).executeUpdate();
		
	}


	@Override
	public void deleteCustOrderInfoByProductIds(String[] productIds) {
		String sql = "delete from chenyee_qc_cust_order where fd_product_id in (";
		StringBuilder sb = new StringBuilder(sql);
		for(String id:productIds){
			sb.append("'"+id+"'").append(",");
		}
		int position = sb.toString().lastIndexOf(",");
		sb = new StringBuilder(sb.toString().substring(0,position)).append(")");
		getHibernateSession().createSQLQuery(sb.toString()).executeUpdate();
		
	}


	@Override
	public void deleteProductInfoByProductIds(String[] productIds) {
		String sql = "delete from chenyee_qc_product where fd_id in (";
		StringBuilder sb = new StringBuilder(sql);
		for(String id:productIds){
			sb.append("'"+id+"'").append(",");
		}
		int position = sb.toString().lastIndexOf(",");
		sb = new StringBuilder(sb.toString().substring(0,position)).append(")");
		getHibernateSession().createSQLQuery(sb.toString()).executeUpdate();
		
	}
}
