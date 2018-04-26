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
			<kmss:auth requestURL="/chenyee/quotecenter/chenyee_qc_cust_order/chenyeeQcCustOrder.do?method=edit&fdId=${param.fdId}" requestMethod="GET">
				<ui:button text="${lfn:message('button.edit')}" 
							onclick="Com_OpenWindow('chenyeeQcCustOrder.do?method=edit&fdId=${param.fdId}','_self');" order="2">
				</ui:button>
			</kmss:auth>
			<kmss:auth requestURL="/chenyee/quotecenter/chenyee_qc_cust_order/chenyeeQcCustOrder.do?method=delete&fdId=${param.fdId}" requestMethod="GET">
				<ui:button text="${lfn:message('button.delete')}" order="4"
							onclick="deleteDoc('chenyeeQcCustOrder.do?method=delete&fdId=${param.fdId}');">
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
				${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.docCreator') }：
				<ui:person bean="${chenyeeQcCustOrder.docCreator}"></ui:person>&nbsp;
				<c:if test="${ not empty chenyeeQcCustOrderForm.docPublishTime }">
					<bean:write name="chenyeeQcCustOrderForm" property="docPublishTime" />
				</c:if>&nbsp;
				<c:if test="${chenyeeQcCustOrderForm.docStatus == '30'}">
				 <bean:message key="sysEvaluationMain.tab.evaluation.label" bundle="sys-evaluation"/>
					 <span data-lui-mark='sys.evaluation.fdEvaluateCount' class="com_number">
						 <c:choose>
						   <c:when test="${not empty chenyeeQcCustOrderForm.evaluationForm.fdEvaluateCount}">
						      ${ chenyeeQcCustOrderForm.evaluationForm.fdEvaluateCount }
						   </c:when>
						   <c:otherwise>(0)</c:otherwise>
						 </c:choose>
					 </span>
				</c:if>
				<bean:message key="sysReadLog.tab.readlog.label" bundle="sys-readlog"/><span data-lui-mark="sys.readlog.fdReadCount" class="com_number">(${ chenyeeQcCustOrderForm.readLogForm.fdReadCount })</span>
				 --%>
			</div>
		</div>
		<%-- 文档概览
		<c:if test="${ not empty chenyeeQcCustOrderForm.fdDescription }">
			<div class="lui_form_summary_frame">			
				<bean:write	name="chenyeeQcCustOrderForm" property="fdDescription" />
			</div>
		</c:if>
		--%>
		<div class="lui_form_content_frame">
			<%-- 文档内容 --%>
			<c:if test="${not empty chenyeeQcCustOrderForm.docContent}">
				<div style="min-height: 200px;">
					${chenyeeQcCustOrderForm.docContent }	
				</div>			
			</c:if>
			<%-- 其它字段 --%>
			<table class="tb_simple" width=100%>
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdCustomerName"/>
					</td>
					<td width="35%">
						<xform:text property="fdCustomerName" style="width:85%" />
					</td>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdRomRam"/>
					</td>
					<td width="35%">
						<xform:text property="fdRomRam" style="width:85%" />
					</td>
				</tr>
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdProductPrice"/>
					</td>
					<td width="35%">
						<xform:text property="fdProductPrice" style="width:85%" />
					</td>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdOrderBottomPrice"/>
					</td>
					<td width="35%">
						<xform:text property="fdOrderBottomPrice" style="width:85%" />
					</td>
				</tr>
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdOrderBottomPercent"/>
					</td>
					<td width="35%">
						<xform:text property="fdOrderBottomPercent" style="width:85%" />
					</td>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.docCreateTime"/>
					</td>
					<td width="35%">
						<xform:datetime property="docCreateTime" />
					</td>
				</tr>
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdUpdateTime"/>
					</td>
					<td width="35%">
						<xform:datetime property="fdUpdateTime" />
					</td>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdProductId"/>
					</td>
					<td width="35%">
						<xform:text property="fdProductId" style="width:85%" />
					</td>
				</tr>
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.docCreator"/>
					</td>
					<td width="35%">
						<c:out value="${chenyeeQcCustOrderForm.docCreatorName}" />
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
					<c:param name="formName" value="chenyeeQcCustOrderForm" />
				</c:import>
				<ul class='lui_form_info'>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.docCreator" />：
					<ui:person personId="${chenyeeQcCustOrderForm.docCreatorId}" personName="${chenyeeQcCustOrderForm.docCreatorName}"></ui:person></li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.docDept" />：${chenyeeQcCustOrderForm.docDeptName}</li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.docStatus" />：<sunbor:enumsShow value="${chenyeeQcCustOrderForm.docStatus}" enumsType="common_status" /></li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.docCreateTime" />：${chenyeeQcCustOrderForm.docCreateTime }</li>				
				</ul>
			</ui:content>
		</ui:accordionpanel>
	</template:replace>
	--%>
</template:include>