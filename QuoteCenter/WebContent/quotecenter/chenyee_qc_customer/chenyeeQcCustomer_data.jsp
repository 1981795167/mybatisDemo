<%@ page language="java" contentType="text/json; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<list:data>
	<list:data-columns var="chenyeeQcCustomer" list="${queryPage.list}" varIndex="status">
		<list:data-column property="fdId">
		</list:data-column>
		<list:data-column col="index">
		  ${status+1}
		</list:data-column>
		
		<list:data-column property="fdCustomerName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustomer.fdCustomerName') }">
		</list:data-column>
		<list:data-column property="docCreateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustomer.docCreateTime') }">
		</list:data-column>
		<list:data-column property="fdUpdateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustomer.fdUpdateTime') }">
		</list:data-column>
		<list:data-column col="docCreator.fdName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustomer.docCreator') }">
			<c:out value="${chenyeeQcCustomer.docCreator.fdName}" />
		</list:data-column>
	</list:data-columns>
	
	<list:data-paging page="${queryPage}" />
</list:data>