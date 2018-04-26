<%@ page language="java" contentType="text/json; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/KmssConfig/sys/person/person.tld" prefix="person"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<list:data>
	<list:data-columns var="chenyeeQcApply" list="${queryPage.list}" varIndex="status" mobile="true">
		<list:data-column property="fdId">
		</list:data-column>
		<list:data-column col="index">
		  ${status+1}
		</list:data-column>
		<list:data-column property="fdApplicationTitle" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdApplicationTitle') }">
		</list:data-column>
		<list:data-column property="fdProjectName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdProjectName') }">
		</list:data-column>
		<list:data-column property="fdCustomerName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdCustomerName') }">
		</list:data-column>
		<list:data-column property="fdRomRam" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdRomRam') }">
		</list:data-column>
		<list:data-column property="fdMembrane" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdMembrane') }">
		</list:data-column>
		<list:data-column property="fdHolster" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdHolster') }">
		</list:data-column>
		<list:data-column property="fdPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdPrice') }">
		</list:data-column>
		<list:data-column property="fdBottomPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdBottomPrice') }">
		</list:data-column>
		<list:data-column property="fdCostPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdCostPrice') }">
		</list:data-column>
		<list:data-column property="fdApplicationPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdApplicationPrice') }">
		</list:data-column>
		<list:data-column property="fdApplicationTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdApplicationTime') }">
		</list:data-column>
		<list:data-column property="docStatus" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.docStatus') }">
		</list:data-column>
		<list:data-column property="fdQuotePath" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdQuotePath') }">
		</list:data-column>
		<list:data-column property="fdPresetPercent" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdPresetPercent') }">
		</list:data-column>
		<list:data-column property="fdApplyQuotePercent" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdApplyQuotePercent') }">
		</list:data-column>
		<list:data-column property="fdGm" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdGm') }">
		</list:data-column>
		<list:data-column col="href" escape="false">
			/chenyee/quotecenter/chenyee_qc_apply/chenyeeQcApply.do?method=view&fdId=${chenyeeQcApply.fdId}
		</list:data-column>
	</list:data-columns>
	<list:data-paging currentPage="${queryPage.pageno}"
		pageSize="${queryPage.rowsize}" totalSize="${queryPage.totalrows}">
	</list:data-paging>
</list:data>	
