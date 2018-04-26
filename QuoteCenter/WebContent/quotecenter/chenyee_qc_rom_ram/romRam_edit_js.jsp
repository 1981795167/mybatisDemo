<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
var romRamTotalArray = ['8+1','16+1','16+2','16+3','32+3','32+4','64+3','64+4','128+4'];
var romRamIndex;
var romRamShowArray = new Array();
var romViewIndex;

//拼接romRam表格的信息
function setRomRamShow(romRamArray,index) {
	var fdRomRam = 'romRamForms[' + index + '].fdRomRam';
	var RomRam = "[name='" + fdRomRam + "']";  
	var selectRomRam = $(RomRam); 
	if(romRamArray.length > 0) {
		for(var i = 0; i < romRamArray.length; i++) {
			let option = '<option  value="'+ romRamArray[i] +'">'+romRamArray[i]+'</option>';
			selectRomRam.append(option);
		}
	}
};

//动态计算采购预估价
function calPurchasePrice(index){
	
	var fdBomPrice = 'romRamForms[' + index + '].fdBomPrice';
    var BomPrice = $("[name='" + fdBomPrice + "']");
	var totalPrice = Number(BomPrice.val()) + Number($("[name='fdPurchaseForm[0].fdManufacturePrice']").val())
	+ Number($("[name='fdPurchaseForm[0].fdSoftwarePatentPrice']").val())
	+ Number($("[name='fdPurchaseForm[0].fdQualcommPatentPrice']").val())
	+ Number($("[name='fdPurchaseForm[0].fdLogisticsPrice']").val())
	+ Number($("[name='fdPurchaseForm[0].fdFinancialPrice']").val())
	+ Number($("[name='fdPurchaseForm[0].fdStandbyPrice']").val())
	+ Number($("[name='fdPurchaseForm[0].fdHolster']").val())
	+ Number($("[name='fdPurchaseForm[0].fdMembrane']").val())
	+ Number($("[name='fdEarphoneForm[0].fdDefaultPrice']").val());
	
	//console.log("fdDefaultPrice: " + $("[name='fdEarphoneForm[0].fdDefaultPrice']").val());
	var fdPurchasePrice = 'romRamForms[' + index + '].fdPurchasePrice';
	var PurchasePrice = $("[name='" + fdPurchasePrice + "']");  
	PurchasePrice.val(totalPrice);
}

//显示采购预估价
function showPurchasePrice(){
	for(var k = 0; k < DocList_Info.length; k++){
		if( "TABLE_DocList" == DocList_Info[k] ){
			//console.log("TABLE_DocList");
			var Indexrom =  document.getElementById(DocList_Info[k]).rows.length - 3;
			break;
		}					
	}
	// $("[name='romViewIndex']").length
	for(var i = Indexrom; i >=0; i--){
		calPurchasePrice(i);
	}
}

//增加一行romRam
function addRomRam(){  //romRamForms[${vstatus.index}].fdPurchasePrice
	DocList_AddRow('TABLE_DocList');
	//document.getElementById(DocList_Info[DocList_Info.length - 1]) : 表示当前页面的  TABLE_DocList 表格！！！！
	for(var k = 0; k < DocList_Info.length; k++){
		if( "TABLE_DocList" == DocList_Info[k] ){
			//console.log("TABLE_DocList");
			romRamIndex =  document.getElementById(DocList_Info[k]).rows.length - 3;
			break;
		}					
	}
	//romRamIndex =  document.getElementById(DocList_Info[DocList_Info.length - 2]).rows.length - 3;
	romRamShowArray = [].concat(romRamTotalArray);
	
	var fdRomRam = 'romRamForms[' + romRamIndex + '].fdRomRam';
	var RomRam = "[name='" + fdRomRam + "']";  
	var selectRomRam = $(RomRam);
	
	for(var i = romRamIndex - 1; i >= 0; i--){
		var fdRomRam2 = 'romRamForms[' + i + '].fdRomRam';
		var RomRam2 = "[name='" + fdRomRam2 + "']";  
		var selectRomRam2 = $(RomRam2);
		//console.log("selectRomRam2.val: " + selectRomRam2.val());
		let removeNum = -1;
		if(selectRomRam2.val() != "" && selectRomRam2.val() != null){									
			//get要移除元素下标
			for( var j = 0; j < romRamShowArray.length; j++ ){ 
				if( romRamShowArray[j] == selectRomRam2.val() ){
					removeNum = j;
					break;
				}								
			}
			if(removeNum > -1 ){
				//移除选中元素
				for(var j = removeNum; j < romRamShowArray.length - 1; j++){  
					romRamShowArray[j] = romRamShowArray[j + 1];
				}
				romRamShowArray = romRamShowArray.slice(0,romRamShowArray.length - 1); //最后一个不要
			}
			
		}
	}
	
	setRomRamShow(romRamShowArray,romRamIndex);
	
    //一增加也计算采购预估价一遍
	calPurchasePrice(romRamIndex);
	
	//bom 预估价的change
	 var fdBomPrice2 = 'romRamForms[' + romRamIndex + '].fdBomPrice';
	var BomPrice2 = $("[name='" + fdBomPrice2 + "']");
	//console.log("BomPrice2" + BomPrice2);
	BomPrice2.change(function(){
	//	console.log("bom 预估价的change");
			showPurchasePrice();

	}); 

};

