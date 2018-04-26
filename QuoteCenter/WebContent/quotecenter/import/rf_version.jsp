<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>


<td class="td_normal_title" width=15%>
	<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.rfVersion" />
</td>
<td width="35%">
	<xform:select className="otherInfo" property="rfVersion" style="width:85%" subject="${ lfn:message('chenyee-quotecenter:chenyeeQcApply.rfVersion') }" showPleaseSelect="true">
		<xform:simpleDataSource value="southAsian">
			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.rfVersion.southAsian"/>
		</xform:simpleDataSource>
   		<xform:simpleDataSource value="europe">
   			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.rfVersion.europe"/>
   		</xform:simpleDataSource>
   		<xform:simpleDataSource value="american">
   			<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.rfVersion.american"/>
   		</xform:simpleDataSource>
	</xform:select>
	</br>
	<span class="infoNotNull" style="display: none;color: red;">
		<bean:message bundle="chenyee-quotecenter" key="chenyeeQcApply.otherPrice.infoNotNull"/>
	</span>
</td>
