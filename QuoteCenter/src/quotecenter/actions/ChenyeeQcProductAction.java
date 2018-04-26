package com.landray.kmss.chenyee.quotecenter.actions;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.ArrayUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcHardwareForm;
import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcProductForm;
import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcPurchaseForm;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcCustOrder;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcProduct;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcCustOrderService;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcHardwareService;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcProductService;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcPurchaseService;
import com.landray.kmss.common.actions.ExtendAction;
import com.landray.kmss.common.actions.RequestContext;
import com.landray.kmss.common.dao.HQLInfo;
import com.landray.kmss.common.exception.NoRecordException;
import com.landray.kmss.common.exception.UnexpectedRequestException;
import com.landray.kmss.common.forms.IExtendForm;
import com.landray.kmss.common.model.IBaseModel;
import com.landray.kmss.common.service.IBaseService;
import com.landray.kmss.common.test.TimeCounter;
import com.landray.kmss.sys.authorization.constant.ISysAuthConstant;
import com.landray.kmss.sys.authorization.interfaces.SysAuthAreaUtils;
import com.landray.kmss.util.CriteriaUtil;
import com.landray.kmss.util.CriteriaValue;
import com.landray.kmss.util.DateUtil;
import com.landray.kmss.util.KmssMessage;
import com.landray.kmss.util.KmssMessages;
import com.landray.kmss.util.KmssReturnPage;
import com.landray.kmss.util.StringUtil;
import com.landray.kmss.util.UserUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

 
/**
 * 产品信息表 Action
 * 
 * @author 
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcProductAction extends ExtendAction {
	
	protected IChenyeeQcProductService chenyeeQcProductService;
	protected IChenyeeQcCustOrderService chenyeeQcCustOrderService;
	

	protected IBaseService getServiceImp(HttpServletRequest request) {
		if(chenyeeQcProductService == null){
			chenyeeQcProductService = (IChenyeeQcProductService)getBean("chenyeeQcProductService");
		}
		return chenyeeQcProductService;
	}
	
	protected IChenyeeQcProductService getProductServiceImp(HttpServletRequest request) {
		if(chenyeeQcProductService == null){
			chenyeeQcProductService = (IChenyeeQcProductService)getBean("chenyeeQcProductService");
		}
		return chenyeeQcProductService;
	}

	
	protected IChenyeeQcCustOrderService getCustOrderServiceImp(HttpServletRequest request) {
		if(chenyeeQcCustOrderService == null){
			chenyeeQcCustOrderService = (IChenyeeQcCustOrderService)getBean("chenyeeQcCustOrderService");
		}
		return chenyeeQcCustOrderService;
	}
	
	protected IChenyeeQcHardwareService chenyeeQcHardwareService;

	protected IBaseService getHardwareServiceImp(HttpServletRequest request) {
		if(chenyeeQcHardwareService == null){
			chenyeeQcHardwareService = (IChenyeeQcHardwareService)getBean("chenyeeQcHardwareService");
		}
		return chenyeeQcHardwareService;
	}
	
	protected IChenyeeQcPurchaseService chenyeeQcPurchaseService;

	protected IBaseService getPurchaseServiceImp(HttpServletRequest request) {
		if(chenyeeQcPurchaseService == null){
			chenyeeQcPurchaseService = (IChenyeeQcPurchaseService)getBean("chenyeeQcPurchaseService");
		}
		return chenyeeQcPurchaseService;
	}



	protected void changeFindPageHQLInfo(HttpServletRequest request,
			HQLInfo hqlInfo) throws Exception {
		super.changeFindPageHQLInfo(request, hqlInfo);
		CriteriaValue cv = new CriteriaValue(request);
		CriteriaUtil.buildHql(cv, hqlInfo, ChenyeeQcProduct.class);
	}
	
	
	public ActionForward getProductName(ActionMapping mapping,ActionForm form, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		JSONArray quoteNames = (getProductServiceImp(request)).getProductName();
		
		if(quoteNames != null) {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(quoteNames.toString());
		}

		return null;
	}
	
	public ActionForward loadProductInfo(ActionMapping mapping,ActionForm form, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String productId = request.getParameter("productId");
		if(productId != null) {
			JSONObject jsonObject = getProductServiceImp(request).loadProductInfo(productId);
			
			if(jsonObject != null) {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonObject.toString());
			}
		}

		return null;
	}

	
	@Override
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setAttribute("execModel", request.getParameter("execModel"));
		return super.add(mapping, form, request, response);
	}
	
	@Override
	public ActionForward view(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setAttribute("execModel", request.getParameter("execModel"));
		return super.view(mapping, form, request, response);
	}
	
	@Override
	public ActionForward edit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setAttribute("execModel", request.getParameter("execModel"));
		return super.edit(mapping, form, request, response);
	}
	
	@Override
	public ActionForward save(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// 保存custOrder的projectName
		ChenyeeQcProductForm proForm = (ChenyeeQcProductForm)form;
		proForm.setDocCreateTime(DateUtil.convertDateToString(new Date(),
				DateUtil.TYPE_DATETIME, request.getLocale()));
		proForm.setFdUpdateTime(DateUtil.convertDateToString(new Date(),
				DateUtil.TYPE_DATETIME, request.getLocale()));
		return super.save(mapping, proForm, request, response);
	}
	
	@Override
	public ActionForward update(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
				String execModel = request.getParameter("execModel");
				ChenyeeQcProductForm chenyeeQcProductForm = (ChenyeeQcProductForm)form;
				String productId = chenyeeQcProductForm.getFdId();
				Long count = 0L;
				if("product".equals(execModel)){
					getProductServiceImp(request).updateProductModuleInfo(chenyeeQcProductForm);
				}
				else if("hardware".equals(execModel)){
					count = getProductServiceImp(request).getCountByProductId(productId, "hardware");
					ChenyeeQcHardwareForm chenyeeQcHardwareForm = (ChenyeeQcHardwareForm)(chenyeeQcProductForm.getFdHardwareForm().get(0));
					chenyeeQcHardwareForm.setDocCreatorId(UserUtil.getUser().getFdId());
					if(count==0){
						getProductServiceImp(request).addHardWareInfo(chenyeeQcProductForm);
					}else{
						getProductServiceImp(request).updateHardWareInfo(chenyeeQcProductForm);
					}
				}else if("purchase".equals(execModel)){
					count = getProductServiceImp(request).getCountByProductId(productId, "purchase");
					ChenyeeQcPurchaseForm chenyeeQcPurchaseForm = (ChenyeeQcPurchaseForm)(chenyeeQcProductForm.getFdPurchaseForm().get(0));
					chenyeeQcPurchaseForm.setDocCreatorId(UserUtil.getUser().getFdId());
					if(count==0){
						getProductServiceImp(request).addPurchaseModuleInfo(chenyeeQcProductForm);
					}else{
						getProductServiceImp(request).updatePurchaseModuleInfo(chenyeeQcProductForm);
					}
				}else if("sale".equals(execModel)){
					getProductServiceImp(request).updateSaleModuleInfo(chenyeeQcProductForm);
				}			
				return getActionForward("success", mapping, chenyeeQcProductForm, request, response);
				
	}

	@Override
	public void loadActionForm(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		form.reset(mapping, request);
		IExtendForm rtnForm = null;
		String id = request.getParameter("fdId");
		if (!StringUtil.isNull(id)) {
			List<ChenyeeQcCustOrder> chenyeeQcCustOrders = (getCustOrderServiceImp(request)).getCustOrderInfoWithProductId(id);
			
			IBaseModel model = getServiceImp(request).findByPrimaryKey(id,null,true);
			if (model != null){
				((ChenyeeQcProduct)model).setFdCustomerOrders(chenyeeQcCustOrders);
				rtnForm = getServiceImp(request).convertModelToForm(
						(IExtendForm) form, model, new RequestContext(request));
			}
				
		}
		if (rtnForm == null)
			throw new NoRecordException();
		request.setAttribute(getFormName(rtnForm, request), rtnForm);
	}
	
	@Override
	public ActionForward deleteall(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		TimeCounter.logCurrentTime("Action-deleteall", true, getClass());
		KmssMessages messages = new KmssMessages();
		try {
			if (!request.getMethod().equals("POST"))
				throw new UnexpectedRequestException();
			String[] ids = request.getParameterValues("List_Selected");

			if (ISysAuthConstant.IS_AREA_ENABLED) {
				String[] authIds = SysAuthAreaUtils.removeNoAuthIds(ids,
						request, "method=delete&fdId=${id}");
				int noAuthIdNum = ids.length - authIds.length;
				if (noAuthIdNum > 0) {
					messages.addMsg(new KmssMessage(
							"sys-authorization:area.batch.operation.info",
							noAuthIdNum));
				}

				if (!ArrayUtils.isEmpty(authIds))
					getProductServiceImp(request).deleteProductModuleInfo(authIds);
				} else if (ids != null) {
					getProductServiceImp(request).deleteProductModuleInfo(ids);
				}

		} catch (Exception e) {
			messages.addError(e);
		}

		KmssReturnPage.getInstance(request).addMessages(messages).addButton(
				KmssReturnPage.BUTTON_RETURN).save(request);
		TimeCounter.logCurrentTime("Action-deleteall", false, getClass());
		if (messages.hasError())
			return getActionForward("failure", mapping, form, request, response);
		else
			return getActionForward("success", mapping, form, request, response);
	}
	
}

