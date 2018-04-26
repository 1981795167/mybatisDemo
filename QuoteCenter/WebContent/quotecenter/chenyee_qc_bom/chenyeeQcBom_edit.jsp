<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<template:include ref="default.edit">
	<template:replace name="title">
		<c:choose>
			<c:when test="${chenyeeQcBomForm.method_GET == 'add' }">
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
				<c:when test="${ chenyeeQcBomForm.method_GET == 'edit' }">
					<ui:button text="${ lfn:message('button.update') }" onclick="Com_Submit(document.chenyeeQcBomForm, 'update');"></ui:button>
				</c:when>
				<c:when test="${ chenyeeQcBomForm.method_GET == 'add' }">
					<ui:button text="${ lfn:message('button.save') }" onclick="Com_Submit(document.chenyeeQcBomForm, 'save');"></ui:button>
					<ui:button text="${ lfn:message('button.saveadd') }" onclick="Com_Submit(document.chenyeeQcBomForm, 'saveadd');"></ui:button>
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
		<html:form action="/chenyee/quotecenter/chenyee_qc_bom/chenyeeQcBom.do">
			<div class="lui_form_content_frame" style="padding-top:20px">
				<table class="tb_simple" width=100%>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdBomName"/>
						</td>
						<td width="35%">
							<xform:text property="fdBomName" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdBomPrice"/>
						</td>
						<td width="35%">
							<xform:text property="fdBomPrice" style="width:85%" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdBomCode"/>
						</td>
						<td width="35%">
							<xform:text property="fdBomCode" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdFactory"/>
						</td>
						<td width="35%">
							<xform:text property="fdFactory" style="width:85%" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdApplication"/>
						</td>
						<td width="35%">
							<xform:text property="fdApplication" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdVersionDescription"/>
						</td>
						<td width="35%">
							<xform:text property="fdVersionDescription" style="width:85%" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdVersion"/>
						</td>
						<td width="35%">
							<xform:text property="fdVersion" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdMaterielCode"/>
						</td>
						<td width="35%">
							<xform:text property="fdMaterielCode" style="width:85%" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdDimension"/>
						</td>
						<td width="35%">
							<xform:text property="fdDimension" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdMaterielPrice"/>
						</td>
						<td width="35%">
							<xform:text property="fdMaterielPrice" style="width:85%" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdSerialNumber"/>
						</td>
						<td width="35%">
							<xform:text property="fdSerialNumber" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdMaterialDescription"/>
						</td>
						<td width="35%">
							<xform:text property="fdMaterialDescription" style="width:85%" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdBomPriceUpdateTime"/>
						</td>
						<td width="35%">
							<xform:datetime property="fdBomPriceUpdateTime" />
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
			$KMSSValidation(document.forms['chenyeeQcBomForm']);
		</script>
	</template:replace>
	<%--
	<template:replace name="nav">
		<div style="min-width:200px;"></div>
		<ui:accordionpanel style="min-width:200px;"> 
			<ui:content title="${ lfn:message('sys-doc:kmDoc.kmDocKnowledge.docInfo') }" toggle="false">
				<c:import url="/sys/evaluation/import/sysEvaluationMain_view_star.jsp" charEncoding="UTF-8">
					<c:param name="formName" value="chenyeeQcBomForm" />
				</c:import>
				<ul class='lui_form_info'>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.docCreator" />：
					<ui:person personId="${chenyeeQcBomForm.docCreatorId}" personName="${chenyeeQcBomForm.docCreatorName}"></ui:person></li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.docDept" />：${chenyeeQcBomForm.docDeptName}</li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.docStatus" />：<sunbor:enumsShow value="${chenyeeQcBomForm.docStatus}" enumsType="common_status" /></li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.docCreateTime" />：${chenyeeQcBomForm.docCreateTime }</li>				
				</ul>
			</ui:content>
		</ui:accordionpanel>
	</template:replace>
	--%>
</template:include>