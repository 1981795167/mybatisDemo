package com.landray.kmss.chenyee.quotecenter.service;

import com.landray.kmss.common.service.IBaseService;

import net.sf.json.JSONArray;
/**
 * 预设比例表业务对象接口
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public interface IChenyeeQcSetpercentService extends IBaseService {

	JSONArray loadPresetPercent();


	void addPercent();

}
