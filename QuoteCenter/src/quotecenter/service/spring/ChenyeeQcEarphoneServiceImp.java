package com.landray.kmss.chenyee.quotecenter.service.spring;
import java.util.List;

import com.landray.kmss.chenyee.quotecenter.dao.IChenyeeQcEarphoneDao;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcEarphone;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcEarphoneService;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataServiceImp;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 耳机档位表业务接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcEarphoneServiceImp extends ExtendDataServiceImp implements IChenyeeQcEarphoneService {

	private IChenyeeQcEarphoneDao getEarPhoneDao() {
		return (IChenyeeQcEarphoneDao) this.getBaseDao();
	}
	
	@Override
	public JSONArray getEarPhone(String productId) {
		List<ChenyeeQcEarphone> earphones = 
				(List<ChenyeeQcEarphone>)getEarPhoneDao().findByProductId(productId);
		
		JSONArray result = new JSONArray();
		if(earphones != null) {
			for(ChenyeeQcEarphone earphone : earphones) {
				JSONObject jEar = new JSONObject();
				jEar.put("defaultPrice", earphone.getFdDefaultPrice());
				jEar.put("highPrice", earphone.getFdHighPrice());
				jEar.put("midPrice", earphone.getFdMidPrice());
				jEar.put("lowPrice", earphone.getFdLowPrice());
				result.add(jEar);
			}
		}
		return result;
	}

}
