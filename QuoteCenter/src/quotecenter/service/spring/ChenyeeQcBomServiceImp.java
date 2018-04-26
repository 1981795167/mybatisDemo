package com.landray.kmss.chenyee.quotecenter.service.spring;
import java.util.List;

import com.landray.kmss.chenyee.quotecenter.dao.IChenyeeQcBomDao;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcBom;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcBomService;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataServiceImp;

import net.sf.json.JSONArray;
/**
 * bom信息业务接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcBomServiceImp extends ExtendDataServiceImp implements IChenyeeQcBomService {

	public IChenyeeQcBomDao getBomDao() {
		return (IChenyeeQcBomDao) this.getBaseDao();
	}
	
	@Override
	public JSONArray loadBomCode(String productId) {
		List<ChenyeeQcBom> bomCode = getBomDao().loadBomCode(productId);
		if(bomCode != null && bomCode.size() > 0){
			String bomCodes[] = new String[bomCode.size()];
			for(int i = 0; i < bomCode.size(); i++)
				bomCodes[i] = ((ChenyeeQcBom)bomCode.get(i)).getFdBomCode();
			
			return JSONArray.fromObject(bomCodes);
		}
 		return null;
	}

	@Override
	public JSONArray loadBomInfo(String productId, String bomCode) {
		List<ChenyeeQcBom> bomInfo = getBomDao().loadBomInfo(productId,bomCode);
		if(bomInfo != null && bomInfo.size() > 0)
			return JSONArray.fromObject(bomInfo);
		
		return null;
	}

	@Override
	public JSONArray loadBomListInfo(String productId, String bomCode) {
		List<ChenyeeQcBom> bomListInfo = getBomDao().loadBomListInfo(productId,bomCode);
		if(bomListInfo != null && bomListInfo.size() > 0)
			return JSONArray.fromObject(bomListInfo);
		
		return null;
	}

	
}
