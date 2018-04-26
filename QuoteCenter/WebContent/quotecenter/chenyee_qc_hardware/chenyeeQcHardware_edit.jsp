<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<template:include ref="default.edit">
	<template:replace name="title">
		<c:choose>
			<c:when test="${chenyeeQcHardwareForm.method_GET == 'add' }">
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
				<c:when test="${ chenyeeQcHardwareForm.method_GET == 'edit' }">
					<ui:button text="${ lfn:message('button.update') }" onclick="Com_Submit(document.chenyeeQcHardwareForm, 'update');"></ui:button>
				</c:when>
				<c:when test="${ chenyeeQcHardwareForm.method_GET == 'add' }">
					<ui:button text="${ lfn:message('button.save') }" onclick="Com_Submit(document.chenyeeQcHardwareForm, 'save');"></ui:button>
					<ui:button text="${ lfn:message('button.saveadd') }" onclick="Com_Submit(document.chenyeeQcHardwareForm, 'saveadd');"></ui:button>
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
		<html:form action="/chenyee/quotecenter/chenyee_qc_hardware/chenyeeQcHardware.do">
			<div class="lui_form_content_frame" style="padding-top:20px">
				<table class="tb_simple" width=100%>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcHardware.fdHardwarePrice"/>
						</td>
						<td width="35%">
							<xform:text property="fdHardwarePrice" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcHardware.docCreateTime"/>
						</td>
						<td width="35%">
							<xform:datetime property="docCreateTime" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcHardware.docAlterTime"/>
						</td>
						<td width="35%">
							<xform:datetime property="docAlterTime" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcHardware.fdUpdateTime"/>
						</td>
						<td width="35%">
							<xform:datetime property="fdUpdateTime" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcHardware.docCreator"/>
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
			$KMSSValidation(document.forms['chenyeeQcHardwareForm']);
		</script>
	</template:replace>
	<%--
	<template:replace name="nav">
		<div style="min-width:200px;"></div>
		<ui:accordionpanel style="min-width:200px;"> 
			<ui:content title="${ lfn:message('sys-doc:kmDoc.kmDocKnowledge.docInfo') }" toggle="false">
				<c:import url="/sys/evaluation/import/sysEvaluationMain_view_star.jsp" charEncoding="UTF-8">
					<c:param name="formName" value="chenyeeQcHardwareForm" />
				</c:import>
				<ul class='lui_form_info'>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcHardware.docCreator" />：
					<ui:person personId="${chenyeeQcHardwareForm.docCreatorId}" personName="${chenyeeQcHardwareForm.docCreatorName}"></ui:person></li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcHardware.docDept" />：${chenyeeQcHardwareForm.docDeptName}</li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcHardware.docStatus" />：<sunbor:enumsShow value="${chenyeeQcHardwareForm.docStatus}" enumsType="common_status" /></li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcHardware.docCreateTime" />：${chenyeeQcHardwareForm.docCreateTime }</li>				
				</ul>
			</ui:content>
		</ui:accordionpanel>
	</template:replace>
	--%>
</template:include>