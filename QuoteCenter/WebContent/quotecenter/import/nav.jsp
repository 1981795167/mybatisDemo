<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>

<div class="lui_list_nav_frame">
			 <ui:accordionpanel>				 
				<!-- 常用查询 -->
				<ui:content title="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter.manage') }">
				
				<kmss:authShow roles="ROLE_CHENYEEQUOTECENTER_PRODUCUT_VIEW">
				   <ul class='lui_list_nav_list'>
					 <li class="product"><a href="javascript:void(0)" onclick="openQuery('product');resetMenuNavStyle(this);">${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter.productquote') }</a></li>
				   </ul>
				</kmss:authShow>
				
				<kmss:authShow roles="ROLE_CHENYEEQUOTECENTER_HARDWARE_VIEW">
				   <ul class='lui_list_nav_list'>
					 <li class="hardware"><a href="javascript:void(0)" onclick="openQuery('hardware');resetMenuNavStyle(this);">${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter.hardwarequote') }</a></li>
				   </ul>
				</kmss:authShow>
				
				<kmss:authShow roles="ROLE_CHENYEEQUOTECENTER_PURCHASE_VIEW">
				   <ul class='lui_list_nav_list'>
					 <li class="purchase"><a href="javascript:void(0)" onclick="openQuery('purchase');resetMenuNavStyle(this);">${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter.purchasequote') }</a></li>
				   </ul>
				</kmss:authShow>
				
				<kmss:authShow roles="ROLE_CHENYEEQUOTECENTER_SALE_LEADER_VIEW">
				   <ul class='lui_list_nav_list'>
					 <li class="sale"><a href="javascript:void(0)" onclick="openQuery('sale');resetMenuNavStyle(this);">${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter.salequote') }</a></li>
					 <li class="customerManage"><a href="javascript:void(0)" onclick="openQuery('customerManage');resetMenuNavStyle(this);">${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter.customer.manage') }</a></li>
				   </ul>
				</kmss:authShow>
				
				<kmss:authShow roles="ROLE_CHENYEEQUOTECENTER_SALE_VIEW">
				   <ul class='lui_list_nav_list'>
						<li class="quotetable"><a href="javascript:void(0)" onclick="openQuery('quotetable');resetMenuNavStyle(this);">${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter.quotetable') }</a></li>
					 	<li class="quoteapply"><a href="javascript:void(0)" onclick="openQuery('quoteapply');resetMenuNavStyle(this);">${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter.quoteapply') }</a></li>
				   </ul>
				</kmss:authShow>
				<kmss:authShow roles="ROLE_CHENYEEQUOTECENTER_BOSS">
				   <ul class='lui_list_nav_list'>
						<li class="quoteboss"><a href="javascript:void(0)" onclick="openQuery('quoteboss');resetMenuNavStyle(this);">${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter.quoteboss') }</a></li>
				   </ul>
				</kmss:authShow>
				
			</ui:content>
				
			</ui:accordionpanel>
		</div>
		
<script>
seajs.use([
   	   	'lui/jquery', 
   	   	'lui/util/str', 
   	   	'lui/dialog',
   	   	'lui/topic'
   	   	], function($, strutil, dialog, topic) {
	
  	   	window.openQuery = function(prefix) {
  	   	console.log("nav" + prefix);
   	   	var urlPara = prefix;
   	    var srcUrl = "${LUI_ContextPath}/chenyee/quotecenter";
   	   	if(urlPara === 'quotetable') {
   	   		srcUrl = srcUrl + "/chenyee_qc_quotetable/index.jsp";
   	   		window.open(srcUrl,"_self");
	   	}
   	   	if(urlPara === 'quoteapply') {
	   	   	srcUrl = srcUrl + "/chenyee_qc_apply/index.jsp";
   	   		window.open(srcUrl,"_self");
   	   	}
   	 	if(urlPara === 'quoteboss') {
	   	   	srcUrl = srcUrl + "/chenyee_qc_apply/index_boss.jsp";
	   		window.open(srcUrl,"_self");
	   	}
	   	if(urlPara === 'product') {
		   	   	srcUrl = srcUrl + "/chenyee_qc_product/index.jsp?execModel=product";
		   		window.open(srcUrl,"_self");
		}
	   	if(urlPara === 'hardware') {
	   	   	srcUrl = srcUrl + "/chenyee_qc_product/index.jsp?execModel=hardware";
	   		window.open(srcUrl,"_self");
	   	}
	   	if(urlPara === 'purchase') {
	   	   	srcUrl = srcUrl + "/chenyee_qc_product/index.jsp?execModel=purchase";
	   		window.open(srcUrl,"_self");
	   	}
	   	if(urlPara === 'sale') {
	   	   	srcUrl = srcUrl + "/chenyee_qc_product/index.jsp?execModel=sale";
	   		window.open(srcUrl,"_self");
	   	}
	   	if(urlPara === 'customerManage') {
	   	   	srcUrl = srcUrl + "/chenyee_qc_customer/index.jsp?execModel=customerManage";
	   		window.open(srcUrl,"_self");
	   	}
   	};
});

</script>	