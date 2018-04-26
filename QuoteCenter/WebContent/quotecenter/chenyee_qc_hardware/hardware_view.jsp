<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<script>Com_IncludeFile("doclist.js");</script>
<script language="JavaScript">
if(DocList_Info == null){
	DocList_Info = new Array("TABLE_DocList_Hardware");
}else{
	DocList_Info.push("TABLE_DocList_Hardware");
} 
</script> 
<table class="tb_normal" width=100% id="TABLE_DocList_Hardware" align="center" tbdraggable="true">

	
<tr align="center">		
		<%--硬件成本价--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcHardware.fdHardwarePrice"/>
		</td>
	
		<td width="35%">
			<input type="hidden" name="fdHardwareForm[0].fdId" value="${chenyeeQcProductForm.fdHardwareForm[0].fdId}" /> 
			<input type="hidden" name="fdHardwareForm[0].fdProductId" value="${chenyeeQcProductForm.fdId}" />	
			<xform:text property="fdHardwareForm[0].fdHardwarePrice" value="${chenyeeQcProductForm.fdHardwareForm[0].fdHardwarePrice}" style="width:93%"  required="true" showStatus="view"/>
		</td>
		<!-- 文档附件 -->
		<td class="td_normal_title" width=15%>
 			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcProduct.fdword"/>
 		</td>
		<td  >
			<c:import url="/sys/attachment/sys_att_main/sysAttMain_view.jsp" charEncoding="UTF-8">
				<c:param name="formBeanName" value="chenyeeQcProductForm" />
				<c:param name="fdKey" value="attachment" />
				<c:param name="fdModelId" value="${param.fdId }" />
				<c:param name="fdModelName" value="com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcProduct" />
			</c:import>
		</td>
</tr>
</table>
	  