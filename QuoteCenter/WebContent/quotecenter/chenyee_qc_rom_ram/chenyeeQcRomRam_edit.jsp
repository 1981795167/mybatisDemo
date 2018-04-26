<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<template:include ref="default.edit">
	<template:replace name="title">
		<c:choose>
			<c:when test="${chenyeeQcRomRamForm.method_GET == 'add' }">
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
				<c:when test="${ chenyeeQcRomRamForm.method_GET == 'edit' }">
					<ui:button text="${ lfn:message('button.update') }" onclick="Com_Submit(document.chenyeeQcRomRamForm, 'update');"></ui:button>
				</c:when>
				<c:when test="${ chenyeeQcRomRamForm.method_GET == 'add' }">
					<ui:button text="${ lfn:message('button.save') }" onclick="Com_Submit(document.chenyeeQcRomRamForm, 'save');"></ui:button>
					<ui:button text="${ lfn:message('button.saveadd') }" onclick="Com_Submit(document.chenyeeQcRomRamForm, 'saveadd');"></ui:button>
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
		<html:form action="/chenyee/quotecenter/chenyee_qc_rom_ram/chenyeeQcRomRam.do">
			<div class="lui_form_content_frame" style="padding-top:20px">
				<table class="tb_simple" width=100%>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdRomRam"/>
						</td>
						<td width="35%">
							<xform:text property="fdRomRam" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdBomPrice"/>
						</td>
						<td width="35%">
							<xform:text property="fdBomPrice" style="width:85%" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdPurchasePrice"/>
						</td>
						<td width="35%">
							<xform:text property="fdPurchasePrice" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdProductPrice"/>
						</td>
						<td width="35%">
							<xform:text property="fdProductPrice" style="width:85%" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdPresetPercent"/>
						</td>
						<td width="35%">
							<xform:text property="fdPresetPercent" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdPresetBottomPrice"/>
						</td>
						<td width="35%">
							<xform:text property="fdPresetBottomPrice" style="width:85%" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdProductId"/>
						</td>
						<td width="35%">
							<xform:text property="fdProductId" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.docCreator"/>
						</td>
						<td width="35%">
							<xform:address propertyId="docCreatorId" propertyName="docCreatorName" orgType="ORG_TYPE_PERSON" showStatus="view" />
						</td>
					</tr>
				</table>
			</div>
			<ui:tabpage expand="false">
			</ui:tabpage>
		<html:hidden property="fdId" />
		<html:hidden property="method_GET" />
		</html:form>
		<script>
			$KMSSValidation(document.forms['chenyeeQcRomRamForm']);
		</script>
	</template:replace>
	<%--
	<template:replace name="nav">
		<div style="min-width:200px;"></div>
		<ui:accordionpanel style="min-width:200px;"> 
			<ui:content title="${ lfn:message('sys-doc:kmDoc.kmDocKnowledge.docInfo') }" toggle="false">
				<c:import url="/sys/evaluation/import/sysEvaluationMain_view_star.jsp" charEncoding="UTF-8">
					<c:param name="formName" value="chenyeeQcRomRamForm" />
				</c:import>
				<ul class='lui_form_info'>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.docCreator" />：
					<ui:person personId="${chenyeeQcRomRamForm.docCreatorId}" personName="${chenyeeQcRomRamForm.docCreatorName}"></ui:person></li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.docDept" />：${chenyeeQcRomRamForm.docDeptName}</li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.docStatus" />：<sunbor:enumsShow value="${chenyeeQcRomRamForm.docStatus}" enumsType="common_status" /></li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.docCreateTime" />：${chenyeeQcRomRamForm.docCreateTime }</li>				
				</ul>
			</ui:content>
		</ui:accordionpanel>
	</template:replace>
	--%>
</template:include>