$("[name='fdPurchaseForm[0].fdManufacturePrice']").change(function(){
		showPurchasePrice();

});
$("[name='fdPurchaseForm[0].fdSoftwarePatentPrice']").change(function(){
		showPurchasePrice();

});
$("[name='fdPurchaseForm[0].fdQualcommPatentPrice']").change(function(){
		showPurchasePrice();

});
$("[name='fdPurchaseForm[0].fdLogisticsPrice']").change(function(){
		showPurchasePrice();

});
$("[name='fdPurchaseForm[0].fdFinancialPrice']").change(function(){
		showPurchasePrice();

});
$("[name='fdPurchaseForm[0].fdStandbyPrice']").change(function(){
		showPurchasePrice();

});
$("[name='fdPurchaseForm[0].fdHolster']").change(function(){
		showPurchasePrice();

});
$("[name='fdPurchaseForm[0].fdMembrane']").change(function(){
		showPurchasePrice();

});
LUI.ready(function(){
	
	for(var k = 0; k < DocList_Info.length; k++){
		if( "TABLE_DocList" == DocList_Info[k] ){
			//console.log("TABLE_DocList");
			romViewIndex =  document.getElementById(DocList_Info[k]).rows.length - 4;
			break;
		}					
	}
	//console.log(romViewIndex);
	for(var i = 0; i <= romViewIndex; i++){
		//console.log("i: " + i);
		var fdBomPrice2 = 'romRamForms[' + i + '].fdBomPrice';
	    var BomPrice2 = $("[name='" + fdBomPrice2 + "']");
	    BomPrice2.change(function(){
	    	showPurchasePrice();

		});
	}
	
	/**
	 * 将页面上显示为0.0的值置为空 
	 */
	 for(var i = 0; i <= romViewIndex; i++){
		    var fdProductPrice = 'romRamForms[' + i + '].fdProductPrice';
		    var ProductPrice = $("[name='" + fdProductPrice + "']");
		    var fdPresetBottomPrice = 'romRamForms[' + i + '].fdPresetBottomPrice';
		    var PresetBottomPrice = $("[name='" + fdPresetBottomPrice + "']");

			if(ProductPrice.val()==0.0){
				ProductPrice.val("");
				PresetBottomPrice.val("");
			}
			
	 }
	
});

 

//指定默认耳机价格事件
$("[name='fdDefaultPrice']").change(function(){
	var check = $(this).val();
	//console.log("check: " + check);
	if(check == "fdLowPriceChecked"){
			$("[name='fdEarphoneForm[0].fdDefaultPrice']").val(  $("[name='fdEarphoneForm[0].fdLowPrice']").val() );
			$("[name='fdDefaultPrice2']").data("check","fdLowPriceChecked");
	} else if(check == "fdMidPriceChecked"){
			$("[name='fdEarphoneForm[0].fdDefaultPrice']").val(  $("[name='fdEarphoneForm[0].fdMidPrice']").val() );
			$("[name='fdDefaultPrice2']").data("check","fdMidPriceChecked");
	}else{
			$("[name='fdEarphoneForm[0].fdDefaultPrice']").val(  $("[name='fdEarphoneForm[0].fdHighPrice']").val() );
			$("[name='fdDefaultPrice2']").data("check","fdHighPriceChecked");
	}
	showPurchasePrice();
	
});	
//底价改变，若当前价为默认价，则动态变化采购预估价
$("[name='fdEarphoneForm[0].fdLowPrice']").change(function(){
	//console.log("Low:" + $("[name='fdDefaultPrice2']").data("check"));
		if($("[name='fdDefaultPrice2']").data("check") == "fdLowPriceChecked"){	
			$("[name='fdEarphoneForm[0].fdDefaultPrice']").val(  $(this).val() );
			showPurchasePrice();
		} 
});
		
//中价改变，若当前价为默认价，则动态变化采购预估价
$("[name='fdEarphoneForm[0].fdMidPrice']").change(function(){
	//console.log("Mid:" + $("[name='fdDefaultPrice2']").data("check"));
	if($("[name='fdDefaultPrice2']").data("check") == "fdMidPriceChecked"){
			$("[name='fdEarphoneForm[0].fdDefaultPrice']").val(  $(this).val() );
			showPurchasePrice();
	}
});
//高价改变，若当前价为默认价，则动态变化采购预估价
$("[name='fdEarphoneForm[0].fdHighPrice']").change(function(){
	//console.log("High:" + $("[name='fdDefaultPrice2']").data("check"));
	if($("[name='fdDefaultPrice2']").data("check") == "fdHighPriceChecked"){
			$("[name='fdEarphoneForm[0].fdDefaultPrice']").val(  $(this).val() );
			showPurchasePrice();
	}
});

	

	  

</script>