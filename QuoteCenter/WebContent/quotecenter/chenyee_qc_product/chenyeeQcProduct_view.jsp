<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<template:include ref="default.view">
	<template:replace name="title">
		<c:out value="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }"></c:out>
	</template:replace>
	<template:replace name="toolbar">
		<script>
		function deleteDoc(delUrl){
			seajs.use(['lui/dialog'],function(dialog){
				dialog.confirm('<bean:message key="page.comfirmDelete"/>',function(isOk){
					if(isOk){
						Com_OpenWindow(delUrl,'_self');
					}	
				});
			});
		}
		</script>
		<ui:toolbar id="toolbar" layout="sys.ui.toolbar.float" count="3">
			<kmss:auth requestURL="/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?method=edit&fdId=${param.fdId}" requestMethod="GET">
				<ui:button text="${lfn:message('button.edit')}" 
							onclick="Com_OpenWindow('chenyeeQcProduct.do?method=edit&fdId=${param.fdId}&execModel=${execModel}','_self');" order="2">
				</ui:button>
			</kmss:auth>
			<kmss:authShow roles="ROLE_CHENYEEQUOTECENTER_PRODUCUT_VIEW">
				<kmss:auth requestURL="/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?method=delete&fdId=${param.fdId}" requestMethod="GET">
					<ui:button text="${lfn:message('button.delete')}" order="4"
								onclick="deleteDoc('chenyeeQcProduct.do?method=delete&fdId=${param.fdId}');">
					</ui:button> 
				</kmss:auth>
			</kmss:authShow>
			<ui:button text="${lfn:message('button.close')}" order="5" onclick="Com_CloseWindow();">
			</ui:button>
		</ui:toolbar>
	</template:replace>
	<template:replace name="path">
		<ui:menu layout="sys.ui.menu.nav"> 
			<ui:menu-item text="${ lfn:message('home.home') }" icon="lui_icon_s_home">
			</ui:menu-item>	
			<ui:menu-item text="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }">
			</ui:menu-item>
		</ui:menu>
	</template:replace>
	<template:replace name="content">
		<div class='lui_form_title_frame'>
			<div class='lui_form_subject'>
			</div>
			<div class='lui_form_baseinfo'>
			</div>
		</div>
		
    <ui:tabpage expand="false" var-navwidth="90%">
	  <c:choose>
	      <c:when test="${param.execModel=='product'}">
	           <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcProduct') }" expand="true">
	               <jsp:include page="/chenyee/quotecenter/chenyee_qc_product/product_view.jsp"/>
	           </ui:content>
	           <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcHardware') }" expand="true">
					   <jsp:include page="/chenyee/quotecenter/chenyee_qc_hardware/hardware_view.jsp"/>
			   </ui:content>
			   <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcPurchase') }" expand="true">
				       <jsp:include page="/chenyee/quotecenter/chenyee_qc_purchase/purchase_view.jsp"/>
			   </ui:content>
			  <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcEarphone') }" expand="true">
				       <jsp:include page="/chenyee/quotecenter/chenyee_qc_earphone/earphone_view.jsp"/>
			  </ui:content>
			  <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcRomRam') }" expand="true">
				       <jsp:include page="/chenyee/quotecenter/chenyee_qc_rom_ram/romRam_for_prouct_view.jsp"/>
			  </ui:content>
			  <%-- <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcBom') }" expand="true">
				       <jsp:include page="/chenyee/quotecenter/chenyee_qc_bom/bom_view.jsp"/>
			  </ui:content> --%>
	      </c:when>
	      
	      <c:when test="${param.execModel=='hardware'}">
	           <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcProduct') }" expand="true">
	             <jsp:include page="/chenyee/quotecenter/chenyee_qc_product/product_view.jsp"/>
	           </ui:content>
	           <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcHardware') }" expand="true">
					 <jsp:include page="/chenyee/quotecenter/chenyee_qc_hardware/hardware_view.jsp"/>
			   </ui:content>
	      </c:when>
	      
	      <c:when test="${param.execModel=='purchase'}">
	           <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcProduct') }" expand="true">
                   <jsp:include page="/chenyee/quotecenter/chenyee_qc_product/product_view.jsp"/>
	           </ui:content>
	           <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcHardware') }" expand="true">
		            <jsp:include page="/chenyee/quotecenter/chenyee_qc_hardware/hardware_view.jsp"/>
			   </ui:content>
			   <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcPurchase') }" expand="true">
			        <jsp:include page="/chenyee/quotecenter/chenyee_qc_purchase/purchase_view.jsp"/>
			   </ui:content>
			   <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcEarphone') }" expand="true">
			        <jsp:include page="/chenyee/quotecenter/chenyee_qc_earphone/earphone_view.jsp"/>
			   </ui:content>
			   <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcRomRam') }" expand="true">
			        <jsp:include page="/chenyee/quotecenter/chenyee_qc_rom_ram/romRam_for_purchase_view.jsp"/>
			   </ui:content>
			   <%-- <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcBom') }" expand="true">
				    <jsp:include page="/chenyee/quotecenter/chenyee_qc_bom/bom_view.jsp"/>
			   </ui:content> --%>
	      </c:when>
	      
	      <c:when test="${param.execModel=='sale'}">
	           <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcProduct') }" expand="true">
	            <jsp:include page="/chenyee/quotecenter/chenyee_qc_product/product_view.jsp"/>
	          </ui:content>
	          <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcHardware') }" expand="true">
					<jsp:include page="/chenyee/quotecenter/chenyee_qc_hardware/hardware_view.jsp"/>
			  </ui:content>
			  <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcPurchase') }" expand="true">
				    <jsp:include page="/chenyee/quotecenter/chenyee_qc_purchase/purchase_view.jsp"/>
			  </ui:content>
			  <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcEarphone') }" expand="true">
				    <jsp:include page="/chenyee/quotecenter/chenyee_qc_earphone/earphone_view.jsp"/>
			  </ui:content>
			  <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcRomRam') }" expand="true">
				    <jsp:include page="/chenyee/quotecenter/chenyee_qc_rom_ram/romRam_view.jsp"/>
			  </ui:content>
			  <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcCustOrder') }" expand="true">
				    <jsp:include page="/chenyee/quotecenter/chenyee_qc_cust_order/custOrder_view.jsp"/>
			  </ui:content>
			  <%-- <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcBom') }" expand="true">
				    <jsp:include page="/chenyee/quotecenter/chenyee_qc_bom/bom_view.jsp"/>
			  </ui:content> --%>
	      </c:when>  
	  </c:choose>
     </ui:tabpage>
		
	</template:replace>
</template:include>