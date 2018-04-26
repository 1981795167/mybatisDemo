<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<script>Com_IncludeFile("doclist.js");</script>
<script language="JavaScript">
if(DocList_Info == null){
	DocList_Info = new Array("TABLE_DocList_Purchase");
}else{
	DocList_Info.push("TABLE_DocList_Purchase");
} 
</script>
<table class="tb_normal" width=100% id="TABLE_DocList_Purchase" align="center" tbdraggable="true">
<input type="hidden" name="fdPurchaseForm[0].fdId" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdId}" /> 
<input type="hidden" name="fdPurchaseForm[0].fdProductId" value="${chenyeeQcProductForm.fdId}" />
	
<tr align="center">		
		<%--制造费用--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdManufacturePrice"/>
		</td>	
		<td width="35%">				
			<xform:text property="fdPurchaseForm[0].fdManufacturePrice" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdManufacturePrice}" style="width:93%"  validators="positiveNum" required="true" showStatus="edit"/>
		</td>
		<!-- 软件专利费用 -->
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdSoftwarePatentPrice"/>
		</td>
		<td>
			<xform:text property="fdPurchaseForm[0].fdSoftwarePatentPrice" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdSoftwarePatentPrice}" style="width:93%" validators="positiveNum"  required="true" showStatus="edit"/>	
		</td>
</tr>
<tr align="center">		
		<%--高通专利费用--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdQualcommPatentPrice"/>
		</td>	
		<td width="35%">				
			<xform:text property="fdPurchaseForm[0].fdQualcommPatentPrice" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdQualcommPatentPrice}" style="width:93%" validators="positiveNum"  required="true" showStatus="edit"/>
		</td>
		<!-- 物流费用 -->
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdLogisticsPrice"/>
		</td>
		<td>
			<xform:text property="fdPurchaseForm[0].fdLogisticsPrice" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdLogisticsPrice}" style="width:93%"  validators="positiveNum" required="true" showStatus="edit"/>	
		</td>
</tr>
<tr align="center">		
		<%--财务费用--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdFinancialPrice"/>
		</td>	
		<td width="35%">				
			<xform:text property="fdPurchaseForm[0].fdFinancialPrice" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdFinancialPrice}" style="width:93%"  validators="positiveNum" required="true" showStatus="edit"/>
		</td>
		<!-- 备品费用 -->
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdStandbyPrice"/>
		</td>
		<td>
			<xform:text property="fdPurchaseForm[0].fdStandbyPrice" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdStandbyPrice}" style="width:93%" validators="positiveNum"  required="true" showStatus="edit"/>	
		</td>
</tr>
<tr align="center">		
		<%--皮套--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdHolster"/>
		</td>	
		<td width="35%">				
			<xform:text property="fdPurchaseForm[0].fdHolster" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdHolster}" style="width:93%" validators="positiveNum" required="true" showStatus="edit"/>
		</td>
		<!-- 钢化膜-->
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdMembrane"/>
		</td>
		<td>
			<xform:text property="fdPurchaseForm[0].fdMembrane" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdMembrane}" style="width:93%"  validators="positiveNum" required="true" showStatus="edit"/>	
		</td>
</tr>
</table>
	  