<%@ page language="java" contentType="text/json; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/KmssConfig/sys/person/person.tld" prefix="person"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<list:data>
	<list:data-columns var="chenyeeQcHardware" list="${queryPage.list}" varIndex="status" mobile="true">
		<list:data-column property="fdId">
		</list:data-column>
		<list:data-column col="index">
		  ${status+1}
		</list:data-column>
		<list:data-column property="fdHardwarePrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcHardware.fdHardwarePrice') }">
		</list:data-column>
		<list:data-column col="created" title="${lfn:message('chenyee-quotecenter:chenyeeQcHardware.docCreateTime')}">
	        <kmss:showDate value="${chenyeeQcHardware.chenyeeQcHardware.docCreateTime}" type="date"></kmss:showDate>
      	</list:data-column>
		<list:data-column property="docAlterTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcHardware.docAlterTime') }">
		</list:data-column>
		<list:data-column property="fdUpdateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcHardware.fdUpdateTime') }">
		</list:data-column>
		<list:data-column col="href" escape="false">
			/chenyee/quotecenter/chenyee_qc_hardware/chenyeeQcHardware.do?method=view&fdId=${chenyeeQcHardware.fdId}
		</list:data-column>
	</list:data-columns>
	<list:data-paging currentPage="${queryPage.pageno}"
		pageSize="${queryPage.rowsize}" totalSize="${queryPage.totalrows}">
	</list:data-paging>
</list:data>	
