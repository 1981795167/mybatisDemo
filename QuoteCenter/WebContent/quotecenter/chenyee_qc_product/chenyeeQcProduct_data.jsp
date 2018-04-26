<%@ page language="java" contentType="text/json; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<list:data>
	<list:data-columns var="chenyeeQcProduct" list="${queryPage.list}"
		varIndex="status">
		<list:data-column property="fdId">
		</list:data-column>
		<list:data-column col="index">
		  ${status+1}
		</list:data-column>

		<list:data-column property="fdProjectName"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdProjectName') }">
		</list:data-column>
		<list:data-column property="fdStandard"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdStandard') }">
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
		<list:data-column property="docCreateTime"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.docCreateTime') }">
		</list:data-column>
		<list:data-column property="fdUpdateTime"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdUpdateTime') }">
		</list:data-column>
		<list:data-column col="docCreator.fdName"
			title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.docCreator') }">
			<c:out value="${chenyeeQcProduct.docCreator.fdName}" />
		</list:data-column>

		<c:choose>
			<c:when test="${chenyeeQcProduct.fdBom.size()>0}">
				<list:data-column col="fdBom.fdId" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdBom') }">
					<c:out value="${chenyeeQcProduct.fdBom.get(0).fdId}" />
				</list:data-column>
				<list:data-column col="fdBom.fdBomPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdBomPrice') }">
					<c:out value="${chenyeeQcProduct.fdBom.get(0).fdBomPrice}" />
				</list:data-column>
				<list:data-column col="fdBom.fdBomPriceUpdateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdBomPriceUpdateTime') }">
					<c:out value="${chenyeeQcProduct.fdBom.get(0).fdBomPriceUpdateTime}" />
				</list:data-column>
			</c:when>
			<c:otherwise>
				<list:data-column col="fdBom.fdId" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdBom') }">
					<c:out value="" />
				</list:data-column>
				<list:data-column col="fdBom.fdBomPrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdBomPrice') }">
					<c:out value="" />
				</list:data-column>
				<list:data-column col="fdBom.fdBomPriceUpdateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcBom.fdBomPriceUpdateTime') }">
					<c:out value="" />
				</list:data-column>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${chenyeeQcProduct.fdHardware.size()>0}">
				<list:data-column col="fdHardware.fdId" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdHardware') }">
					<c:out value="${chenyeeQcProduct.fdHardware.get(0).fdId}" />
				</list:data-column>
				<list:data-column col="fdHardware.docCreator.fdName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcHardware.docCreator') }">
					<c:out value="${chenyeeQcProduct.fdHardware.get(0).docCreator.fdName}" />
				</list:data-column>
				<list:data-column col="fdHardware.fdUpdateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcHardware.fdUpdateTime') }">
					<c:out value="${chenyeeQcProduct.fdHardware.get(0).fdUpdateTime}" />
				</list:data-column>
				<list:data-column col="fdHardware.fdHardwarePrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcHardware.fdHardwarePrice') }">
					<c:out value="${chenyeeQcProduct.fdHardware.get(0).fdHardwarePrice}" />
				</list:data-column>
			</c:when>
			<c:otherwise>
				<list:data-column col="fdHardware.fdId" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdHardware') }">
					<c:out value="" />
				</list:data-column>
				<list:data-column col="fdHardware.docCreator.fdName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcHardware.docCreator') }">
					<c:out value="" />
				</list:data-column>
				<list:data-column col="fdHardware.fdUpdateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcHardware.fdUpdateTime') }">
					<c:out value="" />
				</list:data-column>
				<list:data-column col="fdHardware.fdHardwarePrice" title="${ lfn:message('chenyee-quotecenter:chenyeeQcHardware.fdHardwarePrice') }">
					<c:out value="" />
				</list:data-column>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${chenyeeQcProduct.fdPurchase.size()>0}">
				<list:data-column col="fdPurchase.fdId" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdPurchase') }">
					<c:out value="${chenyeeQcProduct.fdPurchase.get(0).fdId}" />
				</list:data-column>
				<list:data-column col="fdPurchase.docCreator.fdName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcPurchase.docCreator') }">
					<c:out value="${chenyeeQcProduct.fdPurchase.get(0).docCreator.fdName}" />
				</list:data-column>
				<list:data-column col="fdPurchase.fdUpdateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcPurchase.fdUpdateTime') }">
					<c:out value="${chenyeeQcProduct.fdPurchase.get(0).fdUpdateTime}" />
				</list:data-column>
			</c:when>
			<c:otherwise>
				<list:data-column col="fdPurchase.fdId" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdPurchase') }">
					<c:out value="" />
				</list:data-column>
				<list:data-column col="fdPurchase.docCreator.fdName" title="${ lfn:message('chenyee-quotecenter:chenyeeQcPurchase.docCreator') }">
					<c:out value="" />
				</list:data-column>
				<list:data-column col="fdPurchase.fdUpdateTime" title="${ lfn:message('chenyee-quotecenter:chenyeeQcPurchase.fdUpdateTime') }">
					<c:out value="" />
				</list:data-column>
			</c:otherwise>
		</c:choose>


		<c:choose>
			<c:when test="${chenyeeQcProduct.fdEarphone.size()>0}">
				<list:data-column col="fdEarphone.fdId" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdEarphone') }">
					<c:out value="${chenyeeQcProduct.fdEarphone.get(0).fdId}" />
				</list:data-column>
			</c:when>
			<c:otherwise>
				<list:data-column col="fdEarphone.fdId" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdEarphone') }">
					<c:out value="" />
				</list:data-column>
			</c:otherwise>
		</c:choose>


	</list:data-columns>

	<list:data-paging page="${queryPage}" />
</list:data>