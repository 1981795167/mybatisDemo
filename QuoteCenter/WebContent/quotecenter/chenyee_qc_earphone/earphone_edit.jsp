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
		<td class="td_normal_title" style="width: 16%">
		    <input type="radio" name="fdDefaultPrice" value="fdLowPriceChecked" />
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcEarphone.fdLowPrice"/>
		</td>	
		<td width="17%">				
			<xform:text property="fdEarphoneForm[0].fdLowPrice" value="${chenyeeQcProductForm.fdEarphoneForm[0].fdLowPrice}" style="width:93%" required="false" validators="positiveNum" showStatus="edit"/>
		</td>
		<!-- 中端耳机-->
		<td class="td_normal_title" style="width: 16%">
		    <input type="radio" name="fdDefaultPrice" value="fdMidPriceChecked"/>
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcEarphone.fdMidPrice"/>
		</td>
		<td width="17%">
			<xform:text property="fdEarphoneForm[0].fdMidPrice" value="${chenyeeQcProductForm.fdEarphoneForm[0].fdMidPrice}" style="width:93%"  required="false" validators="positiveNum" showStatus="edit"/>	
		</td>		
		<%--高端耳机--%> 
		<td class="td_normal_title" style="width: 16%">
		    <input type="radio" name="fdDefaultPrice" value="fdHighPriceChecked"/>
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcEarphone.fdHighPrice"/>
		</td>	
		<td width="18%">				
			<xform:text property="fdEarphoneForm[0].fdHighPrice" value="${chenyeeQcProductForm.fdEarphoneForm[0].fdHighPrice}" style="width:93%"  required="false" validators="positiveNum" showStatus="edit"/>
		</td>
		<xform:text property="fdEarphoneForm[0].fdDefaultPrice" value="${chenyeeQcProductForm.fdEarphoneForm[0].fdDefaultPrice}" style="width:93%"  showStatus="noShow" />
		<input type="hidden" name="fdDefaultPrice2"/>
		<%-- <!-- 默认耳机价格 -->
		<td class="td_normal_title" style="width: 11%">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcEarphone.fdDefaultPrice"/>
		</td>
		<td>
			<xform:text property="fdEarphoneForm[0].fdDefaultPrice" value="${chenyeeQcProductForm.fdEarphoneForm[0].fdDefaultPrice}" style="width:93%"   showStatus="edit"/>	
		</td> --%>
</tr>

</table>
<script>
/**
 * 将页面上显示为0.0的值置为空 
 */
LUI.ready(function(){
	var lowPrice = $("[name='fdEarphoneForm[0].fdLowPrice").val();
	var midPrice = $("[name='fdEarphoneForm[0].fdMidPrice").val();
	var highPrice = $("[name='fdEarphoneForm[0].fdHighPrice").val();
	if(lowPrice==0.0){
		$("[name='fdEarphoneForm[0].fdLowPrice").val("");
	}
	if(midPrice==0.0){
		$("[name='fdEarphoneForm[0].fdMidPrice").val("");
	}
	if(highPrice==0.0){
		$("[name='fdEarphoneForm[0].fdHighPrice").val("");
	}
});
</script>
<%@include file="/chenyee/quotecenter/chenyee_qc_earphone/earphone_edit_js.jsp" %>