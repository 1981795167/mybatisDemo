package com.landray.kmss.chenyee.quotecenter.actions;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcSetpercentForm;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcSetpercent;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcSetpercentService;
import com.landray.kmss.common.actions.ExtendAction;
import com.landray.kmss.common.dao.HQLInfo;
import com.landray.kmss.common.service.IBaseService;
import com.landray.kmss.util.CriteriaUtil;
import com.landray.kmss.util.CriteriaValue;
import com.landray.kmss.util.DateUtil;
import com.landray.kmss.util.UserUtil;

import net.sf.json.JSONArray;

 
/**
 * 预设比例表 Action
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcSetpercentAction extends ExtendAction {
	protected IChenyeeQcSetpercentService chenyeeQcSetpercentService;

	protected IBaseService getServiceImp(HttpServletRequest request) {
		if(chenyeeQcSetpercentService == null){
			chenyeeQcSetpercentService = (IChenyeeQcSetpercentService)getBean("chenyeeQcSetpercentService");
		}
		return chenyeeQcSetpercentService;
	}
	
	public IChenyeeQcSetpercentService getSetpercentService(HttpServletRequest request) {
		return (IChenyeeQcSetpercentService)getServiceImp(request);
	}

	protected void changeFindPageHQLInfo(HttpServletRequest request,
			HQLInfo hqlInfo) throws Exception {
		super.changeFindPageHQLInfo(request, hqlInfo);		
		CriteriaValue cv = new CriteriaValue(request);
		CriteriaUtil.buildHql(cv, hqlInfo, ChenyeeQcSetpercent.class);
	}
	
	public ActionForward loadPresetPercent(ActionMapping mapping,ActionForm form, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		JSONArray percent = getSetpercentService(request).loadPresetPercent();
		if(percent != null) {
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(percent.toString());
		}
		return null;
	}
	
	@Override
	public ActionForward save(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		((ChenyeeQcSetpercentForm)form).setDocCreateTime(DateUtil.convertDateToString(new Date(),
 				DateUtil.TYPE_DATETIME, request.getLocale()));
         ((ChenyeeQcSetpercentForm)form).setFdUpdateTime(DateUtil.convertDateToString(new Date(),
 				DateUtil.TYPE_DATETIME, request.getLocale()));
         ((ChenyeeQcSetpercentForm)form).setDocCreatorId(UserUtil.getUser().getFdId());
         ((ChenyeeQcSetpercentForm)form).setDocCreatorName(UserUtil.getUser().getFdName());
		return super.save(mapping, form, request, response);
	}
	
	@Override
	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		((ChenyeeQcSetpercentForm)form).setFdUpdateTime(DateUtil.convertDateToString(new Date(),
 				DateUtil.TYPE_DATETIME, request.getLocale()));
		return super.update(mapping, form, request, response);
	}
	@Override
	public ActionForward view(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//为保持一个预设比例，每回查看前删除所有，插入一条数据
		getSetpercentService(request).addPercent();
		return super.view(mapping, form, request, response);
	}
}

