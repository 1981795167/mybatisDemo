package com.landray.kmss.chenyee.quotecenter.service.spring;
import java.util.List;

import com.landray.kmss.chenyee.quotecenter.dao.IChenyeeQcPurchaseDao;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcPurchase;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcPurchaseService;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataServiceImp;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 采购费用表业务接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcPurchaseServiceImp extends ExtendDataServiceImp implements IChenyeeQcPurchaseService {

	public IChenyeeQcPurchaseDao getPurchaseDao() {
		return (IChenyeeQcPurchaseDao)this.getBaseDao();
	}
	
	@Override
	public JSONArray getPurchase(String productId) {
		List<ChenyeeQcPurchase> purchases = 
				(List<ChenyeeQcPurchase>) getPurchaseDao().findByProductId(productId);
		
		JSONArray result = new JSONArray();
		if(purchases != null) {
			for(ChenyeeQcPurchase purchase : purchases) {
				JSONObject jPur = new JSONObject();
				jPur.put("fdHolster", purchase.getFdHolster());
				jPur.put("fdMembrane", purchase.getFdMembrane());
				result.add(jPur);
			}
		}
		return result;
	}

}
