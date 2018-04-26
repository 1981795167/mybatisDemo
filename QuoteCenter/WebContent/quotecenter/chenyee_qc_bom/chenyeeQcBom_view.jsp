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
			<kmss:auth requestURL="/chenyee/quotecenter/chenyee_qc_bom/chenyeeQcBom.do?method=edit&fdId=${param.fdId}" requestMethod="GET">
				<ui:button text="${lfn:message('button.edit')}" 
							onclick="Com_OpenWindow('chenyeeQcBom.do?method=edit&fdId=${param.fdId}','_self');" order="2">
				</ui:button>
			</kmss:auth>
			<kmss:auth requestURL="/chenyee/quotecenter/chenyee_qc_bom/chenyeeQcBom.do?method=delete&fdId=${param.fdId}" requestMethod="GET">
				<ui:button text="${lfn:message('button.delete')}" order="4"
							onclick="deleteDoc('chenyeeQcBom.do?method=delete&fdId=${param.fdId}');">
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
				${ lfn:message('chenyee-quotecenter:chenyeeQcBom.docCreator') }：
				<ui:person bean="${chenyeeQcBom.docCreator}"></ui:person>&nbsp;
				<c:if test="${ not empty chenyeeQcBomForm.docPublishTime }">
					<bean:write name="chenyeeQcBomForm" property="docPublishTime" />
				</c:if>&nbsp;
				<c:if test="${chenyeeQcBomForm.docStatus == '30'}">
				 <bean:message key="sysEvaluationMain.tab.evaluation.label" bundle="sys-evaluation"/>
					 <span data-lui-mark='sys.evaluation.fdEvaluateCount' class="com_number">
						 <c:choose>
						   <c:when test="${not empty chenyeeQcBomForm.evaluationForm.fdEvaluateCount}">
						      ${ chenyeeQcBomForm.evaluationForm.fdEvaluateCount }
						   </c:when>
						   <c:otherwise>(0)</c:otherwise>
						 </c:choose>
					 </span>
				</c:if>
				<bean:message key="sysReadLog.tab.readlog.label" bundle="sys-readlog"/><span data-lui-mark="sys.readlog.fdReadCount" class="com_number">(${ chenyeeQcBomForm.readLogForm.fdReadCount })</span>
				 --%>
			</div>
		</div>
		<%-- 文档概览
		<c:if test="${ not empty chenyeeQcBomForm.fdDescription }">
			<div class="lui_form_summary_frame">			
				<bean:write	name="chenyeeQcBomForm" property="fdDescription" />
			</div>
		</c:if>
		--%>
		<div class="lui_form_content_frame">
		
			<%-- 其它字段 --%>
			<table class="tb_normal" width=100%>
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
					<td class="td_normal_title" width=15%>&nbsp;</td>
					<td width=35%>&nbsp;</td>
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