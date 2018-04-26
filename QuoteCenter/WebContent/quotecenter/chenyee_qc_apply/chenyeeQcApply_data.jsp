<%@ page language="java" contentType="text/json; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<list:data>
	<list:data-columns var="chenyeeQcApply" list="${queryPage.list}" varIndex="status">
		<list:data-column property="fdId">
		</list:data-column>
		<list:data-column col="index">
		  ${status+1}
		</list:data-column>
		
		<list:data-column property="rfVersion"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.rfVersion') }">
		</list:data-column>
		<list:data-column property="rfPrice"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.rfPrice') }">
		</list:data-column>
		<list:data-column property="boxName"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.boxName') }">
		</list:data-column>
		<list:data-column property="boxPrice"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.boxPrice') }">
		</list:data-column>
		<list:data-column property="partsName"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.partsName') }">
		</list:data-column>
		<list:data-column property="partsPrice"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.partsPrice') }">
		</list:data-column>
		<list:data-column property="other"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.other') }">
		</list:data-column>
		<list:data-column property="otherPrice"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.otherPrice') }">
		</list:data-column>
		
		<list:data-column property="fdAndroidVersion"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdAndroidVersion') }">
		</list:data-column>
		<list:data-column property="fdRearCamera"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdRearCamera') }">
		</list:data-column>
		<list:data-column property="fdBatteryCapacity"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdBatteryCapacity') }">
		</list:data-column>
		<list:data-column property="fdFrontCamera"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdFrontCamera') }">
		</list:data-column>
		<list:data-column property="fdScreeSize"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdScreeSize') }">
		</list:data-column>
		<list:data-column property="fdHardwarePlatform"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdHardwarePlatform') }">
		</list:data-column>
		
		<list:data-column property="fdApplicationTitle" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdApplicationTitle') }" style="text-align:center;">
		</list:data-column>
		<list:data-column property="fdProjectName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdProjectName') }">
		</list:data-column>
		<list:data-column property="fdCustomerName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdCustomerName') }">
		</list:data-column>
		<list:data-column property="fdRomRam" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdRomRam') }">
		</list:data-column>
		<list:data-column property="fdMembrane" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdMembrane') }">
		</list:data-column>
		<list:data-column property="fdHolster" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdHolster') }">
		</list:data-column>
		<list:data-column property="fdPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdPrice') }">
		</list:data-column>
		<list:data-column property="fdBottomPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdBottomPrice') }">
		</list:data-column>
		<list:data-column property="fdCostPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdCostPrice') }">
		</list:data-column>
		<list:data-column property="fdApplicationPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdApplicationPrice') }">
		</list:data-column>
		<list:data-column property="fdApplicationTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdApplicationTime') }">
		</list:data-column>
		<list:data-column col="docStatus" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.docStatus') }">
			<sunbor:enumsShow
				value="${chenyeeQcApply.docStatus}"
				enumsType="chenyee_qc_doc_status" />
		</list:data-column>
		<list:data-column property="fdQuotePath" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdQuotePath') }">
		</list:data-column>
		<list:data-column property="fdPresetPercent" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdPresetPercent') }">
		</list:data-column>
		<list:data-column property="fdApplyQuotePercent" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdApplyQuotePercent') }">
		</list:data-column>
		<list:data-column property="fdGm" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdGm') }">
		</list:data-column>
		<list:data-column col="docCreator.fdName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.docCreator') }"  escape="false">
			<ui:person personId="${chenyeeQcApply.docCreator.fdId}" personName="${chenyeeQcApply.docCreator.fdName}"></ui:person>
		</list:data-column>
	</list:data-columns>
	
	<list:data-paging page="${queryPage}" />
</list:data>