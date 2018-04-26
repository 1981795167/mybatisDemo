package com.landray.kmss.chenyee.quotecenter.actions;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.landray.kmss.chenyee.quotecenter.forms.ChenyeeQcApplyForm;
import com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcApply;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcApplyService;
import com.landray.kmss.chenyee.quotecenter.service.IChenyeeQcProductService;
import com.landray.kmss.chenyee.quotecenter.util.DateUtil;
import com.landray.kmss.common.actions.ExtendAction;
import com.landray.kmss.common.actions.RequestContext;
import com.landray.kmss.common.dao.HQLInfo;
import com.landray.kmss.common.service.IBaseService;
import com.landray.kmss.common.test.TimeCounter;
import com.landray.kmss.constant.SysDocConstant;
import com.landray.kmss.sys.organization.model.SysOrgElement;
import com.landray.kmss.sys.workflow.interfaces.ISysWfProcessCoreService;
import com.landray.kmss.util.CriteriaUtil;
import com.landray.kmss.util.CriteriaValue;
import com.landray.kmss.util.KmssMessages;
import com.landray.kmss.util.KmssReturnPage;
import com.landray.kmss.util.UserUtil;

/**
 * 报价申请 Action
 * 
 * @author
 * @version 1.0 2018-03-15
 */
public class ChenyeeQcApplyAction extends ExtendAction {
	protected IChenyeeQcApplyService chenyeeQcApplyService;
	
	private IChenyeeQcProductService productService;
	
	protected IChenyeeQcProductService getProductService(HttpServletRequest request) {
		if (productService == null) {
			productService = (IChenyeeQcProductService) getBean("chenyeeQcProductService");
		}
		return productService;
	}

	private ISysWfProcessCoreService sysWfProcessCoreService;

	public ISysWfProcessCoreService getSysWfProcessCoreService() {
		if (sysWfProcessCoreService == null) {
			sysWfProcessCoreService = (ISysWfProcessCoreService) getBean("sysWfProcessCoreService");
		}
		return sysWfProcessCoreService;
	}

	protected IBaseService getServiceImp(HttpServletRequest request) {
		if (chenyeeQcApplyService == null) {
			chenyeeQcApplyService = (IChenyeeQcApplyService) getBean("chenyeeQcApplyService");
		}
		return chenyeeQcApplyService;
	}

	protected IChenyeeQcApplyService getChenyeeQcApplyService(HttpServletRequest request) {
		if (chenyeeQcApplyService == null) {
			chenyeeQcApplyService = (IChenyeeQcApplyService) getBean("chenyeeQcApplyService");
		}
		return chenyeeQcApplyService;
	}

	protected void changeFindPageHQLInfo(HttpServletRequest request, HQLInfo hqlInfo) throws Exception {
		CriteriaValue cv = new CriteriaValue(request);
		String fdProjectName = cv.poll("fdProjectName");
		String fdCustomerName = cv.poll("fdCustomerName");
		String fdRomRam = cv.poll("fdRomRam");
		StringBuilder builder = new StringBuilder(" 1=1 ");

		if (fdProjectName != null) {
			builder.append(" and chenyeeQcApply.fdProjectName = :fdProjectName");
			hqlInfo.setParameter("fdProjectName", fdProjectName);
		}

		if (fdCustomerName != null) {
			builder.append(" and chenyeeQcApply.fdCustomerName = :fdCustomerName");
			hqlInfo.setParameter("fdCustomerName", fdCustomerName);
		}

		if (fdRomRam != null) {
			builder.append(" and chenyeeQcApply.fdRomRam = :fdRomRam");
			hqlInfo.setParameter("fdRomRam", fdRomRam);
		}

		hqlInfo.setWhereBlock(builder.toString());
		CriteriaUtil.buildHql(cv, hqlInfo, ChenyeeQcApply.class);
	}

