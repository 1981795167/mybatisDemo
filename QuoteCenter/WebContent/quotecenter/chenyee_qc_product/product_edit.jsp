<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<script>Com_IncludeFile("doclist.js");</script>
<script language="JavaScript">
if(DocList_Info == null){
	DocList_Info = new Array("TABLE_DocList_Product");
}else{
	DocList_Info.push("TABLE_DocList_Product");
} 
</script>
<table class="tb_normal" width=100% id="TABLE_DocList_Product" align="center" tbdraggable="true">
	<tr align="center">
		<td class="td_normal_title" width=15%>
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcProduct.fdProjectName"/>
		</td>
		<td width="35%">
			<xform:text property="fdProjectName" style="width:85%" showStatus="edit" required="true"/>
		</td>
		<%-- <td class="td_normal_title" width=15%>
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcProduct.fdStandard"/>
		</td>
		<td width="35%">
			<xform:text property="fdStandard" style="width:85%" showStatus="edit"/>
		</td> --%>
	</tr>
	<tr align="center">
		<td class="td_normal_title" width=15%>
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcProduct.fdAndroidVersion"/>
		</td>
		<td width="35%">
			<xform:text property="fdAndroidVersion" style="width:85%" showStatus="edit" required="true"/>
		</td>
		<td class="td_normal_title" width=15%>
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcProduct.fdRearCamera"/>
		</td>
		<td width="35%">
			<xform:text property="fdRearCamera" style="width:85%" showStatus="edit" required="true"/>
		</td>
	</tr>
	<tr align="center">
		<td class="td_normal_title" width=15%>
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcProduct.fdBatteryCapacity"/>
		</td>
		<td width="35%">
			<xform:text property="fdBatteryCapacity" style="width:85%" showStatus="edit" required="true"/>
		</td>
		<td class="td_normal_title" width=15%>
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcProduct.fdFrontCamera"/>
		</td>
		<td width="35%">
			<xform:text property="fdFrontCamera" style="width:85%" showStatus="edit" required="true"/>
		</td>
	</tr>
	<tr align="center">
		<td class="td_normal_title" width=15%>
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcProduct.fdScreeSize"/>
		</td>
		<td width="35%">
			<xform:text property="fdScreeSize" style="width:85%" showStatus="edit" required="true"/>
		</td>
		<td class="td_normal_title" width=15%>
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcProduct.fdHardwarePlatform"/>
		</td>
		<td width="35%">
			<xform:text property="fdHardwarePlatform" style="width:85%" showStatus="edit" required="true"/>
		</td>
	</tr>
</table>