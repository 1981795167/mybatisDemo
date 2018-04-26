<%@ page language="java" contentType="text/json; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/KmssConfig/sys/person/person.tld" prefix="person"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<list:data>
	<list:data-columns var="chenyeeQcProduct" list="${queryPage.list}" varIndex="status" mobile="true">
		<list:data-column property="fdId">
		</list:data-column>
		<list:data-column col="index">
		  ${status+1}
		</list:data-column>
		<list:data-column property="fdProjectName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdProjectName') }">
		</list:data-column>
		<list:data-column property="fdStandard" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdStandard') }">
		</list:data-column>
		<list:data-column property="fdAndroidVersion" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdAndroidVersion') }">
		</list:data-column>
		<list:data-column property="fdRearCamera" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdRearCamera') }">
		</list:data-column>
		<list:data-column property="fdBatteryCapacity" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdBatteryCapacity') }">
		</list:data-column>
		<list:data-column property="fdFrontCamera" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdFrontCamera') }">
		</list:data-column>
		<list:data-column property="fdScreeSize" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdScreeSize') }">
		</list:data-column>
		<list:data-column property="fdHardwarePlatform" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdHardwarePlatform') }">
		</list:data-column>
		<list:data-column col="created" title="${lfn:message('chenyee-quotecenter:chenyeeQcProduct.docCreateTime')}">
	        <kmss:showDate value="${chenyeeQcProduct.chenyeeQcProduct.docCreateTime}" type="date"></kmss:showDate>
      	</list:data-column>
		<list:data-column property="fdUpdateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdUpdateTime') }">
		</list:data-column>
		<list:data-column col="href" escape="false">
			/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?method=view&fdId=${chenyeeQcProduct.fdId}
		</list:data-column>
	</list:data-columns>
	<list:data-paging currentPage="${queryPage.pageno}"
		pageSize="${queryPage.rowsize}" totalSize="${queryPage.totalrows}">
	</list:data-paging>
</list:data>	
