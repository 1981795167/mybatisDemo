<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<template:include ref="default.list">
	<template:replace name="title">
		<c:out value="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }"></c:out>
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
		<script>
			function addDoc(){
				Com_OpenWindow("${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_apply/chenyeeQcApply.do?method=add");
			}
			function delDoc(){
				var values = [];
				var hrefs = [];
				$("input[name='List_Selected']:checked").each(function(){
					values.push($(this).val());
					hrefs.push($(this).parents("tr").find(".quotePath").html());
				});
				if(values.length==0){
					dialog.alert('<bean:message key="page.noSelect"/>');
					return;
				}
				seajs.use(['lui/jquery','lui/dialog','lui/topic'], function($, dialog , topic){
					dialog.confirm('<bean:message key="page.comfirmDelete"/>',function(value){
						if(value==true){
							var del_load = dialog.loading();
							$.post('${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_apply/chenyeeQcApply.do?method=deleteall&categoryId=${param.categoryId}',$.param({"List_Selected":values, "quotePaths" : hrefs},true),function(data){
								if(del_load!=null){
									del_load.hide();
									topic.publish("list.refresh");
								}
								dialog.result(data);
							},'json');
						}
					});
				});
			}
		</script>
		<!-- 新建按钮 -->
		<ui:combin ref="menu.nav.create">
			<ui:varParam name="title" value="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }" />
			<ui:varParam name="button">
				[
					<kmss:auth requestURL="/chenyee/quotecenter/chenyee_qc_apply/chenyeeQcApply.do?method=add">
					{
						"text": "${ lfn:message('chenyee-quotecenter:table.chenyeeQcApply') }",
						"href": "javascript:addDoc();",
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
		<list:criteria id="criteria1" expand="true">
			<list:cri-ref key="docSubject" ref="criterion.sys.docSubject"/>
			<list:cri-criterion title="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.docStatus')}" key="docStatus" >
				<list:box-select>
					<list:item-select cfg-defaultValue="30">
						<ui:source type="Static">
						[{text:'${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdApproval.pass')}', value:'30'},
                         {text:'${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdApproval.review')}',value:'20'},
                         {text:'${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdApproval.unpass')}',value:'11'}]
						</ui:source>
					</list:item-select>
				</list:box-select>
			</list:cri-criterion>
			<list:cri-auto modelName="com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcApply"
	                property="fdProjectName;fdCustomerName" />
	                <!-- 其他字段（可用作查询条件） -->
	                <!-- ;fdRomRam;fdMembrane;fdHolster;fdPrice;fdBottomPrice;fdCostPrice;fdApplicationPrice;fdApplicationTime;fdApprovalStatus;fdQuotePath;fdPercent;fdGm -->
		</list:criteria>
		 
		<!-- 列表工具栏 -->
		<div class="lui_list_operation">
			<table width="100%">
				<tr>
					<td style='width: 50px;'>
						${ lfn:message('list.orderType') }：
					</td>
					<td>
						<ui:toolbar layout="sys.ui.toolbar.sort" style="float:left" >
							<list:sort property="fdId" text="${lfn:message('list.sort.fdId') }" group="sort.list" value="down"></list:sort>
						</ui:toolbar>
						<list:paging layout="sys.ui.paging.top" > 		
						</list:paging>
					</td>
					<td align="right">
						<ui:toolbar count="3">
							<%-- <ui:togglegroup order="0">
								<ui:toggle icon="lui_icon_s_liebiao" title="${ lfn:message('list.columnTable') }"
	                                    selected="true" value="columntable" group="tg_1" text="${ lfn:message('list.columnTable') }" onclick="LUI('listview').switchType(this.value);">
                                </ui:toggle>
							    <ui:toggle icon="lui_icon_s_zaiyao" title="${ lfn:message('list.rowTable') }" value="rowTable"
									 group="tg_1" text="${ lfn:message('list.rowTable') }" onclick="LUI('listview').switchType(this.value);">
								</ui:toggle>
							</ui:togglegroup> --%>
							<%-- <kmss:auth requestURL="/chenyee/quotecenter/chenyee_qc_apply/chenyeeQcApply.do?method=add">
							<ui:button text="${lfn:message('chenyee-quotecenter:table.chenyeeQcApply')}" onclick="addDoc()" order="2"></ui:button>
							</kmss:auth> --%>
							
							<!-- TODO 删除功能暂时不开放
								因为事务功能，可能在删除之前需要先备份一下，然后备份成功才真正删除
							 -->
							<kmss:auth requestURL="/chenyee/quotecenter/chenyee_qc_apply/chenyeeQcApply.do?method=deleteall">					 								
								<ui:button text="${lfn:message('button.delete')}" onclick="delDoc()" order="4"></ui:button>
							</kmss:auth>
							
							<%-- 取消推荐 
							<c:import url="/sys/introduce/import/sysIntroduceMain_cancelbtn.jsp" charEncoding="UTF-8">
								<c:param name="fdModelName" value="com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcApply" />
							</c:import>
							--%>
							<%-- 修改权限 
							<c:import url="/sys/right/import/doc_right_change_button.jsp" charEncoding="UTF-8">
								<c:param name="modelName" value="com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcApply" />
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
					{url:'/chenyee/quotecenter/chenyee_qc_apply/chenyeeQcApply.do?method=data&categoryId=${param.categoryId}'}
			</ui:source>
			<!-- 列表视图 -->	
			<list:colTable isDefault="false"
				rowHref="/chenyee/quotecenter/chenyee_qc_apply/chenyeeQcApply.do?method=viewBoss&fdId=!{fdId}"  name="columntable">
				<list:col-checkbox></list:col-checkbox>
				<list:col-serial></list:col-serial>
				 
		        <list:col-auto props="fdProjectName;fdCostPrice;fdCustomerName;fdBottomPrice;docCreator.fdName;fdApplicationPrice;fdApplicationTime;docStatus;fdGm;"></list:col-auto>
		               
                 <list:col-html  style="text-align:center;">
              {$ <span class="quotePath" style="display: none;" >{%row['fdQuotePath']%}</span> $}
               </list:col-html>
			</list:colTable>
			
			<%--docSubject;icon;fdDescription;docCategory.fdName;docAuthor.fdName;docDept.fdName;docPublishTime;tag --%>
			
			<!-- 摘要视图 -->	
			<%-- <list:rowTable isDefault="false"
				rowHref="/chenyee/quotecenter/chenyee_qc_apply/chenyeeQcApply.do?method=view&fdId=!{fdId}" name="rowtable" >
				<list:row-template ref="sys.ui.listview.rowtable">
			   	{"showOtherProps":"fdApplicationTitle;fdProjectName;fdCustomerName;fdRomRam;fdMembrane;fdHolster;fdPrice;fdBottomPrice;fdCostPrice;fdApplicationPrice;fdApplicationTime;docStatus;fdQuotePath;fdPresetPercent;fdApplyQuotePercent;fdGm;docCreator.fdName"}
				</list:row-template>
			</list:rowTable> --%>
		</list:listview> 
		 
	 	<list:paging></list:paging>	 
	 	<script>
	 		seajs.use([
			   	   	'lui/jquery', 
			   	   	'lui/util/str', 
			   	   	'lui/dialog',
			   	   	'lui/topic'
			   	   	], function($, strutil, dialog, topic){

				LUI.ready(function(){
					setTimeout('initMenuNav()', 300);
				});

				// 左则样式
				window.initMenuNav = function() {
			 		resetMenuNavStyle($(".quoteboss a"));
			 	};				   	  
			});
	 	</script>
	</template:replace>
</template:include>
