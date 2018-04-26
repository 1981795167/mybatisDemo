<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<script>Com_IncludeFile("doclist.js");</script>
<script language="JavaScript">
if(DocList_Info == null){
	DocList_Info = new Array("TABLE_DocList_Bom");
}else{
	DocList_Info.push("TABLE_DocList_Bom");
} 
</script>

<table class="tb_normal" width=100% id="TABLE_DocList_Bom" align="center" >
<%-- <input type="hidden" name="fdBomForm[0].fdId" value="${chenyeeQcProductForm.fdBomForm[0].fdId}" /> --%>
<input type="hidden" name="fdBomForm.fdProductId" value="${chenyeeQcProductForm.fdId}" /> 

<tr align="center">		
		<%--Bom编码--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdBomCode"/>
		</td>	
		<td width="35%">				
			<%-- <xform:text property="fdPurchaseForm[0].fdBomCode" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdBomCode}" style="width:93%"   showStatus="edit"/> --%>
			<xform:select property="fdBomCode" showPleaseSelect="true" showStatus="edit" style="width:93%"/>
		</td>
</tr>	
<tr align="center">		
		<%--Bom名称--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdBomName"/>
		</td>	
		<td width="35%">				
			<xform:text property="fdBomName"  style="width:93%"   showStatus="readOnly"/> 
		</td>
		<!-- Bom成本总价 -->
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdBomPrice"/>
		</td>
		<td>
			<%-- <xform:text property="fdPurchaseForm[0].fdBomPrice" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdBomPrice}" style="width:93%"   showStatus="edit"/> --%>
			<xform:text property="fdBomPrice"  style="width:93%"   showStatus="readOnly"/>	
		</td>
</tr>
<tr align="center">	
        <!-- 工厂-->
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdFactory"/>
		</td>
		<td>
			<%-- <xform:text property="fdPurchaseForm[0].fdFactory" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdFactory}" style="width:93%"   showStatus="edit"/> --%>
			<xform:text property="fdFactory"  style="width:93%"   showStatus="readOnly"/> 	
		</td>
		<%--用途--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdApplication"/>
		</td>	
		<td width="35%">				
			<%-- <xform:text property="fdPurchaseForm[0].fdApplication" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdApplication}" style="width:93%"   showStatus="edit"/> --%>
			<xform:text property="fdApplication"  style="width:93%"   showStatus="readOnly"/> 
		</td>		
		
</tr>
<tr align="center">		
		<!-- 版本说明 -->
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdVersionDescription"/>
		</td>
		<td>
			<%-- <xform:text property="fdPurchaseForm[0].fdVersionDescription" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdVersionDescription}" style="width:93%"   showStatus="edit"/> --%>
			<xform:text property="fdVersionDescription"  style="width:93%"   showStatus="readOnly"/> 	
		</td>
		<%--版本--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcBom.fdVersion"/>
		</td>	
		<td width="35%">				
			<%-- <xform:text property="fdPurchaseForm[0].fdVersion" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdVersion}" style="width:93%"  showStatus="edit"/> --%>
			<xform:text property="fdVersion"  style="width:93%"   showStatus="readOnly"/> 
		</td>
</tr>
</table>
<div id="showBom" />
<%@ include file="/chenyee/quotecenter/chenyee_qc_bom/bom_view_js.jsp" %>