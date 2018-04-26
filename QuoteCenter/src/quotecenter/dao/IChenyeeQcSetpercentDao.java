package com.landray.kmss.chenyee.quotecenter.dao;

import java.util.List;

import com.landray.kmss.common.dao.IBaseDao;

/**
 * 预设比例表数据访问接口
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public interface IChenyeeQcSetpercentDao extends IBaseDao {

	List loadPresetPercent();


	void addPercent(String fdId, double percent);

}
