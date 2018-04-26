<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="edit_function.jsp"%>
<script>

	//提交申请
	function createApply() {
		$("[name=docStatus]").val("20");
		
		Com_Submit(document.chenyeeQcApplyForm, 'save');
	}
	
	// 项目下拉选择框change事件： 根据项目id加载rom_ram、成本价（产品预估价）隐藏、耳机价格、皮套、钢化膜
	$("[name=fdProjectName]").change(function() {
		let productId = $(this).find("option:selected").attr("id"); 
		$("[name=fdCostPrice]").val("");
		$("[name=fdBottomPrice]").val("");
		$("[name=fdBottomPrice]").data("bottomPercent", 0);
		$("[name=purchase]:checkbox").prop("checked", false);
		$("#holsterPrice").html("");
		$("#membranePrice").html("");
		
		$("[name=fdPrice]:radio").prop("checked", false);
		$(".earPrice_span").html("");
		
		$(".otherInfo").val("");
		$(".otherPrice").val("");
		$(".infoNotNull").hide();
		$(".errorMessage").hide();
		//记录上一次附件总价
		$("[name=fdCostPrice]").data("otherPrice", 0);
		
		loadProductInfo(productId);
		loadRomRam(productId);
	});
	
	// rom_ram change事件 ：根据rom_ram： 展示对应成本价
	$("[name=fdRomRam]").change(function() {
		let price = $(this).find("option:selected").data("productPrice"); 
		setCostPrice(price);
		$("[name=fdBottomPrice]").val("");
		getbottomPrice();
		
		let productId = $("[name=fdProjectName]").find("option:selected").attr("id"); 
		loadEarPrice(productId);
		loadPurchase(productId);
	});
	
	// 客户下拉选择框change事件：根据rom+ram、客户名称、项目id:加载客户最低售价, 客户定制比例
	$("[name=fdCustomerName]").change(function() {
		getbottomPrice();
	});
	
	// 清空耳机选择
	$(".reset_a").click(function() {
		let check_old = $("#ear_tr").data("checkVal");
		let fdCostPrice = $("[name=fdCostPrice]").val();
		fdCostPrice = Number(fdCostPrice) - Number(check_old)
		
		$("[name=fdPrice]").prop("checked", false);
		setCostPrice(fdCostPrice);
		$("#ear_tr").data("checkVal", 0);
	});
	
	// 鼠标悬停事件
	$(".reset_a").mouseenter(function() {
		$(this).css("color", "red");
	});
	$(".reset_a").mouseleave(function() {
		$(this).css("color", "blue");
	});
	
	//chenyee yht modify start input获取的值转为数字
	// 焦点从申请报价输入框消失
	$("[name=fdApplicationPrice]").blur(function() {
		let applicationPrice = Number($(this).val());
		if(!isNaN(applicationPrice)) {
			let fdCostPrice = $("[name=fdCostPrice]").val();
			let salesPercent = ((applicationPrice / Number(fdCostPrice) - 1) * 100).toFixed(3); 
			$("[name=fdApplyQuotePercent]").val(salesPercent);
			//setCostPrice(salesPercent); 删除该代码，这里不需要重新设置成本价
			showMessage(salesPercent);
		}else{
			$(".message_div").html("只可以填入数字！").css("color", "red");
		}
	});
	$("[name=fdApplyQuotePercent]").blur(function() {
		let salesPercent = Number($(this).val());
		if(!isNaN(salesPercent)) {
			let fdCostPrice = $("[name=fdCostPrice]").val();
			let fdApplicationPrice = ((salesPercent / 100 + 1) * Number(fdCostPrice)).toFixed(3); 
			$("[name=fdApplicationPrice]").val(fdApplicationPrice);
			showMessage(salesPercent);
		}else{
			$(".message_div").html("只可以填入数字！").css("color", "red");
		}
	});
	//chenyee yht modify end input获取的值转为数字
	//耳机点击事件
	$("[name=fdPrice]:radio").change(function () {
		if(preCondition("ear")) {
			let check_new = $(this).val();
			let check_old = $("#ear_tr").data("checkVal");
			let fdCostPrice = $("[name=fdCostPrice]").val();
			
			fdCostPrice = Number(fdCostPrice) - Number(check_old) + Number(check_new);
			setCostPrice(fdCostPrice);
			$("#ear_tr").data("checkVal", check_new);
		}
	});
	
	//皮套钢化膜选中取消事件
	$("[name=purchase]").click(function() {
		let old_count = $("#purchase_tr").data("purchaseCheck");
		let count = 0;    
	    let fdCostPrice = $("[name=fdCostPrice]").val();
	   
	    $("[name=purchase]:checked").each(function(){  
	    	count +=   Number($(this).val());
	    });
	    fdCostPrice = fdCostPrice - old_count + count;
	    setCostPrice(fdCostPrice);
		$("#purchase_tr").data("purchaseCheck", count);   
	});
	
	//成本价：值改变事件:计算最低售价、清空申请报价和申请比例输入框
	$("[name=fdCostPrice]").change("input propertychange", function () {
		if(preCondition()) {
			let costPrice = $(this).val();
			$("#cost_span").html(costPrice);
			countBottomPrice(costPrice);
			
			$("[name=fdApplicationPrice]").val("");
			$("[name=fdApplyQuotePercent]").val("");
			/* let salesPercent = $("[name=fdApplyQuotePercent]").val();
			console.log(salesPercent);
			if(!isNaN(salesPercent)) {
				let fdApplicationPrice = (costPrice * (1 + salesPercent / 100)).toFixed(3);
				$("[name=fdApplicationPrice]").val(fdApplicationPrice);
			} */
		}
	});
	
	//rf差价、彩盒价格、配件价格、备注总价blur事件
	$(".otherPrice").blur(function() { 
		if(preCondition()) {
			$(".errorMessage").hide();
			$(".infoNotNull").hide();
			let prices = $(".otherPrice");
			let priceInfos = $(".otherInfo");
			let total = 0;
			let addFlag = true;
			for(let i = 0; i < prices.length; i++) {
				let price = Number(prices.eq(i).val());
				
				if(!isNaN(price)) { //是数字，计算结果
					total += price;
					//判断！=0的价格输入框对应的信息框是否有信息输入
					if(price != 0 && priceInfos.eq(i).val() == "") { //！= 0表示有数据输入
						$(".infoNotNull").eq(i).show();
					}
				}else {
					addFlag = false;
					$(".errorMessage").eq(i).show();
				}
			}
			
			//校验通过，将价格加入成本价
			if(addFlag) {
				let lastPrice = $("input[name=fdCostPrice]").data("otherPrice");
				let fdCostPrice = $("input[name=fdCostPrice]").val();
				$("input[name=fdCostPrice]").val(Number(fdCostPrice) - lastPrice + total);
				$("input[name=fdCostPrice]").data("otherPrice", total);
				$("[name=fdCostPrice]").trigger('change');
			}
		}
	});
	
	//配件信息输入框焦点移出事件,隐藏相应提示信息
	$(".otherInfo").blur(function() {
		if(preCondition()) {
			let index = $(".otherInfo").index($(this));
			if($(this).val() != "") {
				$(".infoNotNull").eq(index).hide();
			}else if($(".otherPrice").eq(index).val() != "") {
				$(".infoNotNull").eq(index).show();
			}
		}
	});
	
	
	//============================事件==函数 分割符=====================================================
	
	//加载项目信息	
	function loadProductInfo(productId) {
		$.ajax("${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?method=loadProductInfo", {
			dataType : 'json',
			data : {"productId" : productId},
			type: "get"
		}).done(function (data) {
			setProductInfo(data);
		}).fail(function (xhr, status) {
		    console.log('失败: ' + xhr.status + ', 原因: ' + status);
		});
	}
	
	//设置产品硬件信息
	function setProductInfo(data) {
		$("input[name=fdScreeSize]").val(data.fdScreeSize);
		$("input[name=fdFrontCamera]").val(data.fdFrontCamera);
		$("input[name=fdRearCamera]").val(data.fdRearCamera);
		$("input[name=fdBatteryCapacity]").val(data.fdBatteryCapacity);
		$("input[name=fdHardwarePlatform]").val(data.fdHardwarePlatform);
		$("input[name=fdAndroidVersion]").val(data.fdAndroidVersion);
	}
		
	//计算最低售价
	function countBottomPrice(costPrice) {
		let bottomPercent  = $("[name=fdBottomPrice]").data("bottomPercent");
		let bottomPrice;
		//console.log("bottomPercent :" + bottomPercent);
		if(bottomPercent != 0) { 
			bottomPrice = (Number(costPrice) * (1 + Number(bottomPercent) / 100)).toFixed(3);
			$("[name=fdBottomPrice]").val(bottomPrice);
			$("[name=fdPresetPercent]").val(bottomPercent); //若客户有定制比例更新预设比例
		}else {
			let prePercent = $("[name=fdPresetPercent]").val();
			bottomPrice = (Number(costPrice) * (1 + Number(prePercent) / 100)).toFixed(3);
			$("[name=fdBottomPrice]").val(bottomPrice);
		}
	}
		
	//设置成本价并触发一次change事件
	function setCostPrice (price) {
		 $("[name=fdCostPrice]").val(price);
		 $("#cost_span").html(price);
		 $("[name=fdCostPrice]").trigger('change');
	}
		
	//加载预设比例
	function loadPresetPercent() {
		$.ajax("${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_setpercent/chenyeeQcSetpercent.do?method=loadPresetPercent", {
			dataType : 'json',
			async: true
		}).done(function (data) {
			if(data.length > 0) {
				$("[name=fdPresetPercent]").val(data[0].percent);
			}
		}).fail(function (xhr, status) {
		    console.log('失败: ' + xhr.status + ', 原因: ' + status);
		});
	}
		
	/**
	 * 加载项目信息
	 */
	function loadProduct() {
		$.ajax("${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_product/chenyeeQcProduct.do?method=getProductName", {
			dataType : 'json'
		}).done(function (data) {
			setProduct(data);
		}).fail(function (xhr, status) {
		    console.log('失败: ' + xhr.status + ', 原因: ' + status);
		});
	};
	
	//拼接项目名称
	function setProduct(data) {
		let selectProduct = $("[name=fdProjectName]");
		if(data.length > 0) {
			for(let i=0; i < data.length; i++) {
				let option = '<option id="'+data[i][0]+'" value="'+ data[i][1] +'">'+data[i][1]+'</option>';
				selectProduct.append(option);
			}
		}
	}
	
	/** 加载客户信息 */
	function loadCustomer() {
		$.ajax("${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_customer/chenyeeQcCustomer.do?method=getCustomerName", {
			dataType : 'json'
		}).done(function (data) {
			setCustomer(data);
		}).fail(function (xhr, status) {
		    console.log('失败: ' + xhr.status + ', 原因: ' + status);
		});
	};
	
	//拼接客户信息
	function setCustomer(data) {
		let selectCustomer = $("[name=fdCustomerName]");
		if(data.length > 0) {
			for(let i=0; i < data.length; i++) {
				let option = '<option id="'+data[i][0]+'" value="'+ data[i][1] +'">'+data[i][1]+'</option>';
				selectCustomer.append(option);
			}
		}
	}
	
	// 1.加载rom_ram价目表中数据
	function loadRomRam(productId) {
		$.ajax("${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_rom_ram/chenyeeQcRomRam.do?method=getRomRam", {
			dataType : 'json',
			data : {"productId" : productId},
			type: "get"
		}).done(function (data) {
			setRomram(data);
		}).fail(function (xhr, status) {
		    console.log('失败: ' + xhr.status + ', 原因: ' + status);
		});
	}
	
	//拼接romram
	function setRomram(data) {
		let romRamSelect = $("[name=fdRomRam]");
		romRamSelect.html("<option value=''>==请选择==</option>");
		if(data.length > 0) {
			for(let i=0; i<data.length; i++) {
				let option = "<option id='"+data[i].romId+"' val='"+data[i].romRam+"'>"+data[i].romRam+"</option>";
				$option = $(option);
				$option.data("productPrice", data[i].productPrice);
				romRamSelect.append($option);
			}
		}
	}
	
	
	// 2.加载耳机价格表中数据
	function loadEarPrice(productId) {
		$.ajax("${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_earphone/chenyeeQcEarphone.do?method=getEarPhone", {
			dataType : 'json',
			data : {"productId" : productId},
			type: "get"
		}).done(function (data) {
			setEarPrice(data);
		}).fail(function (xhr, status) {
		    console.log('失败: ' + xhr.status + ', 原因: ' + status);
		});
	}
	
	//拼接耳机价格
	function setEarPrice(data) {
		//let earRadio = $("[name=fdPrice]");
		$("input[name=fdPrice]:radio").show();
		if(data.length > 0) {
			let earData = data[0];
			let defaultPrice = earData.defaultPrice;
			
			setEarPhone(0, earData.lowPrice);
			setEarPhone(1, earData.midPrice);
			setEarPhone(2, earData.highPrice);
			
			if(defaultPrice == earData.lowPrice) {
				$("input[name=fdPrice]:radio").eq(0).prop("checked", true);
			}
			if(defaultPrice == earData.midPrice) {
				$("input[name=fdPrice]:radio").eq(1).prop("checked", true);
			}
			if(defaultPrice == earData.highPrice) {
				$("input[name=fdPrice]:radio").eq(2).prop("checked", true);
			}
			$("#ear_tr").data("checkVal", defaultPrice);
		}else {
			$("#ear_tr").data("checkVal", 0);
		}
	}
	
	//拼接耳机价格
	function setEarPhone(index, earPrice) {
		if(earPrice != null && earPrice != undefined && earPrice != "") {
			if(index === 0) {
				$("#low_ear").html(earPrice);
			}else if(index === 1) {
				$("#mid_ear").html(earPrice);
			}else if(index === 2){
				$("#high_ear").html(earPrice);
			}
			$("input[name=fdPrice]:radio").eq(index).val(earPrice);
		}else {
			/* if(index === 0) {
				$("#low_ear").hide();
			}else if(index === 1) {
				$("#mid_ear").hide();
			}else if(index === 2){
				$("#high_ear").hide();
			} */
			$("input[name=fdPrice]:radio").eq(index).hide();
		}
	}
	
	// 3.加载采购表中皮套钢化膜价格
	function loadPurchase(productId) {
		$.ajax("${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_purchase/chenyeeQcPurchase.do?method=getPurchase", {
			dataType : 'json',
			data : {"productId" : productId},
			type: "get"
		}).done(function (data) {
			setPurchase(data);
		}).fail(function (xhr, status) {
		    console.log('失败: ' + xhr.status + ', 原因: ' + status);
		});
	}
	
	//拼接钢化膜皮套
	function setPurchase(data) {
		$("[name=purchase]").show();
		if(data.length > 0) {
			let purchase = data[0];
			if(purchase.fdHolster != undefined) {
				$("#holsterPrice").html(purchase.fdHolster);
				$("[name=purchase]").eq(0).val(purchase.fdHolster);
				$("[name=fdHolster]").val(purchase.fdHolster);
			}else {
				
				$("[name=purchase]").eq(0).hide();
				//$("[name=purchase]").eq(0).val(0);
				$("[name=fdHolster]").val(0);
				//$("#holsterPrice").html(0);
				//$("[name=purchase]").eq(0).attr("checked", "checked");
				//$("[name=purchase]").eq(0).attr("onclick", "return false");
			}
			if(purchase.fdMembrane != undefined) {
				$("#membranePrice").html(purchase.fdMembrane);
				$("[name=purchase]").eq(1).val(purchase.fdMembrane);
				$("[name=fdMembrane]").val(purchase.fdMembrane);
			}else {
				$("[name=purchase]").eq(1).hide();
				$("[name=fdMembrane]").val(0);
				/* $("[name=purchase]").eq(1).val(0);
				$("#membranePrice").html(0);
				$("[name=purchase]").eq(1).attr("checked", "checked"); */
			}
		}else {
			$("[name=purchase]").hide();
			$("[name=fdHolster]").val(0);
			$("[name=fdMembrane]").val(0);
			/* $("#holsterPrice").html(0);
			$("[name=purchase]").eq(0).val(0);
			$("#membranePrice").html(0);
			$("[name=purchase]").eq(1).val(0);
			$("[name=purchase]").eq(0).attr("checked", "checked");
			$("[name=purchase]").eq(0).attr("onclick", "return false");
			$("[name=purchase]").eq(1).attr("checked", "checked"); */
		}
		//设置配件总价初始值
		$("#purchase_tr").data("purchaseCheck", 0);
	}
	
	/*加载最低售价*/
	function getbottomPrice() {
		if(preCondition()) {
			let romram = $("[name=fdRomRam]").find("option:selected").val();
			let customerName = $("[name=fdCustomerName]").find("option:selected").val();
			let productId = $("[name=fdProjectName]").find("option:selected").attr("id");
			
			romram = changeRomRam(romram);
			$.ajax("${LUI_ContextPath}/chenyee/quotecenter/chenyee_qc_cust_order/chenyeeQcCustOrder.do?method=getCustomerPrice", {
				dataType : "json", 
				type : "get", 
				data : {"fdRomRam" : romram, "fdCustomerName" : customerName, "fdProjectId" : productId}
			}).done(function(data) {
				setBottomPrice(data);
			}).fail(function (xhr, status) {
			    console.log('失败: ' + xhr.status + ', 原因: ' + status);
			});
		}
	}
	
	//计算最低售价
	function setBottomPrice(data) {
		console.log(data);
		if(data.length > 0) {
			let customerPrice = data[0];
			$("[name=fdBottomPrice]").val(customerPrice.bottomPrice);
			$("[name=fdBottomPrice]").data("bottomPercent", customerPrice.bottomPercent);
		}else { //该客户没有定制比例,最低售价由定制比例算出
			let prePercent = $("[name=fdPresetPercent]").val();
			//console.log(prePercent);
			let fdCostPrice = $("[name=fdCostPrice]").val();
			let bottomPrice = ((Number(prePercent) / 100 + 1) * Number(fdCostPrice)).toFixed(3);
			$("[name=fdBottomPrice]").val(bottomPrice);
			$("[name=fdBottomPrice]").data("bottomPercent", 0);
		}
	}
	
	//查询的前提条件
	function preCondition (type) {
		let romram = $("[name=fdRomRam]").find("option:selected").attr("id");
		let customerName = $("[name=fdCustomerName]").find("option:selected").attr("id");
		let productId = $("[name=fdProjectName]").find("option:selected").attr("id");
		
		//耳机值变化导致成本价变化的前提条件不需要选中客户
		if(type === "ear") {
			if(romram == null || romram == "" || romram == "undefined" || productId == "undefined" || productId == null || productId == ""){
				return false;
			}
			return true;
		}
		
		if(romram == null || romram == "" || romram == "undefined" || customerName == "undefined" || customerName == null || customerName == "" || productId == "undefined" || productId == null || productId == ""){
			return false;
		}
		
		/* console.log(romram.length + " " + romram);
		console.log(customerName.length + " " + customerName);
		console.log(productId.length + " " + productId);
		if(romram.length > 0 && customerName.length > 0 && productId.length > 0){
			return true;
		} */
		return true;
	}
	
	/*将加号转译*/
	function changeRomRam(romram) {
		let index = romram.indexOf('+');
		let rom = romram.substring(0, index);
		let ram = romram.substring(index+1);
		return rom + "romram" + ram;
	}
	
	// 显示提示信息
	function showMessage(salesPercent){
		let fdPercent = $("[name=fdPresetPercent]").val();
		let bottomPercent  = $("[name=fdBottomPrice]").data("bottomPercent");
		if(bottomPercent != 0) {
			comparePercent(salesPercent, bottomPercent);
		}else {
			comparePercent(salesPercent, fdPercent);
		}
	}
	
	//比较预设或定制比例与销售比例的大小
	function comparePercent(salesPercent, percent) {
		if(Number(salesPercent) >= Number(percent)) {
			//$("#submit_apply_button").show();
			//$("#submit_approval_button").hide();
			$(".message_div").html("可以直接申请成功！").css("color", "green");
		}else {
			//$("#submit_approval_button").show();
			//$("#submit_apply_button").hide();
			$(".message_div").html("低于预设比例，需要提交审批！！").css("color", "red");
		}
	}
	
	function xx(){
		alert(11111);
	}
</script>
