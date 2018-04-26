<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>


<td class="td_normal_title" width=15%>
	<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.fdRomRam" />
</td>
<td width="35%">
	<xform:select property="fdRomRam" style="width:85%" subject="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.fdRomRam') }" showPleaseSelect="true" required="true">
		<xform:simpleDataSource value="8+1">8+1</xform:simpleDataSource>
   		<xform:simpleDataSource value="16+1">16+1</xform:simpleDataSource>
   		<xform:simpleDataSource value="16+2">16+2</xform:simpleDataSource>
   		<xform:simpleDataSource value="16+3">16+3</xform:simpleDataSource>
   		<xform:simpleDataSource value="32+3">32+3</xform:simpleDataSource>
   		<xform:simpleDataSource value="32+4">32+4</xform:simpleDataSource>
   		<xform:simpleDataSource value="64+3">64+3</xform:simpleDataSource>
   		<xform:simpleDataSource value="64+4">64+4</xform:simpleDataSource>
   		<xform:simpleDataSource value="128+4">128+4</xform:simpleDataSource>
		
	</xform:select>
</td>
