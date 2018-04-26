package com.landray.kmss.chenyee.quotecenter.dao;

import java.util.List;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcApply;
import com.landray.kmss.common.dao.IBaseDao;

/**
 * 报价申请数据访问接口
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public interface IChenyeeQcApplyDao extends IBaseDao {

	/**
	 * 更新报价单
	 * @param oldValue 
	 * @param newValue
	 * @param fieldName 字段名（fdProjectName, fdCustomerName）
	 * @return  更新记录条数
	 */
	public int updateApplyBill(String oldValue, String newValue, String fieldName);
	

	
	
}
