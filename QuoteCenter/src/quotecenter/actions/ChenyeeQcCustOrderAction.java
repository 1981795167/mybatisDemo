package com.landray.kmss.chenyee.quotecenter.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcCustOrder;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcCustOrderService;
import com.landray.kmss.common.actions.ExtendAction;
import com.landray.kmss.common.dao.HQLInfo;
import com.landray.kmss.common.service.IBaseService;
import com.landray.kmss.common.test.TimeCounter;
import com.landray.kmss.util.CriteriaUtil;
import com.landray.kmss.util.CriteriaValue;
import com.landray.kmss.util.KmssMessages;
import com.landray.kmss.util.KmssReturnPage;

import net.sf.json.JSONArray;

 
/**
 * 客户定制价目表 Action
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcCustOrderAction extends ExtendAction {
	protected IChenyeeQcCustOrderService chenyeeQcCustOrderService;

	protected IBaseService getServiceImp(HttpServletRequest request) {
		if(chenyeeQcCustOrderService == null){
			chenyeeQcCustOrderService = (IChenyeeQcCustOrderService)getBean("chenyeeQcCustOrderService");
		}
		return chenyeeQcCustOrderService;
	}
	
	private IChenyeeQcCustOrderService getCustOrderServcie(HttpServletRequest request) {
		return (IChenyeeQcCustOrderService)getServiceImp(request);
	}

	protected void changeFindPageHQLInfo(HttpServletRequest request,
			HQLInfo hqlInfo) throws Exception {
		super.changeFindPageHQLInfo(request, hqlInfo);		
		CriteriaValue cv = new CriteriaValue(request);
		CriteriaUtil.buildHql(cv, hqlInfo, ChenyeeQcCustOrder.class);
	}
	
	public ActionForward getCustomerPrice(ActionMapping mapping,ActionForm form, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String customerName = request.getParameter("fdCustomerName");
		String productId = request.getParameter("fdProjectId");
		String romram = request.getParameter("fdRomRam");
		romram = buildRomRam(romram);
		JSONArray customerPrice = getCustOrderServcie(request).getCustomerPrice(customerName, productId,  romram);
		if(customerPrice != null) {
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(customerPrice.toString());
		}
		return null;
	}
	
	public ActionForward viewDetail(ActionMapping mapping,ActionForm form, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		TimeCounter.logCurrentTime("Action-view", true, getClass());
		KmssMessages messages = new KmssMessages();
		try {
			loadActionForm(mapping, form, request, response);
		} catch (Exception e) {
			messages.addError(e);
		}

		TimeCounter.logCurrentTime("Action-view", false, getClass());
		if (messages.hasError()) {
			KmssReturnPage.getInstance(request).addMessages(messages)
					.addButton(KmssReturnPage.BUTTON_CLOSE).save(request);
			return getActionForward("failure", mapping, form, request, response);
		} else {
			return getActionForward("viewDetail", mapping, form, request, response);
		}
	}
	
	
	/**
	 * 从浏览器发动请求时“+”会发生转译情况，
	 * 将”+“  替换为romram后传到了后台</br>
	 * 假如数据为： 8+1</br>
	 * 替换之后的为:  8romram1</br>
	 * 需要替换回8+1
	 * @param romram
	 * @return
	 */
	private String buildRomRam(String romram) {
		int index = romram.indexOf("romram");
		String rom = romram.substring(0, index);
		String ram = romram.substring(index + 6);
		StringBuilder builder = new StringBuilder();
		builder.append(rom);
		builder.append("+");
		builder.append(ram);
		return builder.toString();
	}
	
}

