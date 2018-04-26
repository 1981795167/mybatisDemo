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
			<%-- <kmss:auth requestURL="/chenyee/quotecenter/chenyee_qc_apply/chenyeeQcApply.do?method=edit&fdId=${param.fdId}" requestMethod="GET">
				<ui:button text="${lfn:message('button.edit')}" 
							onclick="Com_OpenWindow('chenyeeQcApply.do?method=edit&fdId=${param.fdId}','_self');" order="2">
				</ui:button>
			</kmss:auth>
			<kmss:auth requestURL="/chenyee/quotecenter/chenyee_qc_apply/chenyeeQcApply.do?method=delete&fdId=${param.fdId}" requestMethod="GET">
				<ui:button text="${lfn:message('button.delete')}" order="4"
							onclick="deleteDoc('chenyeeQcApply.do?method=delete&fdId=${param.fdId}');">
				</ui:button> 
			</kmss:auth> --%>
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
				${ lfn:message('chenyee-quotecenter:chenyeeQcApply.docCreator') }：
				<ui:person bean="${chenyeeQcApply.docCreator}"></ui:person>&nbsp;
				<c:if test="${ not empty chenyeeQcApplyForm.docPublishTime }">
					<bean:write name="chenyeeQcApplyForm" property="docPublishTime" />
				</c:if>&nbsp;
				<c:if test="${chenyeeQcApplyForm.docStatus == '30'}">
				 <bean:message key="sysEvaluationMain.tab.evaluation.label" bundle="sys-evaluation"/>
					 <span data-lui-mark='sys.evaluation.fdEvaluateCount' class="com_number">
						 <c:choose>
						   <c:when test="${not empty chenyeeQcApplyForm.evaluationForm.fdEvaluateCount}">
						      ${ chenyeeQcApplyForm.evaluationForm.fdEvaluateCount }
						   </c:when>
						   <c:otherwise>(0)</c:otherwise>
						 </c:choose>
					 </span>
				</c:if>
				<bean:message key="sysReadLog.tab.readlog.label" bundle="sys-readlog"/><span data-lui-mark="sys.readlog.fdReadCount" class="com_number">(${ chenyeeQcApplyForm.readLogForm.fdReadCount })</span>
				 --%>
			</div>
		</div>
		<%-- 文档概览
		<c:if test="${ not empty chenyeeQcApplyForm.fdDescription }">
			<div class="lui_form_summary_frame">			
				<bean:write	name="chenyeeQcApplyForm" property="fdDescription" />
			</div>
		</c:if>
		--%>
		<div class="lui_form_content_frame">
			<%-- 文档内容 --%>
			<%-- <c:if test="${not empty chenyeeQcApplyForm.docContent}">
				<div style="min-height: 200px;">
					${chenyeeQcApplyForm.docContent }	
				</div>			
			</c:if> --%>
			<%-- 其它字段 --%>
			<table class="tb_simple" width=100%>
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdApplicationTitle"/>:
					</td>
					<td width="35%">
						<xform:text property="fdApplicationTitle" style="width:85%" showStatus="readOnly"/>
					</td>
				</tr>
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdProjectName"/>:
					</td>
					<td width="35%">
						<xform:text property="fdProjectName" style="width:85%" showStatus="readOnly"/>
					</td>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdCustomerName"/>:
					</td>
					<td width="35%">
						<xform:text property="fdCustomerName" style="width:85%" showStatus="readOnly"/>
					</td>
				</tr>
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdRomRam" />:
					</td>
					<td width="35%">
						<xform:text property="fdRomRam" style="width:85%" showStatus="readOnly"/>
					</td>
				</tr>
				
					<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcProduct.fdScreeSize"/>: 
					</td>
					<td width="35%">
						<xform:text property="fdScreeSize" style="width:85%;background-color: #F2EFE6;" showStatus="readOnly" />
					</td>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcProduct.fdFrontCamera"/>: 
					</td>
					<td width="35%">
						<xform:text property="fdFrontCamera" style="width:85%;background-color: #F2EFE6;" showStatus="readOnly" />
					</td>
				</tr>
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcProduct.fdRearCamera"/>: 
					</td>
					<td width="35%">
						<xform:text property="fdRearCamera" style="width:85%;background-color: #F2EFE6;" showStatus="readOnly" />
					</td>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcProduct.fdBatteryCapacity"/>: 
					</td>
					<td width="35%">
						<xform:text property="fdBatteryCapacity" style="width:85%;background-color: #F2EFE6;" showStatus="readOnly" />
					</td>
				</tr>
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcProduct.fdHardwarePlatform"/>: 
					</td>
					<td width="35%">
						<xform:text property="fdHardwarePlatform" style="width:85%;background-color: #F2EFE6;" showStatus="readOnly" />
					</td>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcProduct.fdAndroidVersion"/>: 
					</td>
					<td width="35%">
						<xform:text property="fdAndroidVersion" style="width:85%;background-color: #F2EFE6;" showStatus="readOnly" />
					</td>
				</tr>
				
				<tr>
					<c:if test="${not empty chenyeeQcApplyForm.fdPrice }"> 
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdPrice"/>:
						</td>
						<td width="35%">
							<xform:text property="fdPrice" style="width:85%" showStatus="readOnly"/>
						</td>
					</c:if>
				</tr>
				<tr>
					<c:if test="${not empty chenyeeQcApplyForm.fdMembrane }">
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdMembrane" />:
						</td>
						<td width="35%">
							<xform:text property="fdMembrane" style="width:85%" showStatus="readOnly"/>
						</td>
					</c:if>
					
					<c:if test="${not empty chenyeeQcApplyForm.fdHolster }">
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdHolster" />:
						</td>
						<td width="35%">
							<xform:text property="fdHolster" style="width:85%" showStatus="readOnly"/>
						</td>
					</c:if>
				</tr>
				
				<tr>
					<td></td>
				</tr>
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.rfVersion" />:
					</td>
					<c:if test="${ chenyeeQcApplyForm.rfVersion eq 'southAsian' }">
						<td>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.rfVersion.southAsian"/>
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.rfPrice"/>: 
						</td>
						<td width="35%">
							<xform:text className="otherPrice" property="rfPrice" style="width:85%"/>
						</td>
					</c:if>
							
					<c:if test="${ chenyeeQcApplyForm.rfVersion eq 'europe'}">
						<td>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.rfVersion.europe"/>
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.rfPrice"/>: 
						</td>
						<td width="35%">
							<xform:text className="otherPrice" property="rfPrice" style="width:85%"/>
						</td>
					</c:if>
					<c:if test="${ chenyeeQcApplyForm.rfVersion eq 'american' }">
						<td>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.rfVersion.american"/>
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.rfPrice"/>: 
						</td>
						<td width="35%">
							<xform:text className="otherPrice" property="rfPrice" style="width:85%"/>
						</td>
					</c:if>
				</tr>
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.boxName"/>: 
					</td>
					<td width="35%">
						<xform:text className="otherInfo" property="boxName"  style="width:85%"/>
					</td>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.boxPrice"/>: 
					</td>
					<td width="35%">
						<xform:text className="otherPrice" property="boxPrice" style="width:85%" />
					</td>
				</tr>
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.partsName"/>: 
					</td>
					<td width="35%">
						<xform:text className="otherInfo" property="partsName" style="width:85%" />
					</td>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.partsPrice"/>: 
					</td>
					<td width="35%">
						<xform:text className="otherPrice" property="partsPrice" style="width:85%" />
					</td>
				</tr>
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.other"/>: 
					</td>
					<td width="35%">
						<xform:text className="otherInfo" property="other" style="width:85%" />
					</td>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.otherPrice"/>: 
					</td>
					<td width="35%">
						<xform:text className="otherPrice" property="otherPrice" style="width:85%" />
					</td>
				</tr>
				<tr>
					<td colspan="4"><hr style="border: 0.5px dashed #ccc; width: 100%; " ></td>
				</tr>
				
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdCostPrice"/>:
					</td>
					<td width="35%">
						<xform:text property="fdCostPrice" style="width:85%" showStatus="readOnly"/>
					</td>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdBottomPrice"/>:
					</td>
					<td width="35%">
						<xform:text property="fdBottomPrice" style="width:85%" showStatus="readOnly"/>
					</td>
				</tr>
				<tr>
					<%-- <td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdQuotePath"/>
					</td>
					<td width="35%">
						<xform:text property="fdQuotePath" style="width:85%" />
					</td> --%>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdApplicationPrice"/>:
					</td>
					<td width="35%">
						<xform:text property="fdApplicationPrice" style="width:85%" showStatus="readOnly"/>
					</td>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdPresetPercent"/>:
					</td>
					<td width="35%">
						<xform:text property="fdPresetPercent" style="width:85%" />
					</td>
				</tr>
				<tr>
					 <td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.docStatus"/>:
					</td>
					<td width="35%">
						<%-- <xform:text property="docStatus" style="width:85%" /> --%>
						<sunbor:enumsShow
							value="${chenyeeQcApplyForm.docStatus}"
							enumsType="chenyee_qc_doc_status" />
					</td>
				</tr>
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdApplyQuotePercent"/>:
					</td>
					<td width="35%">
						<xform:text property="fdApplyQuotePercent" style="width:85%" />
					</td>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdGm"/>:
					</td>
					<td width="35%">
						<xform:text property="fdGm" style="width:85%" />
					</td>
				</tr>
				<tr>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.docCreator"/>:
					</td>
					<td width="35%">
						<ui:person personId="${ chenyeeQcApplyForm.docCreatorId}" 
							personName="${ chenyeeQcApplyForm.docCreatorName}"></ui:person>
					</td>
					<td class="td_normal_title" width=15%>&nbsp;</td>
					<td width=35%>&nbsp;</td>
					<td class="td_normal_title" width=15%>
						<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdApplicationTime"/>:
					</td>
					<td width="35%">
						<xform:datetime property="fdApplicationTime" showStatus="readOnly"/>
					</td>
				</tr>
			</table> 
		</div>
		<ui:tabpage expand="false">
			<c:import url="/sys/workflow/import/sysWfProcess_view.jsp" charEncoding="UTF-8">
	                <c:param name="formName" value="chenyeeQcApplyForm" />
	                <c:param name="fdKey" value="reviewApply" />
	                <c:param name="showHistoryOpers" value="true" />
	                <c:param name="isExpand" value="true" />
	         </c:import>
		</ui:tabpage>
	</template:replace>
	<%--
	<template:replace name="nav">
		<div style="min-width:200px;"></div>
		<ui:accordionpanel style="min-width:200px;"> 
			<ui:content title="${ lfn:message('sys-doc:kmDoc.kmDocKnowledge.docInfo') }" toggle="false">
				<c:import url="/sys/evaluation/import/sysEvaluationMain_view_star.jsp" charEncoding="UTF-8">
					<c:param name="formName" value="chenyeeQcApplyForm" />
				</c:import>
				<ul class='lui_form_info'>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.docCreator" />：
					<ui:person personId="${chenyeeQcApplyForm.docCreatorId}" personName="${chenyeeQcApplyForm.docCreatorName}"></ui:person></li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.docDept" />：${chenyeeQcApplyForm.docDeptName}</li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.docStatus" />：<sunbor:enumsShow value="${chenyeeQcApplyForm.docStatus}" enumsType="common_status" /></li>
					<li><bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.docCreateTime" />：${chenyeeQcApplyForm.docCreateTime }</li>				
				</ul>
			</ui:content>
		</ui:accordionpanel>
	</template:replace>
	--%>
</template:include>