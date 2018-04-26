<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

  LUI.ready(function(){
	var productId = $("[name='fdBomForm.fdProductId']").val(); //取得项目id
	//console.log("productId: " + productId);
	
	$.ajax({
		url:"${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_bom/chenyeeQcBom.do?method=loadBomCode",
		data:{"productId":productId},
		dataType:"json",
		type:"post",
		success:function(data){
			//console.log(data.length);
			if(data != null && data.length > 0){
				for(var i = 0; i < data.length; i++){
					//console.log(data[i]);
					let options = "<option value='" + data[i] +"'>" + data[i] + "</option>"; 
					$("[name='fdBomCode']").append(options);
				}
			}
		}
		
	});
	
	//选中bom编码
	$("[name='fdBomCode']").change(function(){
		if($(this).val() != "" && $(this).val() != null){
			//去重的字段
			$.ajax({
				url:"${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_bom/chenyeeQcBom.do?method=loadBomInfo",
				data:{"productId":productId,"bomCode":$(this).val()},
				dataType:"json",
				type:"post",
				success:function(data){
					//console.log(data[0].length);
					if(data != null && data.length > 0){
							$("[name='fdBomName']").val(data[0][0]);
							$("[name='fdBomPrice']").val(data[0][1]);
							$("[name='fdFactory']").val(data[0][2]);
							$("[name='fdApplication']").val(data[0][3]);
							$("[name='fdVersionDescription']").val(data[0][4]);
							$("[name='fdVersion']").val(data[0][5]);
					}
				}
			});
			
			//列表形式的字段
			$.ajax({
				url:"${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_bom/chenyeeQcBom.do?method=loadBomListInfo",
				data:{"productId":productId,"bomCode":$(this).val()},
				dataType:"json",
				type:"post",
				success:function(data){
					//console.log(data[0][0]);
					if(data != null && data.length > 0){ //ES6反引号
					    var tableBom = "<table class='tb_normal' width=100% id='TABLE_DocList_BomList' align='center'>"
		                    +"<tr align='center'>"
		                    +"<td class='td_normal_title' style='width: 6%'>  <bean:message key='page.serial'/>  </td>"
		                    +"<td class='td_normal_title' style='width: 18%'>  <bean:message bundle='chenyee-quotecenter' key='chenyeeQcBom.fdMaterielCode'/>  </td>"
		                    +"<td class='td_normal_title' style='width: 30%'>  <bean:message bundle='chenyee-quotecenter' key='chenyeeQcBom.fdMaterialDescription'/>  </td>"
		                    +"<td class='td_normal_title' style='width: 30%'>  <bean:message bundle='chenyee-quotecenter' key='chenyeeQcBom.fdDimension'/>  </td>"
		                    +"<td class='td_normal_title' style='width: 16%'>  <bean:message bundle='chenyee-quotecenter' key='chenyeeQcBom.fdMaterielPrice'/>  </td>"
		                    +"</tr>";
						for(var i = 0; i < data.length; i++){ 
							tableBom = tableBom + "<tr align='center'>"
							+"<td  style='width: 6%'>" + (i+1) + "</td>"
							+"<td  style='width: 18%'>" + data[i][0] + "</td>"
							+"<td  style='width: 30%'>" + data[i][1] + "</td>"
							+"<td  style='width: 30%'>" + data[i][2] + "</td>"
							+"<td  style='width: 16%'>" + data[i][3] + "</td>"
							+"</tr>";
						}
		                    tableBom = tableBom +"</table>";
						$("#showBom").html(tableBom);
					}
				}
			});
		}else{
			$("[name='fdBomName']").val("");
			$("[name='fdBomPrice']").val("");
			$("[name='fdFactory']").val("");
			$("[name='fdApplication']").val("");
			$("[name='fdVersionDescription']").val("");
			$("[name='fdVersion']").val("");
		}
	});
	
}); 

</script>