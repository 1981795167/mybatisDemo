<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<template:include ref="default.edit">
	<template:replace name="title">
		<c:choose>
			<c:when test="${chenyeeQcProductForm.method_GET == 'add' }">
				<c:out value="${ lfn:message('operation.create') } - ${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }"></c:out>	
			</c:when>
			<c:otherwise>
				<c:out value="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }"></c:out>
			</c:otherwise>
		</c:choose>
	</template:replace>
	<template:replace name="toolbar">
		<ui:toolbar id="toolbar" layout="sys.ui.toolbar.float" count="3"> 
			<c:choose>
				<c:when test="${ chenyeeQcProductForm.method_GET == 'edit' }">
					<ui:button text="${ lfn:message('button.update') }" onclick="updateAll();"></ui:button>
				</c:when>
				<c:when test="${ chenyeeQcProductForm.method_GET == 'add' }">
					<ui:button text="${ lfn:message('button.save') }" onclick="Com_Submit(document.chenyeeQcProductForm, 'save');"></ui:button>
				</c:when>
			</c:choose>
			<ui:button text="${ lfn:message('button.close') }" onclick="Com_CloseWindow();"></ui:button>	
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
		<html:form action="/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?execModel=${execModel}">
			<ui:tabpage expand="false" var-navwidth="90%">
			    <c:choose>
				   <c:when test="${ chenyeeQcProductForm.method_GET == 'add' }">
					    <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcProduct') }" expand="true">
	 				       <jsp:include page="/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct_add.jsp"/>
	 			        </ui:content>
				   </c:when>
				
				   <c:otherwise>
				   
				   <c:choose>
				       <c:when test="${param.execModel=='product'}">
				              <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcProduct') }" expand="true">
						          <jsp:include page="/chenyee/quotecenter/chenyee_qc_product/product_edit.jsp"/>
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
								   <jsp:include page="/chenyee/quotecenter/chenyee_qc_rom_ram/romRam_for_product_edit.jsp"/>
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
				 				   <jsp:include page="/chenyee/quotecenter/chenyee_qc_hardware/hardware_edit.jsp"/>
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
								   <jsp:include page="/chenyee/quotecenter/chenyee_qc_purchase/purchase_edit.jsp"/>
							   </ui:content>
							   <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcEarphone') }" expand="true">
								   <jsp:include page="/chenyee/quotecenter/chenyee_qc_earphone/earphone_edit.jsp"/>
							   </ui:content>
				 			   <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcRomRam') }" expand="true">
								   <jsp:include page="/chenyee/quotecenter/chenyee_qc_rom_ram/romRam_for_purchase_edit.jsp"/>
							   </ui:content>
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
								   <jsp:include page="/chenyee/quotecenter/chenyee_qc_rom_ram/romRam_edit.jsp"/>
							  </ui:content>
							  <ui:content title="${ lfn:message('chenyee-quotecenter:table.chenyeeQcCustOrder') }" expand="true">
								   <jsp:include page="/chenyee/quotecenter/chenyee_qc_cust_order/custOrder_edit.jsp"/>
							  </ui:content>
				       </c:when>
				   </c:choose>
				      <jsp:include page="/chenyee/quotecenter/chenyee_qc_product/product_edit_js.jsp"/>
				  </c:otherwise>
		      </c:choose>
			 </ui:tabpage>
			
		<html:hidden property="fdId" />
		<html:hidden property="method_GET" />
		</html:form>
		<script>
			$KMSSValidation(document.forms['chenyeeQcProductForm']);
		</script>
	</template:replace>
	
</template:include>