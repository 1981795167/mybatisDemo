<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<template:include ref="default.view">
	<template:replace name="title">
		<c:out value="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }"></c:out>
	</template:replace>
	<template:replace name="toolbar">
		<script>
		function deleteDoc(delUrl){
			seajs.use(['lui/dialog'],function(dialog){
				dialog.confirm('<bean:message key="page.comfirmDelete"/>',function(isOk){
					if(isOk){
						Com_OpenWindow(delUrl,'_self');
					}	
				});
			});
		}
		</script>
		<ui:toolbar id="toolbar" layout="sys.ui.toolbar.float" count="3">
			<kmss:auth requestURL="/chenyee/quotecenter/chenyee_qc_rom_ram/chenyeeQcRomRam.do?method=edit&fdId=${param.fdId}" requestMethod="GET">
				<ui:button text="${lfn:message('button.edit')}" 
							onclick="Com_OpenWindow('chenyeeQcRomRam.do?method=edit&fdId=${param.fdId}','_self');" order="2">
				</ui:button>
			</kmss:auth>
			<kmss:auth requestURL="/chenyee/quotecenter/chenyee_qc_rom_ram/chenyeeQcRomRam.do?method=delete&fdId=${param.fdId}" requestMethod="GET">
				<ui:button text="${lfn:message('button.delete')}" order="4"
							onclick="deleteDoc('chenyeeQcRomRam.do?method=delete&fdId=${param.fdId}');">
				</ui:button> 
			</kmss:auth>
			<ui:button text="${lfn:message('button.close')}" order="5" onclick="Com_CloseWindow();">
			</ui:button>
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
		<div class='lui_form_title_frame'>
			<div class='lui_form_subject'>
				<%--
				<c:if test="${isHasNewVersion=='true'}">
				     <span style="color:red">(<bean:message bundle="sys-doc" key="kmDoc.kmDocKnowledge.has" /><bean:message bundle="sys-doc" key="kmDoc.kmDocKnowledge.NewVersion" />)</span>
		        </c:if>
				--%>
			</div>
			<div class='lui_form_baseinfo'>
				<%--
				${ lfn:message('chenyee-quotecenter:chenyeeQcRomRam.docCreator') }：
				<ui:person bean="${chenyeeQcRomRam.docCreator}"></ui:person>&nbsp;
				<c:if test="${ not empty chenyeeQcRomRamForm.docPublishTime }">
					<bean:write name="chenyeeQcRomRamForm" property="docPublishTime" />
				</c:if>&nbsp;
				<c:if test="${chenyeeQcRomRamForm.docStatus == '30'}">
				 <bean:message key="sysEvaluationMain.tab.evaluation.label" bundle="sys-evaluation"/>
					 <span data-lui-mark='sys.evaluation.fdEvaluateCount' class="com_number">
						 <c:choose>
						   <c:when test="${not empty chenyeeQcRomRamForm.evaluationForm.fdEvaluateCount}">
						      ${ chenyeeQcRomRamForm.evaluationForm.fdEvaluateCount }
						   </c:when>
						   <c:otherwise>(0)</c:otherwise>
						 </c:choose>
					 </span>
				</c:if>
				<bean:message key="sysReadLog.tab.readlog.label" bundle="sys-readlog"/><span data-lui-mark="sys.readlog.fdReadCount" class="com_number">(${ chenyeeQcRomRamForm.readLogForm.fdReadCount })</span>
				 --%>
			</div>
		</div>
		<%-- 文档概览
		<c:if test="${ not empty chenyeeQcRomRamForm.fdDescription }">
			<div class="lui_form_summary_frame">			
				<bean:write	name="chenyeeQcRomRamForm" property="fdDescription" />
			</div>
		</c:if>
		--%>
		<div class="lui_form_content_frame">
			<%-- 文档内容 --%>
			<c:if test="${not empty chenyeeQcRomRamForm.docContent}">
				<div style="min-height: 200px;">
					${chenyeeQcRomRamForm.docContent }	
				</div>			
			</c:if>
			<%-- 其它字段 --%>
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
						<c:out value="${chenyeeQcRomRamForm.docCreatorName}" />
					</td>
				</tr>
			</table> 
		</div>
		<ui:tabpage expand="false">
		</ui:tabpage>
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