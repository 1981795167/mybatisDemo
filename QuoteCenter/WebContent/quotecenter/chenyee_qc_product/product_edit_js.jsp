<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/sys/ui/jsp/common.jsp"%>
<script type="text/javascript">
var presetPercent; //预设比例全局
var cusArrTotal = new Array(); //总的客户数组全局
var customerArrayLeft = new Array(); //剩余客户数组全局
var cusOrderIndex ; //客户信息行
var EditCustoArr = new Array(); //编辑 剩余客户数组

var romRamTotal = new Array(); //项目下的总的romRam 全局数组
var proPriceTotal = new Array(); //项目下的总的romRam 对应的productPrice 全局数组
var romRamShow = new Array(); //要展示的romRam




LUI.ready(function(){
	
	//取得所有客户
	$.ajax({
		url:"${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_customer/chenyeeQcCustomer.do?method=getCustomerName",
		type:"post",
		dataType:"json",
		success:function(data){  //data[i][0]:fdId,data[i][1]:customerName
			if(data.length > 0) {
				for(var i = 0; i < data.length; i++) {
					cusArrTotal[i] = data[i][1];
				}
				customerArrayLeft = [].concat(cusArrTotal); //赋值
				
			}
				
		}
	});
	
	cusOrderIndex = -1; //初始化
	
	var productId = $("[name='fdId']").val(); //取得项目id
	//取得项目下的总的romRam
	$.ajax({
		url:"${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_rom_ram/chenyeeQcRomRam.do?method=getRomRam",
		type:"post",
		dataType:"json",
		data:{"productId":productId},
		success:function(data){
			if(data.length > 0) {
				//chenyee_yht modify 增加产品预估价非空判断
				let cur = 0;
				for(var i = 0; i < data.length; i++) {
					//romRamTotal[i] = new Array(2);    //二维数组
					if(data[i].productPrice > 0) {
						console.log(typeof data[i].productPrice);
						romRamTotal[cur] = data[i].romRam;   //rom+ram
						proPriceTotal[cur++] = data[i].productPrice;  //rom+ram对应的产品采购价
					}
					//chenyee_yht modify end 增加产品预估价非空判断
				}
				 romRamShow = [].concat(romRamTotal); //要展示的romRam

			}
			/*  for(let i= 0; i < romRamTotal.length; i++) {
			} */ 
		}
	});
	
	//若产品价变化，加载已变化的最低售价
	/* cusOrderIndex =  document.getElementById(DocList_Info[DocList_Info.length - 1]).rows.length - 3;
    for(let i = 0; i <= cusOrderIndex; i++){
    	var fdProductPrice = 'custOrderForms[' + i + '].fdProductPrice';
    	var ProductPrice = "[name='" + fdProductPrice + "']";  
		var selectProductPrice = $(ProductPrice);
    	calPerPrice(i,selectProductPrice);
    } */
	
});

