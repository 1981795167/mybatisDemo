<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<template:include ref="config.tree">
<template:replace name="content">
function generateTree()
{
	LKSTree = new TreeView(
		"LKSTree",
		"<bean:message key="module.chenyee.quotecenter" bundle="chenyee-quotecenter"/>",
		document.getElementById("treeDiv")
	);
	var n1, n2, n3, n4, n5,defaultNode;
	n1 = LKSTree.treeRoot;


<%-- function generateTree()
{
    window.LKSTree = new TreeView( 
        'LKSTree',
        
        '${ lfn:message("chenyee-quotecenter:module.chenyee.quotecenter") }',//根节点的名称
        document.getElementById('treeDiv')
    );
    var node = LKSTree.treeRoot; 
    
    
    node.isExpanded = true; --%>
    
	
	//默认流程模板
	<kmss:authShow
		roles="ROLE_CHENYEEQUOTECENTER_DEFAULT">
		n1.AppendURLChild(
			"<bean:message key="tree.workflowTemplate" bundle="km-review" />",
			"<c:url value="/sys/workflow/sys_wf_common_template/sysWfCommonTemplate.do?method=list&fdModelName=com.landray.kmss.chenyee.quotecenter.model.ChenyeeQcApply&fdKey=reviewApply" />"
		);
	</kmss:authShow>
	

	LKSTree.EnableRightMenu();
	LKSTree.Show();
	LKSTree.ClickNode(defaultNode);

}
</template:replace>
</template:include>