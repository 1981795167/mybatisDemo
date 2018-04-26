<%@ page language="java" contentType="text/json; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<list:data>
	<list:data-columns var="chenyeeQcCustOrder" list="${queryPage.list}" varIndex="status">
		<list:data-column property="fdId">
		</list:data-column>
		<list:data-column col="index">
		  ${status+1}
		</list:data-column>
		
		<list:data-column property="fdProjectName"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdProjectName') }">
		</list:data-column>
		<list:data-column property="fdCustomerName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdCustomerName') }">
		</list:data-column>
		<list:data-column property="fdRomRam" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdRomRam') }">
		</list:data-column>
		<list:data-column property="fdProductPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.costPrice') }">
		</list:data-column>
		<list:data-column property="fdBottomPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdBottomPrice') }">
		</list:data-column>
		<list:data-column property="fdPercent" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdPercent') }">
		</list:data-column>
		<%-- <list:data-column property="docCreateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.docCreateTime') }">
		</list:data-column> --%>
		<list:data-column property="fdUpdateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdUpdateTime') }">
		</list:data-column>
		<list:data-column property="fdProduct.fdId" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdProductId') }">
		</list:data-column>
		<list:data-column col="docCreator.fdName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.docCreator') }">
			<ui:person personId="${chenyeeQcCustOrder.docCreator.fdId}" personName="${chenyeeQcCustOrder.docCreator.fdName}"></ui:person>
		</list:data-column>
	</list:data-columns>
	
	<list:data-paging page="${queryPage}" />
</list:data>