package com.landray.kmss.chenyee.quotecenter.actions;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcCustomerForm;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcCustomer;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcCustomerService;
import com.landray.kmss.common.actions.ExtendAction;
import com.landray.kmss.common.dao.HQLInfo;
import com.landray.kmss.common.service.IBaseService;
import com.landray.kmss.util.CriteriaUtil;
import com.landray.kmss.util.CriteriaValue;
import com.landray.kmss.util.DateUtil;
import com.landray.kmss.util.UserUtil;

import net.sf.json.JSONArray;

 
/**
 * 客户信息表 Action
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcCustomerAction extends ExtendAction {
	protected IChenyeeQcCustomerService chenyeeQcCustomerService;

	protected IBaseService getServiceImp(HttpServletRequest request) {
		if(chenyeeQcCustomerService == null){
			chenyeeQcCustomerService = (IChenyeeQcCustomerService)getBean("chenyeeQcCustomerService");
		}
		return chenyeeQcCustomerService;
	}
	
	protected IChenyeeQcCustomerService getChenyeeQcCustomerServiceImp(HttpServletRequest request) {
		if(chenyeeQcCustomerService == null){
			chenyeeQcCustomerService = (IChenyeeQcCustomerService)getBean("chenyeeQcCustomerService");
		}
		return chenyeeQcCustomerService;
	}

	protected void changeFindPageHQLInfo(HttpServletRequest request,
			HQLInfo hqlInfo) throws Exception {
		super.changeFindPageHQLInfo(request, hqlInfo);		
		CriteriaValue cv = new CriteriaValue(request);
		CriteriaUtil.buildHql(cv, hqlInfo, ChenyeeQcCustomer.class);
	}
	
	public ActionForward getCustomerName(ActionMapping mapping,ActionForm form, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONArray jsonArray = ( getChenyeeQcCustomerServiceImp(request)).getCustomerName();
		if(jsonArray != null) {
			//System.out.println(jsonArray.toString());
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonArray.toString());
		}
		return null;
	}
	
	@Override
	public ActionForward save(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		((ChenyeeQcCustomerForm)form).setDocCreateTime(DateUtil.convertDateToString(new Date(),
 				DateUtil.TYPE_DATETIME, request.getLocale()));
         ((ChenyeeQcCustomerForm)form).setFdUpdateTime(DateUtil.convertDateToString(new Date(),
 				DateUtil.TYPE_DATETIME, request.getLocale()));
         ((ChenyeeQcCustomerForm)form).setDocCreatorId(UserUtil.getUser().getFdId());
         ((ChenyeeQcCustomerForm)form).setDocCreatorName(UserUtil.getUser().getFdName());
		return super.save(mapping, form, request, response);
	}
	
	@Override
	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		((ChenyeeQcCustomerForm)form).setFdUpdateTime(DateUtil.convertDateToString(new Date(),
 				DateUtil.TYPE_DATETIME, request.getLocale()));
		return super.update(mapping, form, request, response);
	}
}

