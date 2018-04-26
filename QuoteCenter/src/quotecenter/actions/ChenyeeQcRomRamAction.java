package com.landray.kmss.chenyee.quotecenter.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcRomRam;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcRomRamService;
import com.landray.kmss.common.actions.ExtendAction;
import com.landray.kmss.common.dao.HQLInfo;
import com.landray.kmss.common.service.IBaseService;
import com.landray.kmss.util.CriteriaUtil;
import com.landray.kmss.util.CriteriaValue;

import net.sf.json.JSONArray;

 
/**
 * rom_ram价目表 Action
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcRomRamAction extends ExtendAction {
	protected IChenyeeQcRomRamService chenyeeQcRomRamService;

	protected IBaseService getServiceImp(HttpServletRequest request) {
		if(chenyeeQcRomRamService == null){
			chenyeeQcRomRamService = (IChenyeeQcRomRamService)getBean("chenyeeQcRomRamService");
		}
		return chenyeeQcRomRamService;
	}
	private IChenyeeQcRomRamService getRomRamService(HttpServletRequest request) {
		return (IChenyeeQcRomRamService)getServiceImp(request);
	}

	protected void changeFindPageHQLInfo(HttpServletRequest request,
			HQLInfo hqlInfo) throws Exception {
		super.changeFindPageHQLInfo(request, hqlInfo);		
		CriteriaValue cv = new CriteriaValue(request);
		CriteriaUtil.buildHql(cv, hqlInfo, ChenyeeQcRomRam.class);
	}
	
	public ActionForward getRomRam(ActionMapping mapping,ActionForm form, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String productId = request.getParameter("productId");
		if(productId != null) {
			JSONArray RomRams = getRomRamService(request).getRomRam(productId);
			if(RomRams != null) {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(RomRams.toString());
			}
		}
		
		return null;
	}
}

