<%@ page language="java" contentType="text/json; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<list:data>
	<list:data-columns var="chenyeeQcPurchase" list="${queryPage.list}" varIndex="status">
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
		<list:data-column property="docCreateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcPurchase.docCreateTime') }">
		</list:data-column>
		<list:data-column property="fdUpdateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcPurchase.fdUpdateTime') }">
		</list:data-column>
		<list:data-column col="docCreator.fdName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcPurchase.docCreator') }">
			<c:out value="${chenyeeQcPurchase.docCreator.fdName}" />
		</list:data-column>
	</list:data-columns>
	
	<list:data-paging page="${queryPage}" />
</list:data>