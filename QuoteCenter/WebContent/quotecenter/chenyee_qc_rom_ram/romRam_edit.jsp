<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<%@ include file="/chenyee/quotecenter/chenyee_qc_rom_ram/romRam_edit_js.jsp"%>
<script>Com_IncludeFile("doclist.js");</script>
<table class="tb_normal" width=100% id="TABLE_DocList" align="center" tbdraggable="true">
	<tr align="center">
		<%--复选框--%> 
		<td class="td_normal_title" style="width: 3%"></td>
		<%--序号--%> 
		<td class="td_normal_title" style="width: 5%">
			<bean:message key="page.serial"/>
		</td>
		<%--Rom + Ram--%> 
		<td class="td_normal_title" style="width: 11%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdRomRam"/>
		</td>
		<%--Bom预估价--%> 
		<td class="td_normal_title" style="width: 15%">
		<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdBomPrice"/>
		</td>
		<%--采购预估价--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdPurchasePrice"/>
		</td>
		<%--产品预估价--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdProductPrice"/>
		</td>
		<%--预设比例--%> 
		<%-- <td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdPresetPercent"/>
		</td> --%>
		<%--最低售价--%> 
		<td class="td_normal_title" style="width: 15%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcRomRam.fdPresetBottomPrice"/>
		</td>
	</tr>
	
	<%--基准行--%>
	<tr KMSS_IsReferRow="1" style="display: none">
		<%--复选框--%> 
		<td style="width: 3%">
			<input type='checkbox' name='DocList_Selected' />
		</td>
		<td KMSS_IsRowIndex="1" width="5%" align="center"></td>
		<td style="width: 11%" align="center">
		    <input type="hidden" name="romRamIndex"  />
			<%-- <xform:text property="romRamForms[!{index}].fdRomRam" showStatus="edit" style="width:93%;" required="true" /> --%>
	        <xform:select property="romRamForms[!{index}].fdRomRam"   style="width:93%" showPleaseSelect="true" showStatus="edit" required="true" />

		</td>
		<td style="width: 15%" align="center">
			<xform:text property="romRamForms[!{index}].fdBomPrice" showStatus="edit" validators="positiveNum" style="width:93%;" required="true" />
		</td>
		<td style="width: 15%" align="center">
		<xform:text property="romRamForms[!{index}].fdPurchasePrice" showStatus="readOnly" validators="positiveNum" style="width:93%;" required="true" />
		</td>
		<td style="width: 15%" align="center">
		<xform:text property="romRamForms[!{index}].fdProductPrice" showStatus="edit" validators="positiveNum" style="width:93%;" required="true" />
		</td>
		<td style="width: 15%" align="center">
		<xform:text property="romRamForms[!{index}].fdPresetPercent" showStatus="noShow" style="width:93%;" required="true" />
		    
		<!-- </td> -->
		<!-- <td style="width: 15%" align="center"> -->
			<xform:text property="romRamForms[!{index}].fdPresetBottomPrice" showStatus="edit" validators="positiveNum" style="width:93%;" required="true" />
		</td>
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
			</a>
			&nbsp; --%>
			<a href="javascript:void(0);" onclick="DocList_DeleteRow();" title="${lfn:message('doclist.delete')}">
				<img src="${KMSS_Parameter_StylePath}/icons/icon_del.png" border="0" />
			</a>
		</td>
	</tr>
	
	<%--内容行--%>
	<c:forEach items="${chenyeeQcProductForm.romRamForms}"  var="romRamItem" varStatus="vstatus">
		<tr KMSS_IsContentRow="1">
			<%--复选框--%> 
			<td style="width: 3%">
				<input type='checkbox' name='DocList_Selected' />
			</td>
			<td width="5%" align="center">
				${vstatus.index+1}
				<input type="hidden" name="romRamForms[${vstatus.index}].fdId" value="${romRamItem.fdId}" /> 
				<input type="hidden" name="romRamForms[${vstatus.index}].fdProjectId" value="${chenyeeQcProductForm.fdId}" />
			</td>
			<td width=11% align="center">
			<input type="hidden" name="romViewIndex" />
				<%-- <xform:text property="romRamForms[${vstatus.index}].fdRomRam" value="${romRamItem.fdRomRam}"					
					style="width:93%"  required="true" showStatus="edit"/> --%>
				<xform:text property="romRamForms[${vstatus.index}].fdRomRam"  value="${romRamItem.fdRomRam}"
				      style="width:95%"  required="true" showStatus="readOnly" />
	
			</td>
			<td style="width: 15%" align="center">
				<xform:text property="romRamForms[${vstatus.index}].fdBomPrice" value="${romRamItem.fdBomPrice}"					
					style="width:95%"  required="true" validators="positiveNum" showStatus="edit"/>
			</td>
			<td style="width: 15%" align="center">
				<xform:text property="romRamForms[${vstatus.index}].fdPurchasePrice" value="${romRamItem.fdPurchasePrice}"					
					style="width:95%"  required="true" validators="positiveNum" showStatus="readOnly"/>				
			</td>
			<td style="width: 15%" align="center">
				<xform:text property="romRamForms[${vstatus.index}].fdProductPrice" value="${romRamItem.fdProductPrice}"					
					style="width:95%"  required="true" validators="positiveNum" showStatus="readOnly"/>
			</td>
			<td style="width: 15%" align="center">
				<xform:text property="romRamForms[${vstatus.index}].fdPresetPercent" value="${romRamItem.fdPresetPercent}"					
					style="width:95%"  required="true" showStatus="noShow"/>
				
			<!-- </td>
			<td style="width: 15%" align="center"> -->
				<xform:text property="romRamForms[${vstatus.index}].fdPresetBottomPrice" value="${romRamItem.fdPresetBottomPrice}"					
					style="width:95%"  required="true" validators="positiveNum" showStatus="readOnly"/>
			</td>
		</tr>
	</c:forEach>
	
	<tr type="optRow"  invalidrow="true">
	 <td colspan="9">
	 <span style="color:#F00">注意：</span><br>
	 <span style="color:#F00">产品部门必须先录入 rom+ram 信息的产品预估价，才能录入客户定制信息</span>
	</tr>
</table>
