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
	<c:choose>
	    <c:when test="${chenyeeQcProductForm.fdPurchaseForm[0].fdManufacturePrice==0.0}">
	         <td width="35%">				
		        <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	         </td>
	    </c:when>
	    <c:otherwise>
	         <td width="35%">				
		        <xform:text property="fdPurchaseForm[0].fdManufacturePrice" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdManufacturePrice}" style="width:93%"   showStatus="view"/>
	         </td>
	    </c:otherwise>
	</c:choose>
		<!-- 软件专利费用 -->
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdSoftwarePatentPrice"/>
		</td>
	<c:choose>
	    <c:when test="${chenyeeQcProductForm.fdPurchaseForm[0].fdSoftwarePatentPrice==0.0}">
		     <td width="35%">				
		        <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	         </td>
	    </c:when>
	    <c:otherwise>
	        <td>
				<xform:text property="fdPurchaseForm[0].fdSoftwarePatentPrice" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdSoftwarePatentPrice}" style="width:93%"   showStatus="view"/>	
			</td>
	    </c:otherwise>
	</c:choose>
	
		
</tr>
<tr align="center">		
		<%--高通专利费用--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdQualcommPatentPrice"/>
		</td>
		<c:choose>
		    <c:when test="${chenyeeQcProductForm.fdPurchaseForm[0].fdQualcommPatentPrice==0.0}">
		        <td width="35%">				
		           <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	            </td>
		    </c:when>
		    <c:otherwise>
		        <td width="35%">				
			       <xform:text property="fdPurchaseForm[0].fdQualcommPatentPrice" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdQualcommPatentPrice}" style="width:93%"   showStatus="view"/>
		        </td>
		    </c:otherwise>
		</c:choose>	
		
		<!-- 物流费用 -->
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdLogisticsPrice"/>
		</td>
		<c:choose>
		    <c:when test="${chenyeeQcProductForm.fdPurchaseForm[0].fdLogisticsPrice==0.0}">
		       <td width="35%">				
		           <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	            </td>
		    </c:when>
		    <c:otherwise>
		       <td>
			       <xform:text property="fdPurchaseForm[0].fdLogisticsPrice" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdLogisticsPrice}" style="width:93%"   showStatus="view"/>	
		       </td>
		    </c:otherwise>
		</c:choose>
		
</tr>
<tr align="center">		
		<%--财务费用--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdFinancialPrice"/>
		</td>	
		<c:choose>
		    <c:when test="${chenyeeQcProductForm.fdPurchaseForm[0].fdFinancialPrice==0.0}">
		        <td width="35%">				
		           <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	            </td>
		    </c:when>
		    <c:otherwise>
		        <td width="35%">				
			       <xform:text property="fdPurchaseForm[0].fdFinancialPrice" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdFinancialPrice}" style="width:93%"   showStatus="view"/>
		       </td>
		    </c:otherwise>
		</c:choose>
		
		<!-- 备品费用 -->
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdStandbyPrice"/>
		</td>
		<c:choose>
		    <c:when test="${chenyeeQcProductForm.fdPurchaseForm[0].fdStandbyPrice==0.0}">
		        <td width="35%">				
		           <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	            </td>
		    </c:when>
		    <c:otherwise>
		        <td>
			       <xform:text property="fdPurchaseForm[0].fdStandbyPrice" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdStandbyPrice}" style="width:93%"   showStatus="view"/>	
		        </td>
		    </c:otherwise>
		</c:choose>
		
</tr>
<tr align="center">		
		<%--皮套--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdHolster"/>
		</td>
		<c:choose>
		   <c:when test="${chenyeeQcProductForm.fdPurchaseForm[0].fdHolster==0.0}">
		       <td width="35%">				
		           <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	           </td>
		   </c:when>
		   <c:otherwise>
		       <td width="35%">				
			      <xform:text property="fdPurchaseForm[0].fdHolster" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdHolster}" style="width:93%"  showStatus="view"/>
		       </td>
		   </c:otherwise>
		</c:choose>	
		
		<!-- 钢化膜-->
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcPurchase.fdMembrane"/>
		</td>
		<c:choose>
		    <c:when test="${chenyeeQcProductForm.fdPurchaseForm[0].fdMembrane==0.0}">
		        <td width="35%">				
		           <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	            </td>
		    </c:when>
		    <c:otherwise>
		        <td>
			       <xform:text property="fdPurchaseForm[0].fdMembrane" value="${chenyeeQcProductForm.fdPurchaseForm[0].fdMembrane}" style="width:93%"   showStatus="view"/>	
		        </td>
		    </c:otherwise>
		</c:choose>
</tr>
</table>
	  