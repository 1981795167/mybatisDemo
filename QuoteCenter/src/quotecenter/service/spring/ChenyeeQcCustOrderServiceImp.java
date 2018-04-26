package com.landray.kmss.chenyee.quotecenter.service.spring;

import java.util.List;

import com.landray.kmss.chenyee.quotecenter.dao.IChenyeeQcCustOrderDao;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcCustOrder;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcCustOrderService;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataServiceImp;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 客户定制价目表业务接口实现
 * 
 * @author
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcCustOrderServiceImp extends ExtendDataServiceImp implements IChenyeeQcCustOrderService {

	public IChenyeeQcCustOrderDao getCustOrderDao() {
		return (IChenyeeQcCustOrderDao) this.getBaseDao();
	}

	@Override
	public JSONArray getCustomerPrice(String customerName, String productId, String romram) {
		List<ChenyeeQcCustOrder> custOrders = getCustOrderDao().getCustomerPrice(
				customerName, productId, romram);

		JSONArray result = new JSONArray();
		if (custOrders != null && custOrders.size() > 0) {
			for (ChenyeeQcCustOrder custOrder : custOrders) {
				JSONObject jCustOrder = new JSONObject();
				jCustOrder.put("bottomPrice", custOrder.getFdBottomPrice());
				jCustOrder.put("productPrice", custOrder.getFdProductPrice());
				if (custOrder.getFdPercent() != null) {
					double percent = custOrder.getFdPercent();
					jCustOrder.put("bottomPercent", percent);
				}
				result.add(jCustOrder);
			}
		}
		return result;
	}

	@Override
	public List<ChenyeeQcCustOrder> getCustOrderInfoWithProductId(String id) {
		// TODO Auto-generated method stub
		return getCustOrderDao().getCustOrderInfoWithProductId(id);
	}

}
