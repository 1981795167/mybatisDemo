<%@ page language="java" contentType="text/json; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/KmssConfig/sys/person/person.tld" prefix="person"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<list:data>
	<list:data-columns var="chenyeeQcBom" list="${queryPage.list}" varIndex="status" mobile="true">
		<list:data-column property="fdId">
		</list:data-column>
		<list:data-column col="index">
		  ${status+1}
		</list:data-column>
		<list:data-column property="fdBomName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdBomName') }">
		</list:data-column>
		<list:data-column property="fdBomPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdBomPrice') }">
		</list:data-column>
		<list:data-column property="fdBomCode" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdBomCode') }">
		</list:data-column>
		<list:data-column property="fdFactory" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdFactory') }">
		</list:data-column>
		<list:data-column property="fdApplication" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdApplication') }">
		</list:data-column>
		<list:data-column property="fdVersionDescription" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdVersionDescription') }">
		</list:data-column>
		<list:data-column property="fdVersion" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdVersion') }">
		</list:data-column>
		<list:data-column property="fdMaterielCode" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdMaterielCode') }">
		</list:data-column>
		<list:data-column property="fdDimension" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdDimension') }">
		</list:data-column>
		<list:data-column property="fdMaterielPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdMaterielPrice') }">
		</list:data-column>
		<list:data-column property="fdSerialNumber" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdSerialNumber') }">
		</list:data-column>
		<list:data-column property="fdMaterialDescription" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdMaterialDescription') }">
		</list:data-column>
		<list:data-column property="fdBomPriceUpdateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdBomPriceUpdateTime') }">
		</list:data-column>
		<list:data-column col="href" escape="false">
			/chenyee/quotecenter/chenyee_qc_bom/chenyeeQcBom.do?method=view&fdId=${chenyeeQcBom.fdId}
		</list:data-column>
	</list:data-columns>
	<list:data-paging currentPage="${queryPage.pageno}"
		pageSize="${queryPage.rowsize}" totalSize="${queryPage.totalrows}">
	</list:data-paging>
</list:data>	