seajs.use([
 	      'km/imeeting/resource/js/dateUtil',
 	      'lui/jquery',
 	      'lui/dialog',
 	      'lui/topic'
 	        ],function(dateUtil,$,dialog,topic){	
	//验证耳机是否为空
	function saveEarphone(){
		   var check = $("[name='fdDefaultPrice']:checked").val();
		   
			if( "fdLowPriceChecked" == check ){			
				if($("[name='fdEarphoneForm[0].fdLowPrice']").val() == ""){
					dialog.alert("低端耳机价格为空");
					return false; 
				}else{
					var price = $("[name='fdEarphoneForm[0].fdLowPrice']").val();
					$("[name='fdEarphoneForm[0].fdDefaultPrice']").val( price );
				}
				
			}
			if( "fdMidPriceChecked" == check ){			
				if($("[name='fdEarphoneForm[0].fdMidPrice']").val() == ""){
					dialog.alert("中端耳机价格为空");
					return false; 
				}else{
					var price = $("[name='fdEarphoneForm[0].fdMidPrice']").val();
					$("[name='fdEarphoneForm[0].fdDefaultPrice']").val( price );
				}
			}
			if( "fdHighPriceChecked" == check ){			
				if($("[name='fdEarphoneForm[0].fdHighPrice']").val() == ""){
					dialog.alert("高端耳机价格为空");
					return false; 
				}else{
					var price = $("[name='fdEarphoneForm[0].fdHighPrice']").val();
					$("[name='fdEarphoneForm[0].fdDefaultPrice']").val( price );
				}
			}			
			
	   };
	   
	   //预设比例赋值
	   function savePercent(){		   
		   var index = $("[name='romRamIndex']").length - 1;
		   for(var i = 0; i <= index; i++){
			   var romRamName = 'romRamForms[' + i + '].fdPresetPercent';
			   var PresetPercentInRom = "[name='" + romRamName + "']"; 
			   
			   var percent = $(PresetPercentInRom).val();
			   if(presetPercent == null || presetPercent == ""){
				   presetPercent = 10; //如果数据库为空，则默认预设值设为10
				   /* 
				   dialog.alert("预设比例为空！");
				   return false; */
			   }else{
				   if( percent == null || percent == ""){
					   $(PresetPercentInRom).val( presetPercent );
				   }
			   }
			   
		   }
		   
	   };
	   
	    //拼接客户信息
		function setCustomerName(customerArray,index) {
	    	var fdCustomerName = 'custOrderForms[' + index + '].fdCustomerName';
	    	var CustomerName = "[name='" + fdCustomerName + "']";  //custOrderForms[${vstatus.index}].fdCustomerName
			var selectCustomer = $(CustomerName); 
			if(customerArray.length > 0) {
				for(var i = 0; i < customerArray.length; i++) {
					let option = '<option  value="'+ customerArray[i] +'">'+customerArray[i]+'</option>';
					selectCustomer.append(option);
				}
			}
		};
		
		//拼接romRam信息
		function setRomRam(romRamArray,index) {
	    	var fdRomRam = 'custOrderForms[' + index + '].fdRomRam';
	    	var RomRam = "[name='" + fdRomRam + "']";  //custOrderForms[${vstatus.index}].fdCustomerName
			var selectRomRam = $(RomRam); 
			if(romRamArray.length > 0) {
				for(var i = 0; i < romRamArray.length; i++) {
					let option = '<option  value="'+ romRamArray[i] +'">'+romRamArray[i]+'</option>';
					selectRomRam.append(option);
				}
			}
		};


		//已添加客户订单的动态计算最低售价和预设比例
		var cusOrderIndex2;
		for(var num = 0; num < DocList_Info.length; num++){
			if( "TABLE_DocList_CustOrder" == DocList_Info[num] ){
				//console.log("TABLE_DocList_CustOrder");
				cusOrderIndex2 =  document.getElementById(DocList_Info[num]).rows.length - 3;
				//console.log("cusOrderIndex2: " + cusOrderIndex2);
				break;
			}					
		}
		for(var num = 0; num < cusOrderIndex2; num++){
			var fdProductPrice = 'custOrderForms[' + num + '].fdProductPrice';
	    	var ProductPrice = "[name='" + fdProductPrice + "']";  
			var selectProductPrice = $(ProductPrice);
			//console.log("selectProductPrice: " + selectProductPrice);
			calPerPrice(num,selectProductPrice);
		}
		
		
		
		//增加一行客户（CustomerName加载所有，结合CustomerName来筛选romRam）
		 function addCusOrder2(){
			DocList_AddRow('TABLE_DocList_CustOrder');
			//document.getElementById(DocList_Info[k]) : 表示当前页面"TABLE_DocList_CustOrder" 表格！！！！
			for(var k = 0; k < DocList_Info.length; k++){
				if( "TABLE_DocList_CustOrder" == DocList_Info[k] ){
					//console.log("TABLE_DocList_CustOrder");
					cusOrderIndex =  document.getElementById(DocList_Info[k]).rows.length - 3;
					break;
				}					
			}
			//cusOrderIndex =  document.getElementById(DocList_Info[DocList_Info.length - 1]).rows.length - 3;
			//console.log("cusOrderIndex: " + cusOrderIndex);
			setCustomerName(cusArrTotal,cusOrderIndex);
			
			  //客户名称选定后  筛选romRam
				var fdCustomerName = 'custOrderForms[' + cusOrderIndex + '].fdCustomerName';
		    	var CustomerName = "[name='" + fdCustomerName + "']";
		    	var selectCustomer = $(CustomerName);
				selectCustomer.change(function(){
					romRamShow = [].concat(romRamTotal); //要展示的romRam
					var fdRomRam = 'custOrderForms[' + cusOrderIndex + '].fdRomRam';
			    	var RomRam = "[name='" + fdRomRam + "']";  
					var selectRomRam = $(RomRam);
					selectRomRam.empty();
					selectRomRam.append("<option value=''>==请选择==</option>");
					
					

					if($(this).val() != "" && $(this).val() != null){
						//遍历已加载的客户名字
						for(var index = 0; index <= cusOrderIndex - 1; index++){
							var fdCustomerName2 = 'custOrderForms[' + index + '].fdCustomerName';
					    	var CustomerName2 = "[name='" + fdCustomerName2 + "']";
					    	var selectCustomer2 = $(CustomerName2);
					    	if($(this).val() == selectCustomer2.val()){
					    		//当前选择的客户名字 == 已加载的客户名字
					    		var fdRomRam2 = 'custOrderForms[' + index + '].fdRomRam';
						    	var RomRam2 = "[name='" + fdRomRam2 + "']";  //custOrderForms[${vstatus.index}].fdCustomerName
								var selectRomRam2 = $(RomRam2);
						    	let removeNum = -1;
								if(selectRomRam2.val() != "" && selectRomRam2.val() != null){									
									//get要移除元素下标
									for( var i = 0; i < romRamShow.length; i++ ){ 
										if( romRamShow[i] == selectRomRam2.val() ){
											removeNum = i;
											break;
										}								
									}
									if(removeNum > -1 ){
										//移除选中元素
										for(var i = removeNum; i < romRamShow.length - 1; i++){  
											romRamShow[i] = romRamShow[i + 1];
										}
										romRamShow = romRamShow.slice(0,romRamShow.length - 1); //最后一个不要
									}
									
								}
						    	
					    	}
						}
						setRomRam(romRamShow,cusOrderIndex);
					
						
						//选中romRam后 带出productPrice
						selectRomRam.change(function(){
							if($(this).val() != "" && $(this).val() != null){
								let equalIndex = -1;
								for(var i = 0; i < romRamTotal.length; i++){
									if($(this).val() == romRamTotal[i]){
										equalIndex = i;
										break;
									}
								}
								if(equalIndex > -1){
									//console.log("selectProductPrice:" + cusOrderIndex);
									var fdProductPrice = 'custOrderForms[' + cusOrderIndex + '].fdProductPrice';
							    	var ProductPrice = "[name='" + fdProductPrice + "']";  
									var selectProductPrice = $(ProductPrice);
									selectProductPrice.val(proPriceTotal[equalIndex]);
								}
								
							//选中romRam后 ，输入BottomPrice，计算出定制Percent
								calPerPrice(cusOrderIndex,selectProductPrice);											
							
							}
						});
					
					}					
					
				});
			
		}; 
		
		//动态计算 最低售价和 定制比例
		function calPerPrice(cusOrderIndex,selectProductPrice){
			var fdBottomPrice = 'custOrderForms[' + cusOrderIndex + '].fdBottomPrice';
	    	var BottomPrice = "[name='" + fdBottomPrice + "']";  
			var textBottomPrice = $(BottomPrice);
			var fdPercent = 'custOrderForms[' + cusOrderIndex + '].fdPercent';
	    	var Percent = "[name='" + fdPercent + "']";  
			var textPercent = $(Percent);
			
			//bottomPrice change事件，计算出定制Percent
			textBottomPrice.change(function(){
				if($(this).val() != "" && $(this).val() != null){
					//console.log("Number($(this).val()): " + Number($(this).val()));
					if(isNaN(Number($(this).val())) ){
						//console.log("进入NaN");
						dialog.alert("请输入正确的最低售价格式");
					}else{
						let Percent2 = (( Number($(this).val()) / selectProductPrice.val() - 1) * 100).toFixed(3);
						textPercent.val(Percent2);
					}
				}
			});
			
			//Percent change事件，计算出bottomPrice
			textPercent.change(function(){
				if($(this).val() != "" && $(this).val() != null){
					//console.log("Number($(this).val()): " + Number($(this).val()));
					if(isNaN(Number($(this).val())) ){
						//console.log("进入NaN");
						dialog.alert("请输入正确的定制比例");
					}else{
						let BottomPrice2 =  (selectProductPrice.val() * (1 + Number($(this).val()) / 100)).toFixed(3);
						textBottomPrice.val(BottomPrice2);
					}
				}
			});
			
		};
		
		//增加一行客户（筛选CustomerName）
		function addCusOrder(){
			DocList_AddRow('TABLE_DocList_CustOrder');
			//编辑时  客户数组移除已保存的客户名称
			if($("[name='method_GET']").val() == 'edit'){
				EditCustoArr = [].concat(cusArrTotal);
				//已保存的行数 - 1 = 下标
				var alreadySaveIndex = $("[name='viewItemNum']").length + ($("[name='editItemNum']").length - 1) - 1;
				if(cusOrderIndex < alreadySaveIndex){
					cusOrderIndex = alreadySaveIndex;
				}
				cusOrderIndex ++;
				//let removeArr = new Array();
				let removeNum = 0;
				//循环去除已加载客户数据
				for(var index = 0; index <= cusOrderIndex - 1; index++){
					var fdCustomerName = 'custOrderForms[' + index + '].fdCustomerName';
			    	var CustomerName = "[name='" + fdCustomerName + "']";
			    	var selectCustomer = $(CustomerName);
			    	
			    	
							if(selectCustomer.val() != "" && selectCustomer.val() != null){
								//get要移除元素下标
								for( var i = 0; i < EditCustoArr.length; i++ ){ 
									if( EditCustoArr[i] == selectCustomer.val() ){
										removeNum = i;
										break;
									}								
								}
								//移除选中元素
								for(var i = removeNum; i < EditCustoArr.length - 1; i++){  
									EditCustoArr[i] = EditCustoArr[i + 1];
								}
								EditCustoArr = EditCustoArr.slice(0,EditCustoArr.length - 1); //最后一个不要
							}						
													
			    	
				}   	
			    	
				//拼接客户信息
				setCustomerName(EditCustoArr,cusOrderIndex);	
			}
			
		    //新建时  客户数组移除选中客户名称
			if($("[name='method_GET']").val() == 'add'){
				cusOrderIndex ++;
				for(var index = cusOrderIndex; index >= 0; index--){
						var fdCustomerName = 'custOrderForms[' + index + '].fdCustomerName';
				    	var CustomerName = "[name='" + fdCustomerName + "']";
				    	var selectCustomer = $(CustomerName);
						selectCustomer.change(function(){
							let removeNum;
							if($(this).val() != "" && $(this).val() != null){
								//get要移除元素下标
								for( var i = 0; i < customerArrayLeft.length; i++ ){ 
									if( customerArrayLeft[i] == $(this).val() ){
										removeNum = i;
										break;
									}								
								}
								//移除选中元素
								for(var i = removeNum; i < customerArrayLeft.length - 1; i++){  
									customerArrayLeft[i] = customerArrayLeft[i + 1];
								}
								customerArrayLeft = customerArrayLeft.slice(0,customerArrayLeft.length - 1); //最后一个不要
							}						
													
						});
				}
				//拼接客户信息
				setCustomerName(customerArrayLeft,cusOrderIndex);
			}		
			
		};
		
		
		
		
		//移除一行客户
		function delRow(index){			
			
			var fdCustomerName = 'custOrderForms[' + index + '].fdCustomerName';
	    	var CustomerName = "[name='" + fdCustomerName + "']";
	    	var selectCustomer = $(CustomerName);
			    
	    		//回滚删除客户
				if(selectCustomer.val() != "" && selectCustomer.val() != null){
					customerArrayLeft[customerArrayLeft.length] = selectCustomer.val();
				}
	    				
			
			DocList_DeleteRow();
			cusOrderIndex --;
		};
		
		
	   
	function saveAll(){		
		if(false != saveEarphone()){
			if(false != savePercent()){
				Com_Submit(document.chenyeeQcProductForm, 'save');
			}
		}
		
	};
	function updateAll(){
		if(false != saveEarphone()){
			if(false != savePercent()){
				Com_Submit(document.chenyeeQcProductForm, 'update');
			}
			
		}
		
	};
	function saveAdd(){
		if(false != saveEarphone()){
			if(false != savePercent()){
				Com_Submit(document.chenyeeQcProductForm, 'saveadd');
			}
			
		}
	};
	
	window.saveAll = saveAll;
	window.updateAll = updateAll;
	window.saveAdd = saveAdd;
	window.addCusOrder = addCusOrder;
	window.addCusOrder2 = addCusOrder2;
	window.delRow = delRow;
	window.calPerPrice = calPerPrice;
	
});         
	
LUI.ready(function(){
						
		
		//取得预设比例
		$.ajax({
			   url:"${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_setpercent/chenyeeQcSetpercent.do?method=loadPresetPercent",
			   type:"post",
			   dataType:"json",
			   success:function(data){
				       if(data!=null&data.length>0){
				    	   presetPercent = data[0].percent;
				       }else{
				    	   presetPercent = 10;//如果数据库为空，则默认预设值设为10
				       }
			   }		      
		   });
		
		
		
	});
					


</script>
