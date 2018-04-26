<%@ page language="java" contentType="text/json; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/KmssConfig/sys/person/person.tld" prefix="person"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<list:data>
	<list:data-columns var="chenyeeQcCustOrder" list="${queryPage.list}" varIndex="status" mobile="true">
		<list:data-column property="fdId">
		</list:data-column>
		<list:data-column col="index">
		  ${status+1}
		</list:data-column>
		<list:data-column property="fdCustomerName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdCustomerName') }">
		</list:data-column>
		<list:data-column property="fdRomRam" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdRomRam') }">
		</list:data-column>
		<list:data-column property="fdProductPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdProductPrice') }">
		</list:data-column>
		<list:data-column property="fdOrderBottomPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdOrderBottomPrice') }">
		</list:data-column>
		<list:data-column property="fdOrderBottomPercent" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdOrderBottomPercent') }">
		</list:data-column>
		<list:data-column col="created" title="${lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.docCreateTime')}">
	        <kmss:showDate value="${chenyeeQcCustOrder.chenyeeQcCustOrder.docCreateTime}" type="date"></kmss:showDate>
      	</list:data-column>
		<list:data-column property="fdUpdateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdUpdateTime') }">
		</list:data-column>
		<list:data-column property="fdProductId" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdProductId') }">
		</list:data-column>
		<list:data-column col="href" escape="false">
			/chenyee/quotecenter/chenyee_qc_cust_order/chenyeeQcCustOrder.do?method=view&fdId=${chenyeeQcCustOrder.fdId}
		</list:data-column>
	</list:data-columns>
	<list:data-paging currentPage="${queryPage.pageno}"
		pageSize="${queryPage.rowsize}" totalSize="${queryPage.totalrows}">
	</list:data-paging>
</list:data>	
