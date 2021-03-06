<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<template:include ref="mobile.view" compatibleMode="true">
	<template:replace name="title">
		<c:out value="${ lfn:message('chenyee-quotecenter:module.chenyee.quotecenter') }"/>
	</template:replace>
	<template:replace name="content">
		<div data-dojo-type="mui/view/DocScrollableView" id="chenyeeQcCustomerForm">
			<div class="muiDocFrame">
				<div class="muiDocSubject">
				</div>
				<div class="muiDocInfo">
					<span> <c:out value="${chenyeeQcCustomerForm.docCreateTime  }" />
					</span>
				</div>
			</div>
			<c:if test="${chenyeeQcCustomerForm.docStatus >= '30' }">
				<ul data-dojo-type="mui/tabbar/TabBar" fixed="bottom" >
				  <li data-dojo-type="mui/back/BackButton"></li>
				   <li data-dojo-type="mui/tabbar/TabBarButtonGroup" data-dojo-props="icon1:'mui mui-more'">
				    	<div data-dojo-type="mui/back/HomeButton"></div>
				    </li>
				</ul>
			</c:if>
			<c:if test="${chenyeeQcCustomerForm.docStatus < '30' }">
				<ul data-dojo-type="mui/tabbar/TabBar" fixed="bottom" >
				  <li data-dojo-type="mui/back/BackButton"></li>
				  <li data-dojo-type="mui/tabbar/TabBarButtonGroup" data-dojo-props="icon1:'mui mui-more'">
				    	<div data-dojo-type="mui/back/HomeButton"></div>
				  </li>
				</ul>
			</c:if>
		</div>
	</template:replace>
</template:include>
