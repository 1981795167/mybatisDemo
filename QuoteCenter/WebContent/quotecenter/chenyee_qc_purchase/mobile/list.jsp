<%@ page language="java" contentType="text/json; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/KmssConfig/sys/person/person.tld" prefix="person"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<list:data>
	<list:data-columns var="chenyeeQcPurchase" list="${queryPage.list}" varIndex="status" mobile="true">
		<list:data-column property="fdId">
		</list:data-column>
		<list:data-column col="index">
		  ${status+1}
		</list:data-column>
		<list:data-column property="fdManufacturePrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcPurchase.fdManufacturePrice') }">
		</list:data-column>
		<list:data-column property="fdStandbyPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcPurchase.fdStandbyPrice') }">
		</list:data-column>
		<list:data-column property="fdFinancialPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcPurchase.fdFinancialPrice') }">
		</list:data-column>
		<list:data-column property="fdLogisticsPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcPurchase.fdLogisticsPrice') }">
		</list:data-column>
		<list:data-column property="fdQualcommPatentPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcPurchase.fdQualcommPatentPrice') }">
		</list:data-column>
		<list:data-column property="fdSoftwarePatentPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcPurchase.fdSoftwarePatentPrice') }">
		</list:data-column>
		<list:data-column property="fdHolster" title="${ lfn:message('chenyee-quotecenter:chenyeeQcPurchase.fdHolster') }">
		</list:data-column>
		<list:data-column property="fdMembrane" title="${ lfn:message('chenyee-quotecenter:chenyeeQcPurchase.fdMembrane') }">
		</list:data-column>
		<list:data-column col="created" title="${lfn:message('chenyee-quotecenter:chenyeeQcPurchase.docCreateTime')}">
	        <kmss:showDate value="${chenyeeQcPurchase.chenyeeQcPurchase.docCreateTime}" type="date"></kmss:showDate>
      	</list:data-column>
		<list:data-column property="fdUpdateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcPurchase.fdUpdateTime') }">
		</list:data-column>
		<list:data-column col="href" escape="false">
			/chenyee/quotecenter/chenyee_qc_purchase/chenyeeQcPurchase.do?method=view&fdId=${chenyeeQcPurchase.fdId}
		</list:data-column>
	</list:data-columns>
	<list:data-paging currentPage="${queryPage.pageno}"
		pageSize="${queryPage.rowsize}" totalSize="${queryPage.totalrows}">
	</list:data-paging>
</list:data>	
