<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<template:include ref="default.edit">
	<template:replace name="title">
		<c:choose>
			<c:when test="${chenyeeQcApplyForm.method_GET == 'add' }">
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
				<c:when test="${ chenyeeQcApplyForm.method_GET == 'edit' }">
					<ui:button text="${ lfn:message('button.update') }" onclick="Com_Submit(document.chenyeeQcApplyForm, 'update');"></ui:button>
				</c:when>
				<c:when test="${ chenyeeQcApplyForm.method_GET == 'add' }">
					<ui:button id="submit_apply_button" text="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.submitApply') }" onclick="createApply();"></ui:button>
					<%-- <ui:button text="${ lfn:message('button.save') }" onclick="Com_Submit(document.chenyeeQcApplyForm, 'save');"></ui:button> --%>
					<%-- <ui:button text="${ lfn:message('button.saveadd') }" onclick="Com_Submit(document.chenyeeQcApplyForm, 'saveadd');"></ui:button> --%>
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
		<html:form action="/chenyee/quotecenter/chenyee_qc_apply/chenyeeQcApply.do">
			<div class="lui_form_content_frame" style="padding-top:20px">
				<table class="tb_simple" width=100%>
					<tr>
						<td colspan="4"><hr style="border: 0.5px dashed #ccc; width: 100%; " ></td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdApplicationTitle"/>: 
						</td>
						<td width="35%">
							<xform:text property="fdApplicationTitle" style="width:85%;background-color: #F2EFE6;" showStatus="readOnly"
								value="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.autoTitle') }"/>
						</td>
					</tr>
				
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdProjectName"/>:
						</td>
						<td width="35%">
							<xform:select property="fdProjectName" style="width:85%" 
								subject="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdProjectName') }" 
								showPleaseSelect="true"/>
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdCustomerName"/>:
						</td>
						<td width="35%">
							<xform:select property="fdCustomerName" style="width:85%" 
								subject="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdCustomerName') }" 
								showPleaseSelect="true" required="true"/>
		                </td>
		            </tr>
                    <tr>
                        <%-- <c:import url="../import/rom_ram.jsp"/> --%>
                        <td class="td_normal_title" width=15%>
                            <bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdRomRam" />:
                        </td>
                        <td width="35%">
                            <xform:select property="fdRomRam" style="width:85%" 
                            	subject="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdRomRam') }" 
                            	showPleaseSelect="true" required="true">
                            </xform:select>
						</td>
					</tr>
					<tr>
						<td></td>
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
						<td colspan="4"><hr style="border: 0.5px dashed #ccc; width: 100%; " ></td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdPrice"/>:
						</td>
						<td width="35%" id="ear_tr">
                            <xform:radio property="fdPrice" subject="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdPrice')}">
                             <xform:simpleDataSource value="0"> 低档&#40;<span id="low_ear" class="earPrice_span"></span>&#41; &nbsp;</xform:simpleDataSource>
                             <xform:simpleDataSource value="0"> 中档&#40;<span id="mid_ear" class="earPrice_span"></span>&#41;&nbsp;</xform:simpleDataSource>
                             <xform:simpleDataSource value="0"> 高档&#40;<span id="high_ear" class="earPrice_span"></span>&#41;&nbsp;</xform:simpleDataSource>
                            </xform:radio>
                            &nbsp;&nbsp;
                            <a class="reset_a" style="color: blue;" href="javascript:;">
                            	<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.emptyPrice"/>
                            </a>
                            <%-- <input type="text" name="fdPrice" value="${ chenyeeQuotecenterApplyForm.fdBottomPrice}" style="display:none;"> --%>
						</td>
						<td  width="30px" id="purchase_tr">
                            <bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdHolster"/>:
                            <%-- <xform:checkbox property="fdHolster" value="1" >
	                             <xform:simpleDataSource value="${a }"> </xform:simpleDataSource>
	                            </xform:checkbox> --%>
                            <input type="checkbox" name="purchase">
                            <input type="text" name="fdHolster" style="display: none;" >
                            <span id="holsterPrice"></span>
						</td>
						<td  width="30px">
                            <bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdMembrane"/>:
                            <%-- <xform:checkbox property="fdMembrane" value="1" >
                             <xform:simpleDataSource value="${a }">15${a } </xform:simpleDataSource>
                            </xform:checkbox> --%>
                            <input type="checkbox" name="purchase" >
                            <input type="text" name="fdMembrane" style="display: none;" >
                            <span id="membranePrice"></span>
						</td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<c:import url="../import/rf_version.jsp"></c:import>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.rfPrice"/>: 
						</td>
						<td width="35%">
							<xform:text className="otherPrice" property="rfPrice" style="width:85%"/>
							</br>
							<span class="errorMessage" style="display: none;color: red;">
								<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.otherPrice.errorMessage"/>
							</span>
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.boxName"/>: 
						</td>
						<td width="35%">
							<xform:text className="otherInfo" property="boxName"  style="width:85%"/>
							</br>
							<span class="infoNotNull" style="display: none;color: red;">
								<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.otherPrice.infoNotNull"/>
							</span>
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.boxPrice"/>: 
						</td>
						<td width="35%">
							<xform:text className="otherPrice" property="boxPrice" style="width:85%" />
							</br>
							<span class="errorMessage" style="display: none;color: red;">
								<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.otherPrice.errorMessage"/>
							</span>
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.partsName"/>: 
						</td>
						<td width="35%">
							<xform:text className="otherInfo" property="partsName" style="width:85%" />
							</br>
							<span class="infoNotNull" style="display: none;color: red;">
								<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.otherPrice.infoNotNull"/>
							</span>
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.partsPrice"/>: 
						</td>
						<td width="35%">
							<xform:text className="otherPrice" property="partsPrice" style="width:85%" />
							</br>
							<span class="errorMessage" style="display: none;color: red;">
								<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.otherPrice.errorMessage"/>
							</span>
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.other"/>: 
						</td>
						<td width="35%">
							<xform:text className="otherInfo" property="other" style="width:85%" />
							</br>
							<span class="infoNotNull" style="display: none;color: red;">
								<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.otherPrice.infoNotNull"/>
							</span>
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.otherPrice"/>: 
						</td>
						<td width="35%">
							<xform:text className="otherPrice" property="otherPrice" style="width:85%" />
							</br>
							<span class="errorMessage" style="display: none;color: red;">
								<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.otherPrice.errorMessage"/>
							</span>
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
							 <!-- 成本价 -->
                            <input name="fdCostPrice" readonly="readonly" style="background-color: #F2EFE6;width: 85%"
                            	subject="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdCostPrice')}"/>
                            <!-- 预设比例 -->
                            <input name="fdPresetPercent" style="display: none;">
						</td>
						
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdBottomPrice"/>:
						</td>
						<td width="35%">
							<!-- 最低售价 -->
                        	<input name="fdBottomPrice" readonly="readonly" style="background-color: #F2EFE6;width: 85%">
						</td>
					</tr>
					<tr>
						
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdApplicationPrice"/>:
						</td>
						<td class="price_percent" style="width:1000px" >
                            <xform:text property="fdApplicationPrice" required="true" style="width:80px" 
                            	subject="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdApplicationPrice')}"/>
                            	&nbsp;=&nbsp;
                            <span id="cost_span"></span>
                            &nbsp;&times;&nbsp;&#40;&nbsp;1&nbsp;&#43;&nbsp;
                            <xform:text property="fdApplyQuotePercent" style="width:80px" required="true" 
                            	subject="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdApplyQuotePercent')}"/>
                            &nbsp;&#37; &nbsp; &#41;
                            <div class="message_div"></div>
						</td>
					</tr>
					<%-- <tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdQuotePath"/>
						</td>
						<td width="35%">
							<xform:text property="fdQuotePath" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdPresetPercent"/>
						</td>
						<td width="35%">
							<xform:text property="fdPresetPercent" style="width:85%" />
						</td>
					</tr>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdApplyQuotePercent"/>
						</td>
						<td width="35%">
							<xform:text property="fdApplyQuotePercent" style="width:85%" />
						</td>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdGm"/>
						</td>
						<td width="35%">
							<xform:text property="fdGm" style="width:85%" />
						</td>
					</tr> --%>
					<tr>
						<td class="td_normal_title" width=15%>
							<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.docCreator"/>:
						</td>
						<td width="35%">
						<ui:person personId="${ chenyeeQcApplyForm.docCreatorId}" 
							personName="${ chenyeeQcApplyForm.docCreatorName}"></ui:person>
							<%-- <c:out value="${ chenyeeQcApplyForm.docCreatorName}"></c:out> --%>
                            <input type="text" name="docCreatorId" style="display: none;" 
                            	value="${ chenyeeQcApplyForm.docCreatorId}" >
                            <input type="text" name="docCreatorName" style="display: none;" 
                            	value="${ chenyeeQcApplyForm.docCreatorName}" >
                            <html:hidden property="docStatus" />
						</td>
						<td class="td_normal_title" width=15%>&nbsp;</td><td width=35%>&nbsp;</td>
					</tr>
				</table>
			</div>
			<ui:tabpage expand="false">
			<%-- 流程处理 --%>
			<!-- 以下代码为嵌入流程标签的代码 -->
				 <c:import url="/sys/workflow/import/sysWfProcess_edit.jsp" charEncoding="UTF-8">
	                <c:param name="formName" value="chenyeeQcApplyForm" />
	                <c:param name="fdKey" value="reviewApply" />
	                <c:param name="showHistoryOpers" value="true" />
	                <c:param name="isExpand" value="true" />
	             </c:import>
			
			</ui:tabpage>
		<html:hidden property="fdId" />
		<html:hidden property="method_GET" />
		</html:form>
		<script>
			$KMSSValidation(document.forms['chenyeeQcApplyForm']);
			
			seajs.use(['lui/jquery', 'lui/dialog', 'lui/topic'],
	            function($,dialog,topic){
	                //todo页面初始化加载预设比例、项目名称+id、客户名称+id
                $(function() {
                     loadPresetPercent();
                     loadProduct();
                     loadCustomer();
                     //test();
                });
            });
		</script>
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
<%@include file="js/edit_js.jsp"%>