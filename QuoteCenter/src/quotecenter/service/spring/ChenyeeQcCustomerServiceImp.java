package com.landray.kmss.chenyee.quotecenter.service.spring;
import java.util.List;

import com.landray.kmss.chenyee.quotecenter.dao.hibernate.ChenyeeQcCustomerDaoImp;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcCustomer;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcCustomerService;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataServiceImp;

import net.sf.json.JSONArray;
/**
 * 客户信息表业务接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcCustomerServiceImp extends ExtendDataServiceImp implements IChenyeeQcCustomerService {

	@Override
	public JSONArray getCustomerName() {
		List<ChenyeeQcCustomer> customers = ((ChenyeeQcCustomerDaoImp)getBaseDao()).getCustomerName();
		if(customers != null && customers.size() > 0) {
			return JSONArray.fromObject(customers);
		}
		
		return null;
	}

}
