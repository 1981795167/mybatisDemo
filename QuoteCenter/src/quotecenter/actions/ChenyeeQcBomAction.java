package com.landray.kmss.chenyee.quotecenter.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcBom;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcBomService;
import com.landray.kmss.common.actions.ExtendAction;
import com.landray.kmss.common.dao.HQLInfo;
import com.landray.kmss.util.CriteriaUtil;
import com.landray.kmss.util.CriteriaValue;

import net.sf.json.JSONArray;

 
/**
 * bom信息 Action
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcBomAction extends ExtendAction {
	protected IChenyeeQcBomService chenyeeQcBomService;

	protected IChenyeeQcBomService getServiceImp(HttpServletRequest request) {
		if(chenyeeQcBomService == null){
			chenyeeQcBomService = (IChenyeeQcBomService)getBean("chenyeeQcBomService");
		}
		return chenyeeQcBomService;
	}

	protected void changeFindPageHQLInfo(HttpServletRequest request,
			HQLInfo hqlInfo) throws Exception {
		super.changeFindPageHQLInfo(request, hqlInfo);		
		CriteriaValue cv = new CriteriaValue(request);
		CriteriaUtil.buildHql(cv, hqlInfo, ChenyeeQcBom.class);
	}
	
	//
	public ActionForward loadBomCode(ActionMapping mapping,ActionForm form, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String productId = request.getParameter("productId");
		if(productId != null) {
			JSONArray jsonArray = getServiceImp(request).loadBomCode(productId);
			
			if(jsonArray != null) {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonArray.toString());
			}
		}

		return null;
	}
	
	public ActionForward loadBomInfo(ActionMapping mapping,ActionForm form, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String productId = request.getParameter("productId");
		String bomCode = request.getParameter("bomCode");
		if(productId != null && bomCode != null) {
			JSONArray jsonArray = getServiceImp(request).loadBomInfo(productId,bomCode);
			
			if(jsonArray != null) {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonArray.toString());
			}
		}

		return null;
	}
	
	
	public ActionForward loadBomListInfo(ActionMapping mapping,ActionForm form, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String productId = request.getParameter("productId");
		String bomCode = request.getParameter("bomCode");
		if(productId != null && bomCode != null) {
			JSONArray jsonArray = getServiceImp(request).loadBomListInfo(productId,bomCode);
			
			if(jsonArray != null) {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonArray.toString());
			}
		}

		return null;
	}
}

