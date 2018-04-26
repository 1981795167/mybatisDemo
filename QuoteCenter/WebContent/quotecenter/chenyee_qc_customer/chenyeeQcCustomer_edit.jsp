<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<template:include ref="default.edit">
	<template:replace name="title">
		<c:choose>
			<c:when test="${chenyeeQcCustomerForm.method_GET == 'add' }">
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
				<c:when test="${ chenyeeQcCustomerForm.method_GET == 'edit' }">
					<ui:button text="${ lfn:message('button.update') }" onclick="Com_Submit(document.chenyeeQcCustomerForm, 'update');"></ui:button>
				</c:when>
				<c:when test="${ chenyeeQcCustomerForm.method_GET == 'add' }">
					<ui:button text="${ lfn:message('button.save') }" onclick="Com_Submit(document.chenyeeQcCustomerForm, 'save');"></ui:button>
					<ui:button text="${ lfn:message('button.saveadd') }" onclick="Com_Submit(document.chenyeeQcCustomerForm, 'saveadd');"></ui:button>
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
		<html:form action="/chenyee/quotecenter/chenyee_qc_customer/chenyeeQcCustomer.do">
			<ui:tabpage expand="false" var-navwidth="90%">
			   <ui:content title="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter.customer.manage') }" expand="true">
					<table class="tb_normal" width=100%>
						<tr>
							<td class="td_normal_title" width=15%>
							    <bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustomer.fdCustomerName"/>
							</td>
							<td width="35%">
								<xform:text property="fdCustomerName" style="width:85%" required="true"/>
							</td>
						</tr>
					</table>
				</ui:content>
			</ui:tabpage>
			<%-- <ui:tabpage expand="false">
			</ui:tabpage> --%>
		<html:hidden property="fdId" />
		<html:hidden property="method_GET" />
		</html:form>
		<script>
			$KMSSValidation(document.forms['chenyeeQcCustomerForm']);
		</script>
	</template:replace>
</template:include>