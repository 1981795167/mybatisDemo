package com.landray.kmss.chenyee.quotecenter.service;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;

import com.landray.kmss.common.service.IBaseService;

/**
 * 报价申请业务对象接口
 * 
 * @author
 * @version 1.0 2018-03-15
 */
public interface IChenyeeQcApplyService extends IBaseService {

	String countGm(String s_applicationPrice, String s_costPrice);

	String createFile(ActionForm form, HttpServletRequest request, IChenyeeQcProductService iChenyeeQcProductService) throws Exception;

	String getFullQuotePath(String quotePath) throws Exception;

	/**
	 * 更新报价单
	 * @param oldValue 
	 * @param newValue
	 * @param fieldName 字段名（fdProjectName, fdCustomerName）
	 * @return  更新记录条数
	 */
	int updateApply(String oldValue, String newValue, String fieldName);

	/**
	 * 根据报价单路径删除报价单
	 * @param pdfPaths
	 * @return 
	 */
	boolean deletePdf(String[] pdfPaths);

}
