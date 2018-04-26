package com.landray.kmss.chenyee.quotecenter.dao;

import java.util.List;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcRomRam;
import com.landray.kmss.common.dao.IBaseDao;

/**
 * rom_ram价目表数据访问接口
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public interface IChenyeeQcRomRamDao extends IBaseDao {

	List<ChenyeeQcRomRam> findByProductId(String productId);

}
