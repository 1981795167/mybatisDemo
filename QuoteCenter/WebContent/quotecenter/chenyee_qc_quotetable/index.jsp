<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<template:include ref="default.list">
	<template:replace name="title">
		<c:out value="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }"></c:out>
	</template:replace>
	<template:replace name="head">
	   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/chenyee/quotecenter/css/gridTable.css"></link>
	</template:replace>
	<template:replace name="path">			
		<ui:menu layout="sys.ui.menu.nav"> 
			<ui:menu-item text="${ lfn:message('home.home') }" icon="lui_icon_s_home">
			</ui:menu-item>	
			<ui:menu-item text="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }">
			</ui:menu-item>
		</ui:menu>
	</template:replace>
	
	
	<template:replace name="nav">
		<!-- 新建按钮 -->
		<ui:combin ref="menu.nav.create">
			<ui:varParam name="title" value="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }" />
			<!-- "href": "javascript:addDoc();", -->
			<ui:varParam name="button">
				[
					<kmss:auth requestURL="/chenyee/quotecenter/chenyee_qc_apply/chenyeeQcApply.do?method=add">
					{
						"text": "${ lfn:message('chenyee-quotecenter:table.chenyeeQcApply') }",
						"icon": "lui_icon_l_icon_1"
					}
					</kmss:auth>
				]
			</ui:varParam>				
		</ui:combin>
	
		<!-- 引入左侧菜单栏 -->
        <c:import url="/chenyee/quotecenter/import/nav.jsp"
            charEncoding="UTF-8">
        </c:import>
	</template:replace>
	<template:replace name="content">
		<!-- 查询条件  -->
		<list:criteria id="criteria1">
			<list:cri-ref key="fdProjectName" ref="criterion.sys.string" title="${ lfn:message('chenyee-quotecenter:chenyeeQcProduct.fdProjectName')}" expand="true" />
			<list:cri-ref key="fdCustomerName" ref="criterion.sys.string" title="${ lfn:message('chenyee-quotecenter:chenyeeQcCustomer.fdCustomerName')}" expand="true"/>
			<list:cri-ref key="fdRomRam" ref="criterion.sys.string" title="${ lfn:message('chenyee-quotecenter:chenyeeQcRomRam.fdRomRam')}" expand="true"/>
		</list:criteria>
		 
		<!-- 列表工具栏 -->
		<div class="lui_list_operation">
			<table width="100%">
				<tr>
					<td style='width: 45px;'>
						${ lfn:message('list.orderType') }：
					</td>
					<td>
						<ui:toolbar layout="sys.ui.toolbar.sort" style="float:left" >
							<list:sort property="fdUpdateTime" text="${lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.fdUpdateTime') }" group="sort.list" value="down"></list:sort>
						</ui:toolbar>
					</td>
					<td align="right">
						<ui:toolbar count="3">
							<ui:togglegroup order="0">
								<ui:toggle icon="lui_icon_s_tuwen" title="${lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.card') }" group="tg_1" value="gridtable" selected="true"
									 text="${lfn:message('chenyee-quotecenter:chenyeeQcCustOrder.card') }" onclick="LUI('listview').switchType(this.value);">
								</ui:toggle>
							    <%-- <ui:toggle icon="lui_icon_s_zaiyao" title="${ lfn:message('list.rowTable') }" 
									 group="tg_1" text="${ lfn:message('list.rowTable') }" value="rowtable" onclick="LUI('listview').switchType(this.value);">
								</ui:toggle> --%>
								<ui:toggle icon="lui_icon_s_liebiao" title="${ lfn:message('list.columnTable') }" 
									value="columntable"  group="tg_1" text="${ lfn:message('list.columnTable') }" onclick="LUI('listview').switchType(this.value);">
								</ui:toggle>
							</ui:togglegroup>
							<%-- 取消推荐 
							<c:import url="/sys/introduce/import/sysIntroduceMain_cancelbtn.jsp" charEncoding="UTF-8">
								<c:param name="fdModelName" value="com.landray.kmss.chenyee.quotecenter.model.ChenyeeQuotecenterPurchase" />
							</c:import>
							--%>
							<%-- 修改权限 
							<c:import url="/sys/right/import/doc_right_change_button.jsp" charEncoding="UTF-8">
								<c:param name="modelName" value="com.landray.kmss.chenyee.quotecenter.model.ChenyeeQuotecenterPurchase" />
							</c:import>
							--%>				 
						</ui:toolbar>
					</td>
				</tr>
			</table>
		</div>
		
		<ui:fixed elem=".lui_list_operation"></ui:fixed>
		 
		 
	 	<list:listview id="listview">
			<ui:source type="AjaxJson">
					{url:'/chenyee/quotecenter/chenyee_qc_cust_order/chenyeeQcCustOrder.do?method=data&categoryId=${param.categoryId}'}
			</ui:source>
			
			<%-- 视图列表 --%>
			<list:gridTable isDefault="false" name="gridtable" columnNum="4">
				<list:row-template>
				{$
				  <div class="assetcard_gridtable_content" onclick="openCard('{%grid['fdId']%}')">
					<div class="assetcard_gridtable_content_container">
					  	<div class="bj_box">
							<p class="top"><span class="top_left" title="{%grid['fdCustomerName']%}">{%grid['fdCustomerName']%}</span><span class="top_right">{%grid['fdProjectName']%}</span></p>
							<p class="top center"><span class="top_left"><b>最低： </b>{%grid['fdBottomPrice']%}</span><span class="top_right">{%grid['fdRomRam']%}</span></p>
							<p class="top bottom"><b>成本价： </b>{%grid['fdProductPrice']%}</p>
						</div>
					</div>
				</div>	
				$}
				</list:row-template>
			</list:gridTable>
			
			<!-- 列表视图 -->	
			<list:colTable isDefault="false"
				rowHref="/chenyee/quotecenter/chenyee_qc_cust_order/chenyeeQcCustOrder.do?method=viewDetail&fdId=!{fdId}"  name="columntable">
				<list:col-checkbox></list:col-checkbox>
				<list:col-serial></list:col-serial>
				 
				<list:col-auto props="fdProjectName;fdCustomerName;fdRomRam;fdProductPrice;fdBottomPrice;fdUpdateTime;"></list:col-auto>
			</list:colTable>
			<!-- 摘要视图 -->	
			<%-- <list:rowTable isDefault="false"
				rowHref="/chenyee/quotecenter/chenyee_quotecenter_apply/chenyeeQuotecenterApply.do?method=view&fdId=!{fdId}" name="rowtable" >
				<list:row-template ref="sys.ui.listview.rowtable">
				
				docSubject;icon;fdDescription;docCategory.fdName;docAuthor.fdName;docDept.fdName;docPublishTime;tag
				
			   	{"showOtherProps":"fdApplicationTitle;fdProjectName;fdCustomerName;fdRomRam;fdMembrane;fdHolster;fdPrice;fdBottomPrice;fdCostPrice;fdApplicationPrice;fdApplicationTime;fdApprovalStatus;fdQuotePath;fdPresetPercent;fdApplyQuotePercent;fdGm;docCreator.fdName"}
				</list:row-template>
			</list:rowTable> --%>
			
			
			
		</list:listview> 
		 
	 	<list:paging></list:paging>	 
	 	<script>
	 	seajs.use(['lui/jquery', 'lui/util/str', 'lui/dialog','lui/topic','lui/toolbar'], function($, strutil, dialog , topic ,toolbar) {
	 		window.openCard = function(fdId){
	 			window.location.reload();
				window.open('<c:url value="/chenyee/quotecenter/chenyee_qc_cust_order/chenyeeQcCustOrder.do" />?method=viewDetail&fdId='+fdId,"_blank");
			};
			
			LUI.ready(function(){
				setTimeout('initMenuNav()', 300);
			});
			
			// 左则样式
			window.initMenuNav = function() {
		 		resetMenuNavStyle($(".lui_list_nav_frame li:eq(5) a"));
		 	};		
	 	});
	 	</script>
	</template:replace>
</template:include>
