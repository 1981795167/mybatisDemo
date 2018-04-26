package com.landray.kmss.chenyee.quotecenter.service.spring;
import java.util.List;

import com.landray.kmss.chenyee.quotecenter.dao.IChenyeeQcRomRamDao;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcRomRam;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcRomRamService;
import com.landray.kmss.sys.metadata.interfaces.ExtendDataServiceImp;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * rom_ram价目表业务接口实现
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcRomRamServiceImp extends ExtendDataServiceImp implements IChenyeeQcRomRamService {

	public IChenyeeQcRomRamDao getRomRamDao() {
		return (IChenyeeQcRomRamDao)this.getBaseDao();
	}
	
	@Override
	public JSONArray getRomRam(String productId) {
		List<ChenyeeQcRomRam> romRams = (List<ChenyeeQcRomRam>) getRomRamDao().findByProductId(productId);
		
		JSONArray result = new JSONArray();
		if(romRams != null) {
			for(ChenyeeQcRomRam romRam : romRams) {
				JSONObject jRomRam = new JSONObject();
				jRomRam.put("romId", romRam.getFdId());
				jRomRam.put("productPrice", romRam.getFdProductPrice());
				jRomRam.put("romRam", romRam.getFdRomRam());
				result.add(jRomRam);
			}
		}
		return result;
	}

}
