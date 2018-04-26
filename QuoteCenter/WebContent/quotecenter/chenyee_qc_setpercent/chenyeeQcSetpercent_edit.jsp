<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<template:include ref="default.edit">
	<template:replace name="title">
		<c:choose>
			<c:when test="${chenyeeQcSetpercentForm.method_GET == 'add' }">
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
				<c:when test="${ chenyeeQcSetpercentForm.method_GET == 'edit' }">
					<ui:button text="${ lfn:message('button.update') }" onclick="Com_Submit(document.chenyeeQcSetpercentForm, 'update');"></ui:button>
				</c:when>
				<c:when test="${ chenyeeQcSetpercentForm.method_GET == 'add' }">
					<ui:button text="${ lfn:message('button.save') }" onclick="Com_Submit(document.chenyeeQcSetpercentForm, 'save');"></ui:button>
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
		<html:form action="/chenyee/quotecenter/chenyee_qc_setpercent/chenyeeQcSetpercent.do">
			<div class="lui_form_content_frame" style="padding-top:20px">
				<table class="tb_normal" width=100%>
					<tr>
						 <td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcSetpercent.fdPresetPercent"/>
						</td> 
						<td  width="35%">
						    <bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdBottomPrice"/>&emsp;=&emsp;
						    <bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdProductPrice"/>&emsp;*&emsp;(&emsp;1&emsp;+&emsp;
							<xform:text property="fdPresetPercent" validators="positiveNum" style="width:6%" />&emsp;%&emsp;)
						</td>
						<%-- <td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcSetpercent.docCreateTime"/>
						</td>
						<td width="35%">
							<xform:datetime property="docCreateTime" />
						</td> --%>
					</tr>
					<%-- <tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcSetpercent.fdUpdateTime"/>
						</td>
						<td width="35%">
							<xform:datetime property="fdUpdateTime" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcSetpercent.docCreator"/>
						</td>
						<td width="35%">
							<xform:address propertyId="docCreatorId" propertyName="docCreatorName" orgType="ORG_TYPE_PERSON" showStatus="view" />
						</td>
					</tr> --%>
				</table>
			</div>
			<ui:tabpage expand="false">
			</ui:tabpage>
		<html:hidden property="fdId" />
		<html:hidden property="method_GET" />
		</html:form>
		<script>
			$KMSSValidation(document.forms['chenyeeQcSetpercentForm']);
		</script>
	</template:replace>
	<%--
	<template:replace name="nav">
		<div style="min-width:200px;"></div>
		<ui:accordionpanel style="min-width:200px;"> 
			<ui:content title="${ lfn:message('sys-doc:kmDoc.kmDocKnowledge.docInfo') }" toggle="false">
				<c:import url="/sys/evaluation/import/sysEvaluationMain_view_star.jsp" charEncoding="UTF-8">
					<c:param name="formName" value="chenyeeQcSetpercentForm" />
				</c:import>
				<ul class='lui_form_info'>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcSetpercent.docCreator" />：
					<ui:person personId="${chenyeeQcSetpercentForm.docCreatorId}" personName="${chenyeeQcSetpercentForm.docCreatorName}"></ui:person></li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcSetpercent.docDept" />：${chenyeeQcSetpercentForm.docDeptName}</li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcSetpercent.docStatus" />：<sunbor:enumsShow value="${chenyeeQcSetpercentForm.docStatus}" enumsType="common_status" /></li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcSetpercent.docCreateTime" />：${chenyeeQcSetpercentForm.docCreateTime }</li>				
				</ul>
			</ui:content>
		</ui:accordionpanel>
	</template:replace>
	--%>
</template:include>
<script type="text/javascript">
LUI.ready(function(){
	
	$.ajax("${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_setpercent/chenyeeQcSetpercent.do?method=loadPresetPercent", {
		dataType : 'json'
	}).done(function (data) {
		if(data.length <= 0) { //数据库没有数据
			$("[name='fdPresetPercent']").val(10);
		}
	}).fail(function (xhr, status) {
	    console.log('失败: ' + xhr.status + ', 原因: ' + status);
	});
	
});
</script>