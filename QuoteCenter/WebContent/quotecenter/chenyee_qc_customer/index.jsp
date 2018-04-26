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
				Com_OpenWindow("${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_customer/chenyeeQcCustomer.do?method=add");
			}
			function delDoc(){
				var values = [];
				$("input[name='List_Selected']:checked").each(function(){
						values.push($(this).val());
					});
				if(values.length==0){
					dialog.alert('<bean:message key="page.noSelect"/>');
					return;
				}
				seajs.use(['lui/jquery','lui/dialog','lui/topic'], function($, dialog , topic){
					dialog.confirm('<bean:message key="page.comfirmDelete"/>',function(value){
						if(value==true){
							var del_load = dialog.loading();
							$.post('${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_customer/chenyeeQcCustomer.do?method=deleteall&categoryId=${param.categoryId}',$.param({"List_Selected":values},true),function(data){
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
			<ui:varParam name="title"
				value="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }" />
			<ui:varParam name="button">
				[
					<kmss:auth
					requestURL="/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?method=add">
					{
						"text": "${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }",
						<!-- 产品才能新建 -->
					    <kmss:authShow roles="ROLE_CHENYEEQUOTECENTER_PRODUCUT_EDIT">
						   "href": "javascript:addDoc();",
						</kmss:authShow>
						"icon": "lui_icon_l_icon_1"
					}
					</kmss:auth>
				]
			</ui:varParam>
		</ui:combin>
		
		<!-- 引入左侧菜单栏 -->
		<c:import url="/chenyee/quotecenter/import/nav.jsp" charEncoding="UTF-8"/>
		
	</template:replace>
	<template:replace name="content">
		<!-- 查询条件  -->
		<list:criteria id="criteria1">
			<list:cri-ref key="docSubject" ref="criterion.sys.docSubject"/>
			<list:cri-criterion title="${ lfn:message('list.kmDoc.my') }" key="mydoc" multi="false">
				<list:box-select>
					<list:item-select>
						<ui:source type="Static">
							[{text:'${ lfn:message('list.create') }', value:'create'},{text:'${ lfn:message('list.approval') }',value:'approval'}, {text:'${ lfn:message('list.approved') }', value: 'approved'}]
						</ui:source>
					</list:item-select>
				</list:box-select> 
			</list:cri-criterion>
			<list:cri-criterion title="${ lfn:message('sys-doc:sysDocBaseInfo.docStatus')}" key="docStatus"> 
				<list:box-select>
					<list:item-select>
						<ui:source type="Static">
							[{text:'${ lfn:message('status.draft')}', value:'10'},
							{text:'${ lfn:message('status.examine')}',value:'20'},
							{text:'${ lfn:message('status.refuse')}',value:'11'},
							{text:'${ lfn:message('status.discard')}',value:'00'},
							{text:'${ lfn:message('status.publish')}',value:'30'}]
						</ui:source>
					</list:item-select>
				</list:box-select>
			</list:cri-criterion>
			<list:cri-auto modelName="com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcCustomer" 
				property="fdCustomerName;docCreateTime;fdUpdateTime" />
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
							<list:sort property="fdId" text="${lfn:message('list.sort.fdId') }" group="sort.list" value="down"></list:sort>
						</ui:toolbar>
					</td>
					<td align="right">
						<ui:toolbar count="3">
							<ui:togglegroup order="0">
								<ui:toggle icon="lui_icon_s_liebiao" title="${ lfn:message('list.columnTable') }" 
									value="columntable"  group="tg_1" text="${ lfn:message('list.columnTable') }" onclick="LUI('listview').switchType(this.value);">
								</ui:toggle>
							</ui:togglegroup>
							<kmss:auth requestURL="/chenyee/quotecenter/chenyee_qc_customer/chenyeeQcCustomer.do?method=add">
							<ui:button text="${lfn:message('button.add')}" onclick="addDoc()" order="2"></ui:button>
							</kmss:auth>
							<kmss:auth requestURL="/chenyee/quotecenter/chenyee_qc_customer/chenyeeQcCustomer.do?method=deleteall">					 								
							<ui:button text="${lfn:message('button.delete')}" onclick="delDoc()" order="4"></ui:button>
							</kmss:auth>
						</ui:toolbar>
					</td>
				</tr>
			</table>
		</div>
		
		<ui:fixed elem=".lui_list_operation"></ui:fixed>
		 
		 
	 	<list:listview id="listview">
			<ui:source type="AjaxJson">
					{url:'/chenyee/quotecenter/chenyee_qc_customer/chenyeeQcCustomer.do?method=data&categoryId=${param.categoryId}'}
			</ui:source>
			<!-- 列表视图 -->	
			<list:colTable isDefault="false"
				rowHref="/chenyee/quotecenter/chenyee_qc_customer/chenyeeQcCustomer.do?method=view&fdId=!{fdId}"  name="columntable">
				<list:col-checkbox></list:col-checkbox>
				<list:col-serial></list:col-serial>
				 
				<list:col-auto props="fdCustomerName;docCreateTime;fdUpdateTime;docCreator.fdName"></list:col-auto>
			</list:colTable>
		</list:listview> 
		 
	 	<list:paging></list:paging>	 
	</template:replace>
</template:include>

<script type="text/javascript">
			seajs.use([ 'lui/jquery', 'lui/util/str', 'lui/dialog',
					'lui/topic', 'lui/toolbar' ], function($, strutil, dialog,
					topic, toolbar) {

				// 监听新建更新等成功后刷新
				topic.subscribe('successReloadPage', function() {
					topic.publish('list.refresh');
				});
			});
</script>
