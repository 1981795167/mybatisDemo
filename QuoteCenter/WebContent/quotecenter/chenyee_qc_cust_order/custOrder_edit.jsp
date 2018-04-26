<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<script>Com_IncludeFile("doclist.js");</script>
<script language="JavaScript">
if(DocList_Info == null){
	DocList_Info = new Array("TABLE_DocList_CustOrder");
}else{
	DocList_Info.push("TABLE_DocList_CustOrder");
} 
</script>
<table class="tb_normal" width=100% id="TABLE_DocList_CustOrder" align="center" tbdraggable="true">
	<tr align="center">
		<%--复选框--%> 
		<td class="td_normal_title" style="width: 3%"></td>
		<%--序号--%> 
		<td class="td_normal_title" style="width: 7%">
			<bean:message key="page.serial"/>
		</td>
		<%--客户名字--%> 
		<td class="td_normal_title" style="width: 20%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdCustomerName"/>
		</td>
		<%--Rom + Ram--%> 
		<td class="td_normal_title" style="width: 20%">
		<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdRomRam"/>
		</td>
		<%--产品预估价--%> 
		<%-- <td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdProductPrice"/>
		</td> --%>
		<%--最低售价--%> 
		<td class="td_normal_title" style="width: 40%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdBottomPrice"/>
		</td>
		<%--比例--%> 
		<%-- <td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdPercent"/>
		</td> --%>
		
		<%--按钮--%>
		<td class="td_normal_title" style="width: 7%;" align="center">
			
		</td>
	</tr>
	
	<%--基准行--%>
	<tr KMSS_IsReferRow="1" style="display: none">
		<%--复选框--%> 
		<td style="width: 3%">
			<input type='checkbox' name='DocList_Selected' />
		</td>
		<td KMSS_IsRowIndex="1" width="7%" align="center"></td>
		<td style="width: 20%" align="center" rowspan="2">
		<input type="hidden" name="editItemNum" />
		    <xform:select property="custOrderForms[!{index}].fdCustomerName" style="width:93%" 
					subject="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdCustomerName') }" showPleaseSelect="true" showStatus="edit" required="true"/>
		</td>
		<td style="width: 20%" align="center">
			<xform:select property="custOrderForms[!{index}].fdRomRam" showStatus="edit" style="width:93%;" required="true" showPleaseSelect="true" />
		</td>
		<td style="width: 40%" align="center">
				<xform:text property="custOrderForms[!{index}].fdBottomPrice" showStatus="edit" style="width:10%;" validators="positiveNum" required="true" />&emsp;=&emsp;
				<xform:text property="custOrderForms[!{index}].fdProductPrice" showStatus="readOnly" style="width:10%;" required="true" />&emsp;*&emsp;(&emsp;1&emsp;+&emsp;
				<xform:text property="custOrderForms[!{index}].fdPercent" showStatus="edit" style="width:10%;" validators="positiveNum" required="true" />&emsp;%&emsp;)
		
		</td>
		<!-- <td style="width: 15%" align="center">
		</td> -->
		<!-- <td style="width: 15%" align="center">
		</td> -->		
		<!-- 删除 -->
		<td width="7%" align="center">
			<!-- 
			<a href="javascript:void(0);" onclick="DocList_MoveRow(-1);" title="${lfn:message('doclist.moveup')}">
				<img src="${KMSS_Parameter_StylePath}/icons/icon_up.png" border="0" />
			</a>
			<a href="javascript:void(0);" onclick="DocList_MoveRow(1);" title="${lfn:message('doclist.movedown')}">
				<img src="${KMSS_Parameter_StylePath}/icons/icon_down.png" border="0" />
			</a> -->
			<%-- <a href="javascript:void(0);" onclick="DocList_CopyRow();" title="${lfn:message('doclist.copy')}">
				<img src="${KMSS_Parameter_StylePath}/icons/icon_copy.png" border="0" />
			</a> --%>
			&nbsp;
			<a href="javascript:void(0);" onclick="DocList_DeleteRow();" title="${lfn:message('doclist.delete')}">
				<img src="${KMSS_Parameter_StylePath}/icons/icon_del.png" border="0" />
			</a>
		</td>
	</tr>
	
	<%--内容行--%>
	<c:forEach items="${chenyeeQcProductForm.custOrderForms}"  var="custOrderItem" varStatus="vstatus">
		<tr KMSS_IsContentRow="1">
			<%--复选框--%> 
			<td style="width: 3%">
				<input type='checkbox' name='DocList_Selected' />
			</td>
			<td width="7%" align="center">
				${vstatus.index+1}
				<input type="hidden" name="custOrderForms[${vstatus.index}].fdId" value="${custOrderItem.fdId}" /> 
				<input type="hidden" name="custOrderForms[${vstatus.index}].fdProjectId" value="${chenyeeQcProductForm.fdId}" />
			    <input type="hidden" name="viewItemNum" />
			</td>
			<td width=20% align="center" >
				<%-- <xform:text property="custOrderForms[${vstatus.index}].fdCustomerName" value="${custOrderItem.fdCustomerName}"					
					style="width:93%"  required="true" showStatus="edit"/> --%>
				<%-- <xform:select property="custOrderForms[${vstatus.index}].fdCustomerName" style="width:93%" value="${custOrderItem.fdCustomerName}"
				subject="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdCustomerName') }" showPleaseSelect="true" required="true"/> --%>
			<%-- <c:if test="${chenyeeQcProductForm.method_GET=='edit' }"> --%>
				<xform:text property="custOrderForms[${vstatus.index}].fdCustomerName" value="${custOrderItem.fdCustomerName}" showStatus="readOnly" style="width:93%;" required="true" /> 
		   <%-- </c:if> --%>
		    <%--  <c:if test="${chenyeeQcProductForm.method_GET=='edit' && vstatus.index >= 2}">
				<xform:select property="custOrderForms[${vstatus.index}.fdCustomerName" style="width:93%" value="${custOrderItem.fdCustomerName}"
				   subject="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdCustomerName') }" showPleaseSelect="true" required="true"/> 
		    </c:if> --%>
		    <%-- <c:if test="${chenyeeQcProductForm.method_GET=='add' }">
		        <xform:select property="custOrderForms[${vstatus.index}.fdCustomerName" style="width:93%" value="${custOrderItem.fdCustomerName}"
				   subject="${ lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdCustomerName') }" showPleaseSelect="true" required="true"/>
		    </c:if> --%>
			
			</td>
			<td style="width: 20%" align="center">
				<xform:text property="custOrderForms[${vstatus.index}].fdRomRam" value="${custOrderItem.fdRomRam}"					
					style="width:95%"  required="true" showStatus="readOnly"/>
			</td>
			<td style="width: 40%" align="center">
				<xform:text property="custOrderForms[${vstatus.index}].fdBottomPrice" value="${custOrderItem.fdBottomPrice}"					
					style="width:10%"  required="true" validators="positiveNum" showStatus="edit"/>&emsp;=&emsp;
				<xform:text property="custOrderForms[${vstatus.index}].fdProductPrice" value="${custOrderItem.fdProductPrice}"					
					style="width:10%"  required="true" showStatus="readOnly"/>&emsp;*&emsp;(&emsp;1&emsp;+&emsp;
				<xform:text property="custOrderForms[${vstatus.index}].fdPercent" value="${custOrderItem.fdPercent}"					
					style="width:10%"  required="true" validators="positiveNum" showStatus="edit"/>&emsp;%&emsp;)				
			</td>
			<!-- <td style="width: 15%" align="center">
				
			</td> -->
			<!-- <td style="width: 15%" align="center">
				
			</td> -->			
			<!-- 删除 -->
			<td width="7%" align="center">
				<!-- 
				<a href="javascript:void(0);" onclick="DocList_MoveRow(-1);" title="${lfn:message('doclist.moveup')}">
					<img src="${KMSS_Parameter_StylePath}/icons/icon_up.png" border="0" />
				</a>
				<a href="javascript:void(0);" onclick="DocList_MoveRow(1);" title="${lfn:message('doclist.movedown')}">
					<img src="${KMSS_Parameter_StylePath}/icons/icon_down.png" border="0" />
				</a> -->
				<%-- <a href="javascript:void(0);" onclick="DocList_CopyRow();" title="${lfn:message('doclist.copy')}">
					<img src="${KMSS_Parameter_StylePath}/icons/icon_copy.png" border="0" />
				</a> --%>
				&nbsp;
				<a href="javascript:void(0);" onclick="DocList_DeleteRow();" title="${lfn:message('doclist.delete')}">
					<img src="${KMSS_Parameter_StylePath}/icons/icon_del.png" border="0" />
				</a>
			</td>
		</tr>
	</c:forEach>
	
	<tr type="optRow" class="tr_normal_opt" invalidrow="true">
		<td colspan="9">
			<a href="javascript:void(0);" onclick="addCusOrder2();" title="${lfn:message('doclist.add')}">
				<img src="${KMSS_Parameter_StylePath}/icons/icon_add.png" border="0" />
			</a>
			&nbsp;
			<a href="javascript:void(0);" onclick="DocList_MoveRowBySelect(-1);" title="${lfn:message('doclist.moveup')}">
				<img src="${KMSS_Parameter_StylePath}/icons/icon_up.png" border="0" />
			</a>
			&nbsp;
			<a href="javascript:void(0);" onclick="DocList_MoveRowBySelect(1);" title="${lfn:message('doclist.movedown')}">
				<img src="${KMSS_Parameter_StylePath}/icons/icon_down.png" border="0" />
			</a> 
			&nbsp;
		</td>
	</tr>
	
</table>