<%@ page language="java" contentType="text/json; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/KmssConfig/sys/person/person.tld" prefix="person"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<list:data>
	<list:data-columns var="chenyeeQcRomRam" list="${queryPage.list}" varIndex="status" mobile="true">
		<list:data-column property="fdId">
		</list:data-column>
		<list:data-column col="index">
		  ${status+1}
		</list:data-column>
		<list:data-column property="fdRomRam" title="${ lfn:message('chenyee-quotecenter:chenyeeQcRomRam.fdRomRam') }">
		</list:data-column>
		<list:data-column property="fdBomPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcRomRam.fdBomPrice') }">
		</list:data-column>
		<list:data-column property="fdPurchasePrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcRomRam.fdPurchasePrice') }">
		</list:data-column>
		<list:data-column property="fdProductPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcRomRam.fdProductPrice') }">
		</list:data-column>
		<list:data-column property="fdPresetPercent" title="${ lfn:message('chenyee-quotecenter:chenyeeQcRomRam.fdPresetPercent') }">
		</list:data-column>
		<list:data-column property="fdPresetBottomPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcRomRam.fdPresetBottomPrice') }">
		</list:data-column>
		<list:data-column property="fdProductId" title="${ lfn:message('chenyee-quotecenter:chenyeeQcRomRam.fdProductId') }">
		</list:data-column>
		<list:data-column col="href" escape="false">
			/chenyee/quotecenter/chenyee_qc_rom_ram/chenyeeQcRomRam.do?method=view&fdId=${chenyeeQcRomRam.fdId}
		</list:data-column>
	</list:data-columns>
	<list:data-paging currentPage="${queryPage.pageno}"
		pageSize="${queryPage.rowsize}" totalSize="${queryPage.totalrows}">
	</list:data-paging>
</list:data>	
