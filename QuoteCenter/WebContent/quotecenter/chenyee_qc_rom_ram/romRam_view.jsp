<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<script>Com_IncludeFile("doclist.js");</script>
<table class="tb_normal" width=100% id="TABLE_DocList" align="center">
	<tr align="center">
		<%--序号--%> 
		<td class="td_normal_title" style="width: 5%">
			<bean:message key="page.serial"/>
		</td>
		<%--Rom + Ram--%> 
		<td class="td_normal_title" style="width: 18%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdRomRam"/>
		</td>
		<%--Bom预估价--%> 
		<td class="td_normal_title" style="width: 12%">
		<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdBomPrice"/>
		</td>
		<%--采购预估价--%> 
		<td class="td_normal_title" style="width: 10%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdPurchasePrice"/>
		</td>
		<%--产品预估价--%> 
		<td class="td_normal_title" style="width: 16%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdProductPrice"/>
		</td>
		<%--预设比例--%> 
		<td class="td_normal_title" style="width: 12%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdPresetPercent"/>
		</td>
		<%--最低售价--%> 
		<td class="td_normal_title" style="width: 10%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdPresetBottomPrice"/>
		</td>	
	</tr>
	
	<%--基准行--%>
	<tr KMSS_IsReferRow="1" style="display: none">
		<td KMSS_IsRowIndex="1" width="5%" align="center"></td>
		<td style="width: 18%" align="center">
			<xform:text property="romRamForms[!{index}].fdRomRam"  style="width:93%;"  />
		</td>
		<td style="width: 12%" align="center">
			<xform:text property="romRamForms[!{index}].fdBomPrice"  style="width:93%;"  />
		</td>
		<td style="width: 10%" align="center">
		<xform:text property="romRamForms[!{index}].fdPurchasePrice"  style="width:93%;"  />
		</td>
		<td style="width: 16%" align="center">
		<xform:text property="romRamForms[!{index}].fdProductPrice"  style="width:93%;"  />
		</td>
		<td style="width: 12%" align="center">
		<xform:text property="romRamForms[!{index}].fdPresetPercent"  style="width:93%;"  />
		</td>
		<td style="width: 10%" align="center">
			<xform:text property="romRamForms[!{index}].fdPresetBottomPrice"  style="width:93%;"  />
		</td>
	</tr>
	
	<%--内容行--%>
	<c:forEach items="${chenyeeQcProductForm.romRamForms}"  var="romRamItem" varStatus="vstatus">
		<tr KMSS_IsContentRow="1">
			<td width="5%" align="center">
				${vstatus.index+1}
				<input type="hidden" name="romRamForms[${vstatus.index}].fdId" value="${romRamItem.fdId}" /> 
				<input type="hidden" name="romRamForms[${vstatus.index}].fdProjectId" value="${chenyeeQcProductForm.fdId}" />
			</td>
			
	
	        <td width=18% align="center">
				<xform:text property="romRamForms[${vstatus.index}].fdRomRam" value="${romRamItem.fdRomRam}"					
					style="width:95%"  showStatus="view" />
		    </td>
			
			<c:choose>
			   <c:when test="${romRamItem.fdBomPrice==0.0}">
			       <td width="18%" align="center">				
		                <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	               </td>
			   </c:when>
			   <c:otherwise>
			        <td style="width: 12%" align="center">
						<xform:text property="romRamForms[${vstatus.index}].fdBomPrice" value="${romRamItem.fdBomPrice}"					
							style="width:95%"   showStatus="view"/>
					</td>
			   </c:otherwise>
			</c:choose>
			
			<c:choose>
			   <c:when test="${romRamItem.fdPurchasePrice==0.0}">
			        <td width="18%" align="center">				
		                <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	                </td>
			   </c:when>
			   <c:otherwise>
			        <td style="width: 10%" align="center">
						<xform:text property="romRamForms[${vstatus.index}].fdPurchasePrice" value="${romRamItem.fdPurchasePrice}"					
							style="width:95%"  showStatus="view"/>				
					</td>
			   </c:otherwise>
			</c:choose>
			
			
			<c:choose>
			   <c:when test="${romRamItem.fdProductPrice==0.0}">
			        <td width="18%" align="center">				
		                <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	                </td>
			   </c:when>
			   <c:otherwise>
			        <td style="width: 16%" align="center">
						<xform:text property="romRamForms[${vstatus.index}].fdProductPrice" value="${romRamItem.fdProductPrice}"					
							style="width:95%"   showStatus="view"/>
					</td>
			   </c:otherwise>
			</c:choose>
			
			<c:choose>
			   <c:when test="${romRamItem.fdPresetPercent==0.0}">
			        <td width="18%" align="center">				
		                <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	                </td>
			   </c:when>
			   <c:otherwise>
			        <td style="width: 12%" align="center">
						<xform:text property="romRamForms[${vstatus.index}].fdPresetPercent" value="${romRamItem.fdPresetPercent}%"					
							style="width:95%"   showStatus="view"/>
					</td>
			   </c:otherwise>
			</c:choose>
			
			<c:choose>
			   <c:when test="${romRamItem.fdPresetBottomPrice==0.0}">
			        <td width="18%" align="center">				
		                <input type="text" value="" readonly  style="BORDER-TOP-STYLE: none; BORDER-RIGHT-STYLE: none; BORDER-LEFT-STYLE: none; BORDER-BOTTOM-STYLE: none;text-align:center;">
	                </td>
			   </c:when>
			   <c:otherwise>
			        <td style="width: 10%" align="center">
						<xform:text property="romRamForms[${vstatus.index}].fdPresetBottomPrice" value="${romRamItem.fdPresetBottomPrice}"					
							style="width:95%"   showStatus="view"/>
					</td>
			   </c:otherwise>
			</c:choose>
		</tr>
	</c:forEach>
</table>