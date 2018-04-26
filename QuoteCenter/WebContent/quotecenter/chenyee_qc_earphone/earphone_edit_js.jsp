<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
seajs.use([
 	      'km/imeeting/resource/js/dateUtil',
 	      'lui/jquery',
 	      'lui/dialog',
 	      'lui/topic'
 	        ],function(dateUtil,$,dialog,topic){	
	function saveProduct(){
		   
		   var check = $("[name='fdDefaultPrice']:checked").val();
		   
			if( "fdLowPriceChecked" == check ){			
				if($("[name='fdEarphoneForm[0].fdLowPrice']").val() == ""){
					dialog.alert("低端耳机价格为空");
					return false; 
				}else{
					var price = $("[name='fdEarphoneForm[0].fdLowPrice']").val();
					$("[name='fdEarphoneForm[0].fdDefaultPrice']").val( price );
					//alert( $("[name='fdEarphoneForm[0].fdDefaultPrice']").val());
				}
				
			}
			if( "fdMidPriceChecked" == check ){			
				if($("[name='fdEarphoneForm[0].fdMidPrice']").val() == ""){
					dialog.alert("中端耳机价格为空");
					return false; 
				}else{
					var price = $("[name='fdEarphoneForm[0].fdMidPrice']").val();
					$("[name='fdEarphoneForm[0].fdDefaultPrice']").val( price );
					//alert( $("[name='fdEarphoneForm[0].fdDefaultPrice']").val());
				}
			}
			if( "fdHighPriceChecked" == check ){			
				if($("[name='fdEarphoneForm[0].fdHighPrice']").val() == ""){
					dialog.alert("高端耳机价格为空");
					return false; 
				}else{
					var price = $("[name='fdEarphoneForm[0].fdHighPrice']").val();
					$("[name='fdEarphoneForm[0].fdDefaultPrice']").val( price );
					//alert( $("[name='fdEarphoneForm[0].fdDefaultPrice']").val());
				}
			}			
			
	   };
	function saveAll(){
		if(false != saveProduct()){
			Com_Submit(document.chenyeeQcProductForm, 'save');
		}
		
	};
	function updateAll(){
		if(false != saveProduct()){
			Com_Submit(document.chenyeeQcProductForm, 'update');
		}
		
	};
	function saveAdd(){
		if(false != saveProduct()){
			Com_Submit(document.chenyeeQcProductForm, 'saveadd')
		}
	};
	
	window.saveAll = saveAll;
	window.updateAll = updateAll;
	window.saveAdd = saveAdd;
	
});         
	
	//耳机edit页面 加载进已指定耳机价格的单选框
	$(function(){
		var defPrice = $("[name='fdEarphoneForm[0].fdDefaultPrice']").val();
		var lowPrice = $("[name='fdEarphoneForm[0].fdLowPrice']").val();
		var midPrice = $("[name='fdEarphoneForm[0].fdMidPrice']").val();
		var higPrice = $("[name='fdEarphoneForm[0].fdHighPrice']").val();
		if(defPrice != null || defPrice != ""){
			var defList = $("[name='fdDefaultPrice']");
			if(defPrice == lowPrice){
				defList[0].checked = true;
				//初始化耳机选中值
				$("[name='fdDefaultPrice2']").data("check","fdLowPriceChecked");
			}else if(defPrice == midPrice){
				defList[1].checked = true;
				$("[name='fdDefaultPrice2']").data("check","fdMidPriceChecked");
			}else{
				defList[2].checked = true;
				$("[name='fdDefaultPrice2']").data("check","fdHighPriceChecked");
			}
		}
	});
					

</script>