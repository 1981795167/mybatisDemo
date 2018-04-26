package com.landray.kmss.chenyee.quotecenter.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcEarphone;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcEarphoneService;
import com.landray.kmss.common.actions.ExtendAction;
import com.landray.kmss.common.dao.HQLInfo;
import com.landray.kmss.common.service.IBaseService;
import com.landray.kmss.util.CriteriaUtil;
import com.landray.kmss.util.CriteriaValue;

import net.sf.json.JSONArray;

 
/**
 * 耳机档位表 Action
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcEarphoneAction extends ExtendAction {
	protected IChenyeeQcEarphoneService chenyeeQcEarphoneService;

	protected IBaseService getServiceImp(HttpServletRequest request) {
		if(chenyeeQcEarphoneService == null){
			chenyeeQcEarphoneService = (IChenyeeQcEarphoneService)getBean("chenyeeQcEarphoneService");
		}
		return chenyeeQcEarphoneService;
	}
	
	private IChenyeeQcEarphoneService getEarPhoneService(HttpServletRequest request) {
		return (IChenyeeQcEarphoneService)getServiceImp(request);
	}

	protected void changeFindPageHQLInfo(HttpServletRequest request,
			HQLInfo hqlInfo) throws Exception {
		super.changeFindPageHQLInfo(request, hqlInfo);		
		CriteriaValue cv = new CriteriaValue(request);
		CriteriaUtil.buildHql(cv, hqlInfo, ChenyeeQcEarphone.class);
	}
	
	public ActionForward getEarPhone(ActionMapping mapping,ActionForm form, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String productId = request.getParameter("productId");
		if(productId != null) {
			JSONArray RomRams = getEarPhoneService(request).getEarPhone(productId);
			if(RomRams != null) {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(RomRams.toString());
			}
		}
		return null;
	}
}

