package com.landray.kmss.chenyee.quotecenter.dao;

import java.util.List;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcEarphone;
import com.landray.kmss.common.dao.IBaseDao;

/**
 * 耳机档位表数据访问接口
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public interface IChenyeeQcEarphoneDao extends IBaseDao {

	List<ChenyeeQcEarphone> findByProductId(String productId);

}