	@Override
	protected ActionForm createNewForm(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ChenyeeQcApplyForm chenyeeQcApplyForm = (ChenyeeQcApplyForm) super.createNewForm(mapping, form, request,
				response);
		SysOrgElement docCreator = UserUtil.getUser();
		// System.out.println(docCreator.getFdId() + " " +
		// docCreator.getFdName());
		chenyeeQcApplyForm.setDocCreatorId(docCreator.getFdId());
		chenyeeQcApplyForm.setDocCreatorName(docCreator.getFdName());

		getSysWfProcessCoreService().initFormDefaultSetting(chenyeeQcApplyForm, "reviewApply", "reviewApply",
				new RequestContext(request));

		return chenyeeQcApplyForm;
	}

	@Override
	public ActionForward save(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// System.out.println(((ChenyeeQuotecenterApplyForm)form).toString());
		ChenyeeQcApplyForm applyForm = (ChenyeeQcApplyForm) form;
		applyForm.setFdApplicationTime(DateUtil.getCurDate());
		applyForm.setDocStatus(SysDocConstant.DOC_STATUS_EXAMINE);
		// 毛利率的计算、申请单标题格式
		applyForm.setFdGm(getChenyeeQcApplyService(request).countGm(applyForm.getFdApplicationPrice(),
				applyForm.getFdCostPrice()));

		applyForm.setFdApplicationTitle(getApplyTitle(applyForm));
		String quotePath = getChenyeeQcApplyService(request).createFile(form, request, getProductService(request));
		applyForm.setFdQuotePath(quotePath);
		
		if(Double.valueOf(applyForm.getFdHolster()) <= 0){
			applyForm.setFdHolster(null);
		}
		if(Double.valueOf(applyForm.getFdPrice()) <= 0){
			applyForm.setFdPrice(null);
		}
		if(Double.valueOf(applyForm.getFdMembrane()) <= 0){
			applyForm.setFdMembrane(null);
		}
		
		// return null;
		return super.save(mapping, applyForm, request, response);
	}

	private String getApplyTitle(ChenyeeQcApplyForm applyForm) {
		String createTime = applyForm.getFdApplicationTime();
		String new_time = createTime.replace(" ", "").replaceAll("-", "").replaceAll(":", "");
		StringBuilder builder = new StringBuilder(applyForm.getFdProjectName()).append("_")
				.append(applyForm.getFdCustomerName()).append("_").append("quotation").append("_").append(new_time);
		return builder.toString();
	}

	public ActionForward downloadPdf(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String quotePath = request.getParameter("filePath");
		String fullPath = getChenyeeQcApplyService(request).getFullQuotePath(quotePath);
		quotePath = quotePath + ".pdf";
		InputStream in = null;
		OutputStream out = null;
		try {
			File file = new File(fullPath);
			// 设置文件MIME类型
			//response.setContentType(getServletContext().getMimeType(quotePath));
			response.setContentType("application/pdf");
			// 设置Content-Disposition
			response.setHeader("Content-Disposition", "attachment;filename=" + quotePath);
			in = new FileInputStream(file);
			response.setCharacterEncoding("utf-8");
			out = response.getOutputStream();
			// 写文件
			int b;
			while ((b = in.read()) != -1) {
				out.write(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			in.close();
			out.close();
		}
		return null;
	}

	@Override
	protected void loadActionForm(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		super.loadActionForm(mapping, form, request, response);
//		ChenyeeQcApplyForm applyForm = (ChenyeeQcApplyForm) form;
//		System.out.println(applyForm.toString());
	}
	
	public ActionForward viewBoss(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
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
			return getActionForward("view_boss", mapping, form, request, response);
		}
	}

	@Override
	public ActionForward deleteall(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String[] pdfPaths = request.getParameterValues("quotePaths");
		getChenyeeQcApplyService(request).deletePdf(pdfPaths);
		
		return super.deleteall(mapping, form, request, response);
	}

	
	
}
