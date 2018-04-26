<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<script>Com_IncludeFile("doclist.js");</script>
<script language="JavaScript">
if(DocList_Info == null){
	DocList_Info = new Array("TABLE_DocList_Earphone");
}else{
	DocList_Info.push("TABLE_DocList_Earphone");
} 
</script>
<table class="tb_normal" width=100% id="TABLE_DocList_Earphone" align="center" tbdraggable="true">
<input type="hidden" name="fdEarphoneForm[0].fdId" value="${chenyeeQcProductForm.fdEarphoneForm[0].fdId}" /> 
<input type="hidden" name="fdEarphoneForm[0].fdProductId" value="${chenyeeQcProductForm.fdId}" />
	
<tr align="center">		
		<%--低端耳机--%> 		
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcEarphone.fdLowPrice"/>
		</td>
		<c:choose>
		    <c:when test="${chenyeeQcProductForm.fdEarphoneForm[0].fdLowPrice==0.0}">
		         <td style="width: 10%">				
		            <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	             </td>
		    </c:when>
		    <c:otherwise>
		         <td style="width: 10%">				
					<xform:text property="fdEarphoneForm[0].fdLowPrice" value="${chenyeeQcProductForm.fdEarphoneForm[0].fdLowPrice}" style="width:93%"   showStatus="view"/>
				 </td>
		    </c:otherwise>
		</c:choose>	
		
		<!-- 中端耳机-->
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcEarphone.fdMidPrice"/>
		</td>
		<c:choose>
		    <c:when test="${chenyeeQcProductForm.fdEarphoneForm[0].fdMidPrice==0.0}">
		         <td style="width: 10%">				
		            <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	             </td>
		    </c:when>
		    <c:otherwise>
		        <td style="width: 10%">
					<xform:text property="fdEarphoneForm[0].fdMidPrice" value="${chenyeeQcProductForm.fdEarphoneForm[0].fdMidPrice}" style="width:93%"   showStatus="view"/>	
				</td>	
		    </c:otherwise>
		</c:choose>
			
		<%--高端耳机--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcEarphone.fdHighPrice"/>
		</td>
		
		<c:choose>
		    <c:when test="${chenyeeQcProductForm.fdEarphoneForm[0].fdHighPrice==0.0}">
		         <td style="width: 10%">				
		            <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	             </td>
		    </c:when>
		    <c:otherwise>
		         <td style="width: 10%">				
					<xform:text property="fdEarphoneForm[0].fdHighPrice" value="${chenyeeQcProductForm.fdEarphoneForm[0].fdHighPrice}" style="width:93%"   showStatus="view"/>
				 </td>
		    </c:otherwise>
		</c:choose>	
		
		<!-- 指定耳机价格 -->
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcEarphone.fdDefaultPrice"/>
		</td> 
		<c:choose>
		    <c:when test="${chenyeeQcProductForm.fdEarphoneForm[0].fdDefaultPrice==0.0}">
		         <td style="width: 10%">				
		            <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	             </td>
		    </c:when>
		    <c:otherwise>
		         <td style="width: 10%">
					<xform:text property="fdEarphoneForm[0].fdDefaultPrice" value="${chenyeeQcProductForm.fdEarphoneForm[0].fdDefaultPrice}" style="width:93%"   showStatus="view"/>	
				 </td>
		    </c:otherwise>
		</c:choose>
		
</tr>

</table>	  