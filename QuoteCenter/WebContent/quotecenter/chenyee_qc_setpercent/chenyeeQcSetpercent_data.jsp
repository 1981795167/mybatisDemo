<%@ page language="java" contentType="text/json; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<list:data>
	<list:data-columns var="chenyeeQcSetpercent" list="${queryPage.list}" varIndex="status">
		<list:data-column property="fdId">
		</list:data-column>
		<list:data-column col="index">
		  ${status+1}
		</list:data-column>
		
		<list:data-column property="fdPresetPercent" title="${ lfn:message('chenyee-quotecenter:chenyeeQcSetpercent.fdPresetPercent') }">
		</list:data-column>
		<list:data-column property="docCreateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcSetpercent.docCreateTime') }">
		</list:data-column>
		<list:data-column property="fdUpdateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcSetpercent.fdUpdateTime') }">
		</list:data-column>
		<list:data-column col="docCreator.fdName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcSetpercent.docCreator') }">
			<c:out value="${chenyeeQcSetpercent.docCreator.fdName}" />
		</list:data-column>
	</list:data-columns>
	
	<list:data-paging page="${queryPage}" />
</list:data>