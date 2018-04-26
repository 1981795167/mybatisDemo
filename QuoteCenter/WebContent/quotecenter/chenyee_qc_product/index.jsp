<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<template:include ref="default.list">
	<template:replace name="title">
		<c:out
			value="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }"></c:out>
	</template:replace>
	<template:replace name="path">
		<ui:menu layout="sys.ui.menu.nav">
			<ui:menu-item text="${ lfn:message('home.home') }"
				icon="lui_icon_s_home">
			</ui:menu-item>
			<ui:menu-item
				text="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }">
			</ui:menu-item>
		</ui:menu>
	</template:replace>
	<template:replace name="nav">
		<script>
			function addDoc() {
				Com_OpenWindow("${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?method=add");
			}
			function delDoc() {
				var values = [];
				$("input[name='List_Selected']:checked").each(function() {
					values.push($(this).val());
				});
				if (values.length == 0) {
					dialog.alert('<bean:message key="page.noSelect"/>');
					return;
				}
				seajs.use(['lui/jquery', 'lui/dialog', 'lui/topic' ],
								function($, dialog, topic) {
									dialog.confirm('<bean:message key="page.comfirmDelete"/>',function(value) {
														if (value == true) {
															var del_load = dialog.loading();
															$.post('${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?method=deleteall&categoryId=${param.categoryId}',
																			$.param({"List_Selected" : values
																							},true),function(data) {
																				if (del_load != null) {
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
			<list:cri-ref key="docSubject" ref="criterion.sys.docSubject" />

			<list:cri-auto
				modelName="com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcProduct"
				property="fdProjectName" />
		</list:criteria>

		<!-- 列表工具栏 -->
		<div class="lui_list_operation">
			<table width="100%">
				<tr>
					<td style='width: 45px;'>${ lfn:message('list.orderType') }：</td>
					<td><ui:toolbar layout="sys.ui.toolbar.sort"
							style="float:left">
							<list:sort property="fdId"
								text="${lfn:message('list.sort.fdId') }" group="sort.list"
								value="down"></list:sort>
						</ui:toolbar>
					</td>
					<td align="right"><ui:toolbar count="3">
							
							<!-- 产品可以创建删除项目信息 -->
							<c:choose>
							   <c:when test="${param.execModel=='product'}">
							        <ui:button text="${lfn:message('button.add')}" onclick="addDoc()" order="2"></ui:button>
								    <ui:button text="${lfn:message('button.delete')}" onclick="delDoc()" order="4"></ui:button>
							   </c:when>
							</c:choose>
							
							
							<!-- 销售领到可以创建项目,预设比例 -->
							<c:choose>
							   <c:when test="${param.execModel=='sale'}">
							        <ui:button text="${lfn:message('chenyee-quotecenter:module.chenyee.quotecenter.percent.preset')}" onclick="percentPreset()" order="4"></ui:button>
							   </c:when>
							</c:choose>
							
						</ui:toolbar>
					</td>
				</tr>
			</table>
			<input id="execModel" style="display: none;" value="${param.execModel}">
		</div>

		<ui:fixed elem=".lui_list_operation"></ui:fixed>

        <!-- 产品 -->
       
       <c:choose>
            <c:when test="${param.execModel=='product'}">
                  <list:listview id="listview">
					<ui:source type="AjaxJson">
							{url:'/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?method=data&categoryId=${param.categoryId}'}
					</ui:source>
					<!-- 列表视图 -->
					<list:colTable isDefault="false"
						rowHref="/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?method=view&fdId=!{fdId}&execModel=product"
						name="columntable">
						<list:col-checkbox></list:col-checkbox>
						<list:col-serial></list:col-serial>
		
						<list:col-auto
							props="fdProjectName;fdBom.fdBomPrice;fdBom.fdBomPriceUpdateTime;fdPurchase.docCreator.fdName;fdPurchase.fdUpdateTime;docCreator.fdName;fdUpdateTime;"></list:col-auto>
					</list:colTable>
				  </list:listview>
            </c:when>
            
            <c:when test="${param.execModel=='hardware'}">
                 <list:listview id="listview">
					<ui:source type="AjaxJson">
							{url:'/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?method=data&categoryId=${param.categoryId}'}
					</ui:source>
					<!-- 列表视图 -->
					<list:colTable isDefault="false"
						rowHref="/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?method=view&fdId=!{fdId}&execModel=hardware"
						name="columntable">
						<list:col-checkbox></list:col-checkbox>
						<list:col-serial></list:col-serial>
		
						<list:col-auto
							props="fdProjectName;fdHardware.fdHardwarePrice;fdHardware.fdUpdateTime;fdHardware.docCreator.fdName;"></list:col-auto>
					</list:colTable>
			    </list:listview>
            </c:when>
            
            <c:when test="${param.execModel=='purchase'}">
                <list:listview id="listview">
					<ui:source type="AjaxJson">
							{url:'/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?method=data&categoryId=${param.categoryId}'}
					</ui:source>
					<!-- 列表视图 -->
					<list:colTable isDefault="false"
						rowHref="/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?method=view&fdId=!{fdId}&execModel=purchase"
						name="columntable">
						<list:col-checkbox></list:col-checkbox>
						<list:col-serial></list:col-serial>
		
						<list:col-auto
							props="fdProjectName;fdBom.fdBomPrice;fdBom.fdBomPriceUpdateTime;fdHardware.fdHardwarePrice;fdHardware.fdUpdateTime;fdHardware.docCreator.fdName;fdPurchase.docCreator.fdName;fdPurchase.fdUpdateTime;"></list:col-auto>
					</list:colTable>
				</list:listview>
            </c:when>
            
            <c:when test="${param.execModel=='sale'}">
                 <list:listview id="listview">
					<ui:source type="AjaxJson">
							{url:'/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?method=data&categoryId=${param.categoryId}'}
					</ui:source>
					<!-- 列表视图 -->
					<list:colTable isDefault="false"
						rowHref="/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?method=view&fdId=!{fdId}&execModel=sale"
						name="columntable">
						<list:col-checkbox></list:col-checkbox>
						<list:col-serial></list:col-serial>
		
						<list:col-auto
							props="fdProjectName;docCreator.fdName;fdUpdateTime;"></list:col-auto>
					</list:colTable>
				</list:listview>
            </c:when>
       </c:choose>
         
		<list:paging></list:paging>
		
		
		<script type="text/javascript">
			seajs.use([ 'lui/jquery', 'lui/util/str', 'lui/dialog',
					'lui/topic', 'lui/toolbar' ], function($, strutil, dialog,
					topic, toolbar) {

				// 监听新建更新等成功后刷新
				topic.subscribe('successReloadPage', function() {
					topic.publish('list.refresh');
				});
			});
			
			/**
			比例预设
			*/
			function percentPreset(){
				Com_OpenWindow("${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_setpercent/chenyeeQcSetpercent.do?method=view&fdId=1604f4b28bd38415fccehf54eaca579b");
			}
			
		 	seajs.use([
				   	   	'lui/jquery', 
				   	   	'lui/util/str', 
				   	   	'lui/dialog',
				   	   	'lui/topic'
				   	   	], function($, strutil, dialog, topic){
		
					LUI.ready(function(){
						setTimeout('initMenuNav()', 300);
						/* let li = $(".lui_list_nav_frame li").eq(0);
						let html = li.html();
						loadModuleInfo(html,"product");
						loadModuleInfo(html,"hardware");
						loadModuleInfo(html,"purchase");
						loadModuleInfo(html,"sale"); */
						
					});
		
					// TODO 左则样式
					window.initMenuNav = function() {
						let execModel = $("#execModel").val();
						//console.log(execModel);
				 		resetMenuNavStyle($("." + execModel + " a"));
				 	};	
				 	
				 	function loadModuleInfo(html,module){
				 		var length = module.length;
				 		if(html.indexOf(module)!=-1){
				 			var href = window.location.href;
							if(href.substring(href.length -length) == module){
								return ;
							}else{
								openQuery(module);
							}
				 		}
				 		
				 	}
			}); 
		 
			
		</script>
		
	</template:replace>
</template:include>
