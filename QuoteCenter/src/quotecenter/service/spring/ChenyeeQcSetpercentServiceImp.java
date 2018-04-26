package com.landray.kmss.chenyee.quotecenter.service.spring;
import java.util.List;

import com.landray.kmss.chenyee.quotecenter.dao.IChenyeeQcSetpercentDao;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcSetpercentService;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataServiceImp;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 预设比例表业务接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcSetpercentServiceImp extends ExtendDataServiceImp implements IChenyeeQcSetpercentService {

	//写死的预设比例id
	private static final String fdId = "1604f4b28bd38415fccehf54eaca579b";
	//写死的预设比例
	private static final double percent = 10.0;
	
	public IChenyeeQcSetpercentDao getPercentDao() {
		return (IChenyeeQcSetpercentDao)this.getBaseDao();
	}
	
	@Override
	public JSONArray loadPresetPercent() {
		List percent = getPercentDao().loadPresetPercent();
		//System.out.println("percent: " + percent.toString());
		JSONArray result = new JSONArray();
		if(percent != null && percent.size() > 0) {
			JSONObject jCustOrder = new JSONObject();
			jCustOrder.put("percent", percent.get(0));
			
			result.add(jCustOrder);
		}
		return result;
	}
	

	@Override
	public void addPercent() {
		getPercentDao().addPercent(fdId,percent);
		
	}

}
