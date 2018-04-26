<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<template:include ref="default.edit">
	<template:replace name="title">
		<c:choose>
			<c:when test="${chenyeeQcPurchaseForm.method_GET == 'add' }">
				<c:out value="${ lfn:message('operation.create') } - ${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }"></c:out>	
			</c:when>
			<c:otherwise>
				<c:out value="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }"></c:out>
			</c:otherwise>
		</c:choose>
	</template:replace>
	<template:replace name="toolbar">
		<ui:toolbar id="toolbar" layout="sys.ui.toolbar.float" count="3"> 
			<c:choose>
				<c:when test="${ chenyeeQcPurchaseForm.method_GET == 'edit' }">
					<ui:button text="${ lfn:message('button.update') }" onclick="Com_Submit(document.chenyeeQcPurchaseForm, 'update');"></ui:button>
				</c:when>
				<c:when test="${ chenyeeQcPurchaseForm.method_GET == 'add' }">
					<ui:button text="${ lfn:message('button.save') }" onclick="Com_Submit(document.chenyeeQcPurchaseForm, 'save');"></ui:button>
					<ui:button text="${ lfn:message('button.saveadd') }" onclick="Com_Submit(document.chenyeeQcPurchaseForm, 'saveadd');"></ui:button>
				</c:when>
			</c:choose>
			<ui:button text="${ lfn:message('button.close') }" onclick="Com_CloseWindow();"></ui:button>	
		</ui:toolbar>
	</template:replace>
	<template:replace name="path">			
		<ui:menu layout="sys.ui.menu.nav"> 
			<ui:menu-item text="${ lfn:message('home.home') }" icon="lui_icon_s_home">
			</ui:menu-item>	
			<ui:menu-item text="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }">
			</ui:menu-item>
		</ui:menu>
	</template:replace>	
	<template:replace name="content">
		<html:form action="/chenyee/quotecenter/chenyee_qc_purchase/chenyeeQcPurchase.do">
			<div class="lui_form_content_frame" style="padding-top:20px">
				<table class="tb_simple" width=100%>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdManufacturePrice"/>
						</td>
						<td width="35%">
							<xform:text property="fdManufacturePrice" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdStandbyPrice"/>
						</td>
						<td width="35%">
							<xform:text property="fdStandbyPrice" style="width:85%" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdFinancialPrice"/>
						</td>
						<td width="35%">
							<xform:text property="fdFinancialPrice" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdLogisticsPrice"/>
						</td>
						<td width="35%">
							<xform:text property="fdLogisticsPrice" style="width:85%" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdQualcommPatentPrice"/>
						</td>
						<td width="35%">
							<xform:text property="fdQualcommPatentPrice" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdSoftwarePatentPrice"/>
						</td>
						<td width="35%">
							<xform:text property="fdSoftwarePatentPrice" style="width:85%" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdHolster"/>
						</td>
						<td width="35%">
							<xform:text property="fdHolster" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdMembrane"/>
						</td>
						<td width="35%">
							<xform:text property="fdMembrane" style="width:85%" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.docCreateTime"/>
						</td>
						<td width="35%">
							<xform:datetime property="docCreateTime" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdUpdateTime"/>
						</td>
						<td width="35%">
							<xform:datetime property="fdUpdateTime" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.docCreator"/>
						</td>
						<td width="35%">
							<xform:address propertyId="docCreatorId" propertyName="docCreatorName" orgType="ORG_TYPE_PERSON" showStatus="view" />
						</td>
						<td class="td_normal_title" width=15%>&nbsp;</td><td width=35%>&nbsp;</td>
					</tr>
				</table>
			</div>
			<ui:tabpage expand="false">
			</ui:tabpage>
		<html:hidden property="fdId" />
		<html:hidden property="method_GET" />
		</html:form>
		<script>
			$KMSSValidation(document.forms['chenyeeQcPurchaseForm']);
		</script>
	</template:replace>
</template:include>