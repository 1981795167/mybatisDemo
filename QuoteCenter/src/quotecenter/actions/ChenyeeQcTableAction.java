package com.landray.kmss.chenyee.quotecenter.actions;

import javax.servlet.http.HttpServletRequest;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcHardware;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcHardwareService;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcTableService;
import com.landray.kmss.common.actions.ExtendAction;
import com.landray.kmss.common.dao.HQLInfo;
import com.landray.kmss.common.service.IBaseService;
import com.landray.kmss.util.CriteriaUtil;
import com.landray.kmss.util.CriteriaValue;

 
/**
 * 硬件信息表 Action
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcTableAction extends ExtendAction {
	protected IChenyeeQcTableService chenyeeQcTableService;

	protected IBaseService getServiceImp(HttpServletRequest request) {
		if(chenyeeQcTableService == null){
			chenyeeQcTableService = (IChenyeeQcTableService)getBean("chenyeeQcTableAction");
		}
		return chenyeeQcTableService;
	}

	protected void changeFindPageHQLInfo(HttpServletRequest request,
			HQLInfo hqlInfo) throws Exception {
		super.changeFindPageHQLInfo(request, hqlInfo);		
		CriteriaValue cv = new CriteriaValue(request);
		CriteriaUtil.buildHql(cv, hqlInfo, ChenyeeQcHardware.class);
	}
}

