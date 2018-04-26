package com.landray.kmss.chenyee.quotecenter.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcPurchase;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcPurchaseService;
import com.landray.kmss.common.actions.ExtendAction;
import com.landray.kmss.common.dao.HQLInfo;
import com.landray.kmss.common.service.IBaseService;
import com.landray.kmss.util.CriteriaUtil;
import com.landray.kmss.util.CriteriaValue;

import net.sf.json.JSONArray;

 
/**
 * 采购费用表 Action
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcPurchaseAction extends ExtendAction {
	protected IChenyeeQcPurchaseService chenyeeQcPurchaseService;

	protected IBaseService getServiceImp(HttpServletRequest request) {
		if(chenyeeQcPurchaseService == null){
			chenyeeQcPurchaseService = (IChenyeeQcPurchaseService)getBean("chenyeeQcPurchaseService");
		}
		return chenyeeQcPurchaseService;
	}
	
	private IChenyeeQcPurchaseService getPurchaseService(HttpServletRequest request) {
		return (IChenyeeQcPurchaseService)getServiceImp(request);
	}

	protected void changeFindPageHQLInfo(HttpServletRequest request,
			HQLInfo hqlInfo) throws Exception {
		super.changeFindPageHQLInfo(request, hqlInfo);		
		CriteriaValue cv = new CriteriaValue(request);
		CriteriaUtil.buildHql(cv, hqlInfo, ChenyeeQcPurchase.class);
	}
	
	public ActionForward getPurchase(ActionMapping mapping,ActionForm form, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String productId = request.getParameter("productId");
		if(productId != null) {
			JSONArray RomRams = getPurchaseService(request).getPurchase(productId);
			if(RomRams != null) {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(RomRams.toString());
			}
		}
		return null;
	}
}

