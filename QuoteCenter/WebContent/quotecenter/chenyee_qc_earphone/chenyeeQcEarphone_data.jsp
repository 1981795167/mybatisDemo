<%@ page language="java" contentType="text/json; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<list:data>
	<list:data-columns var="chenyeeQcEarphone" list="${queryPage.list}" varIndex="status">
		<list:data-column property="fdId">
		</list:data-column>
		<list:data-column col="index">
		  ${status+1}
		</list:data-column>
		
		<list:data-column property="fdLowPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcEarphone.fdLowPrice') }">
		</list:data-column>
		<list:data-column property="fdMidPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcEarphone.fdMidPrice') }">
		</list:data-column>
		<list:data-column property="fdHighPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcEarphone.fdHighPrice') }">
		</list:data-column>
		<list:data-column property="fdDefaultPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcEarphone.fdDefaultPrice') }">
		</list:data-column>
		<list:data-column property="fdProductId" title="${ lfn:message('chenyee-quotecenter:chenyeeQcEarphone.fdProductId') }">
		</list:data-column>
	</list:data-columns>
	
	<list:data-paging page="${queryPage}" />
</list:data>