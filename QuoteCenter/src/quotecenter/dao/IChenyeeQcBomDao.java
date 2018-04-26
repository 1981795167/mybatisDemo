package com.landray.kmss.chenyee.quotecenter.dao;

import java.util.List;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcBom;
import com.landray.kmss.common.dao.IBaseDao;

/**
 * bom信息数据访问接口
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public interface IChenyeeQcBomDao extends IBaseDao {
	
	List<ChenyeeQcBom> loadBomCode(String productId);

	List<ChenyeeQcBom> loadBomInfo(String productId, String bomCode);

	List<ChenyeeQcBom> loadBomListInfo(String productId, String bomCode);

}
