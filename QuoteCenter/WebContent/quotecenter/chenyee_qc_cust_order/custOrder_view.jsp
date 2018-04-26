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
		<%--序号--%> 
		<td class="td_normal_title" style="width: 5%">
			<bean:message key="page.serial"/>
		</td>
		<%--客户名字--%> 
		<td class="td_normal_title" style="width: 11%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdCustomerName"/>
		</td>
		<%--Rom + Ram--%> 
		<td class="td_normal_title" style="width: 15%">
		<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdRomRam"/>
		</td>
		<%--产品预估价--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdProductPrice"/>
		</td>
		<%--最低售价--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdBottomPrice"/>
		</td>
		<%--比例--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcCustOrder.fdPercent"/>
		</td>
	</tr>
	
	<%--基准行--%>
	<tr KMSS_IsReferRow="1" style="display: none">
		<td KMSS_IsRowIndex="1" width="5%" align="center"></td>
		<td style="width: 11%" align="center">
			<xform:text property="custOrderForms[!{index}].fdCustomerName" showStatus="view" style="width:93%;" required="true" /> 
		
		</td>
		<td style="width: 15%" align="center">
			<xform:text property="custOrderForms[!{index}].fdRomRam" showStatus="view" style="width:93%;" required="true" />
		</td>
		<td style="width: 15%" align="center">
		<xform:text property="custOrderForms[!{index}].fdProductPrice" showStatus="view" style="width:93%;" required="true" />
		</td>
		<td style="width: 15%" align="center">
		<xform:text property="custOrderForms[!{index}].fdBottomPrice" showStatus="view" style="width:93%;" required="true" />
		</td>
		<td style="width: 15%" align="center">
		<xform:text property="custOrderForms[!{index}].fdPercent" showStatus="view" style="width:93%;" required="true" />
		</td>	
	</tr>
	
	<%--内容行--%>
	<c:forEach items="${chenyeeQcProductForm.custOrderForms}"  var="custOrderItem" varStatus="vstatus">
		<tr KMSS_IsContentRow="1">			
			<td width="5%" align="center">
				${vstatus.index+1}
				<input type="hidden" name="custOrderForms[${vstatus.index}].fdId" value="${custOrderItem.fdId}" /> 
				<input type="hidden" name="custOrderForms[${vstatus.index}].fdProjectId" value="${chenyeeQcProductForm.fdId}" />
			    <input type="hidden" name="viewItemNum" />
			</td>
			<td width=11% align="center">
				<xform:text property="custOrderForms[${vstatus.index}].fdCustomerName" value="${custOrderItem.fdCustomerName}"					
					style="width:93%"  required="true" showStatus="view"/>
					
			</td>
			<td style="width: 15%" align="center">
				<xform:text property="custOrderForms[${vstatus.index}].fdRomRam" value="${custOrderItem.fdRomRam}"					
					style="width:95%"  required="true" showStatus="view"/>
			</td>
			
			<c:choose>
			   <c:when test="${custOrderItem.fdProductPrice==0.0}">
			        <td width="15%" align="center">				
		              <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	                </td>
			   </c:when>
			   <c:otherwise>
			        <td style="width: 15%" align="center">
						<xform:text property="custOrderForms[${vstatus.index}].fdProductPrice" value="${custOrderItem.fdProductPrice}"					
							style="width:95%"  required="true" showStatus="view"/>				
					</td>
			   </c:otherwise>
			</c:choose>
			
			<c:choose>
			   <c:when test="${custOrderItem.fdBottomPrice==0.0}">
			        <td width="15%" align="center">				
		                <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	                </td>
			   </c:when>
			   <c:otherwise>
			        <td style="width: 15%" align="center">
						<xform:text property="custOrderForms[${vstatus.index}].fdBottomPrice" value="${custOrderItem.fdBottomPrice}"					
							style="width:95%"  required="true" showStatus="view"/>
					</td>
			   </c:otherwise>
			</c:choose>
			
			<c:choose>
			   <c:when test="${custOrderItem.fdPercent==0.0}">
			         <td width="15%" align="center">				
		                <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	                 </td>
			   </c:when>
			   <c:otherwise>
			         <td style="width: 15%" align="center">
						<xform:text property="custOrderForms[${vstatus.index}].fdPercent" value="${custOrderItem.fdPercent}"					
							style="width:95%"  required="true" showStatus="view"/>
					 </td>	
			   </c:otherwise>
			</c:choose>
					
		</tr>
	</c:forEach>	
</table>