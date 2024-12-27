<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath }" var="root"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单</title>
	<script type="text/javascript" src="${root }/static-resources/js/bayernfeng.js"></script>
	<link href="${root }/static-resources/css/bayernfeng.css" rel="stylesheet" type="text/css"/>
	
	<link href="${root }/static-resources/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${root }/static-resources/css/cart.css" rel="stylesheet" type="text/css"/>

	<script type="text/javascript" src="${root }/static-resources/js/jquery-3.5.1.js"></script>

	<link type="text/css" rel="stylesheet"  href="${root }/static-resources/css/basic.css">
 	<link type="text/css" rel="stylesheet"  href="${root }/static-resources/css/web.css">

</head>
<body>

	<!-- 必须要有，因为要把用户的信息收集，方便以后的更新 -->
	<input id="userId" name="userId" type="hidden" value="${user.id }">
	<input id="userUsername" name="userUsername" type="hidden" value="${user.username }">
	<input id="userPassword" name="userPassword" type="hidden" value="${user.password }">
	<input id="userSex" name="userSex" type="hidden" value="${user.sex }">
	<input id="userPhoto" name="userPhoto" type="hidden" value="${user.photo }">
	<input id="userName" name="userName" type="hidden" value="${user.name }">
	<input id="userEmail" name="userEmail" type="hidden" value="${user.email }">
	<input id="userPhone" name="userPhone" type="hidden" value="${user.phone }">



	<jsp:include page="head.jsp"/>
	
	
	<div class="container cart">

		<div class="span24">
		
			<!-- <div class="step step1">
				<ul>
					
					<li  class="current"></li>
					<li  >生成订单成功</li>
				</ul>
			</div> -->
			<!--订单支付路径开始-->
			<div id="dd_address">
				<ul>
					<li>
						<span class="but but_active">1</span>
						<span class="txt txt_active">提交订单</span>
						<span class="line line_active2"></span>
					</li>
					<li>
						<span class="but but_active">2</span>
						<span class="txt txt2 txt_active">确认订单并支付</span>
						<span class="line line2 line_active"></span>
					</li>
					<li class="last">
						<span class="but">3</span>
						<span class="txt">已完成</span>
					</li>
				</ul>
			</div>
			<!--订单支付路径结束-->
	
		
				<table id="jiangfengkx">
					<tbody>
					<tr id="toShowAllGoodsFromCart">
						<th>图片</th>
						<th>商品</th>
						<th>价格/元</th>
						<th>数量</th>
						<th>小计</th>
					</tr>
					
				</tbody>
			</table>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
					赠送积分: <em id="effectivePoint"></em>
					商品金额: <strong id="effectivePrice"></strong>
				</div>
			<form id="orderForm" action="./order_payOrder.action" method="post">
				<input type="hidden" name="order.oid" value=""/>
				<div class="span24">
					<p>
						<!-- 收货地址：<input name="order.user.addr" type="text" value="" style="width:350px" />
							<br />
						收货人&nbsp;&nbsp;&nbsp;：<input name="order.user.username" type="text" value="" style="width:150px" />
							<br /> 
						联系方式：<input name="order.user.phone" type="text"value="" style="width:150px" /> -->
						收货地址：
						<select id="addressOfUser">
							<option value="-1">------------------请选择收货地址------------------</option>
						</select>
						<a href="${root }/user/userHome.html" style="cursor: pointer;">添加新地址？</a>
					</p>
						<hr />
						<p>
							选择银行：<br/>
							<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
							<img src="${root }/static-resources/bank_img/icbc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
							<img src="${root }/static-resources/bank_img//bc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
							<img src="${root }/static-resources/bank_img/abc.bmp" align="middle"/>
							<br/>
							<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
							<img src="${root }/static-resources/bank_img/bcc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
							<img src="${root }/static-resources/bank_img/pingan.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
							<img src="${root }/static-resources/bank_img/ccb.bmp" align="middle"/>
							<br/>
							<input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>光大银行
							<img src="${root }/static-resources/bank_img/guangda.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>招商银行
							<img src="${root }/static-resources/bank_img/cmb.bmp" align="middle"/>
						</p>
						<hr />
						<p style="text-align:right">
							<a href="javascript: confirmTheOrder();">
								<img src="${root }/static-resources/images/finalbutton.gif" width="204" height="51" border="0" />
							</a>
						</p>
				</div>
			</form>
		</div>
		
	</div>
	
	<jsp:include page="foot.jsp"/>

<script type="text/javascript">

var setCookie2 = function( cname, cvalue, exdays ) {
  	var d = new Date();
  	d.setTime(d.getTime()+(exdays*24*60*60*1000));
  	var expires = "expires="+d.toGMTString();
  	document.cookie = cname + "=" + cvalue + "; " + expires + "; path=/";
}

var getCookie2 = function( cname ) {
  	var name = cname + "=";
  	var ca = document.cookie.split(';');
  	for(var i=0; i<ca.length; i++) {
    	var c = ca[i].trim();
    	if (c.indexOf(name)==0) return c.substring(name.length,c.length);
  	}
  	return "";
}

	//cookie的值不要有“;”
	// 中文还需要特殊处理
	// escape(str)和unescape(str)
	// *****************************工具函数*****************************
	var setCookie = function( cname, cvalue, exdays ) {
	  var d = new Date();
	  d.setTime(d.getTime()+(exdays*24*60*60*1000));
	  var expires = "expires="+d.toGMTString();
	  document.cookie = cname + "=" + escape(cvalue) + "; " + expires + "; path=/";
	}
	
	var getCookie = function( cname ) {
	  var name = cname + "=";
	  var ca = document.cookie.split(';');
	  for(var i=0; i<ca.length; i++) {
	    var c = ca[i].trim();
	    if (c.indexOf(name)==0) return unescape(c.substring(name.length,c.length));
	  }
	  return "";
	}
	
	function uuid() {
	     var s = [];
	     var hexDigits =  "0123456789abcdef" ;
	     for ( var  i = 0; i < 36; i++) {
	     	s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
	     }
	     s[14] =  "4" ;   // bits 12-15 of the time_hi_and_version field to 0010
	     s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);   // bits 6-7 of the clock_seq_hi_and_reserved to 01
	     s[8] = s[13] = s[18] = s[23] =  "-" ;
	 
	     var  uuid = s.join( "" );
	     return  uuid;
	}
	// *****************************工具函数*****************************
	var userAddr = sessionStorage.getItem("username") + "Addr";
	var username = sessionStorage["username"];
	var ordersOfUserName = sessionStorage["username"] + "ordersOfUser";
	
	var tempOrder = JSON.parse(sessionStorage.getItem("tempOrder"));
	//alert("临时订单 -> " + JSON.stringify(tempOrder));
	//alert("获得的积分：" + sessionStorage.getItem("effectivePoint"));
	//alert("订单总价：" + sessionStorage.getItem("effectivePrice"));
	$.each( tempOrder, function( index, thiz ) {
		//alert(thiz.id);
		// 因为购物车里有一对 "-1": "-1"
		if ( thiz.id != undefined ) {
			var totalOfeach = (parseFloat(thiz.estoreprice) * parseInt(thiz.buyNum)).toFixed(2);
			var content = "\
				<tr id='cartTr"+thiz.id+"'>\
					<td width='60'>\
						<input type='hidden' name='id' value='"+thiz.id+"'>\
						<img src='/upload/image/"+thiz.titleimage+"'>\
					</td>\
					<td>\
						<a href='${root}/good/goodDetail.html/"+thiz.id+"'> "+thiz.name+"</a>\
					</td>\
					<td>\
						"+thiz.estoreprice+"\
					</td>\
					<td class='quantity' width='70'>\
						<span id='quantity"+thiz.id+"' name='quantity'>"+thiz.buyNum+"</span>\
					</td>\
					<td width='140'>\
						<span id='span"+thiz.id+"' class='subtotal'>"+totalOfeach+"</span>\
					</td>\
				</tr>\
			";
			$( "#toShowAllGoodsFromCart" ).after( content );
		}
	} );
	var money = sessionStorage.getItem("effectivePrice");
	$( "#effectivePoint" ).text( sessionStorage.getItem("effectivePoint") );
	// 修改总价
	$( "#effectivePrice" ).text( money );
	
	// 列出所有该用户的地址
	//var addresses = JSON.parse( getCookie(userAddr) );
	// 遍历显示到地址下拉栏中，value是该地址的key
	var addressesOfUser = JSON.parse( getCookie(userAddr) );
	if ( JSON.stringify(addressesOfUser) != "{}" ) {
		$.each( addressesOfUser, function( key, thiz ) {
			var provinceName = thiz.province.split(",")[1];
			var cityName = thiz.city.split(",")[1];
			var districtName = thiz.district.split(",")[1];
			var detailOfAddress = thiz.detailOfAddress;
			var consignee = thiz.consignee;
			var phone = thiz.phone;
			var defaultStat = thiz["default"];
			address = provinceName + " " + cityName + " " + districtName + " " + detailOfAddress + " " + consignee + " " + phone;
			if (defaultStat == 1) {
				$( "#addressOfUser" ).append( "<option selected value='"+key+"'>"+address+"</option>" );
			} else {
				$( "#addressOfUser" ).append( "<option value='"+key+"'>"+address+"</option>" );
			}
		} );
	} else {
		
	}

	/*
		没有选择收货地址的时候：
			1、有默认地址
			2、未选择，此时value是-1
	*/ 
	// 生成订单时的地址
	var addressForOrder = "";
	/* // 默认地址的key已经存放在session中，所以一开始从session里取
	var keyOfDefaultAddress = sessionStorage.getItem("keyOfDefaultAddress"); */
	// 默认地址的key已经存放在cookie中，所以一开始从cookie里取
	var keyOfDefaultAddress = getCookie("keyOfDefaultAddress" + sessionStorage.getItem("username"));
	//if (keyOfDefaultAddress != null) {
	if ( keyOfDefaultAddress != "null" ) {
		//alert(JSON.stringify(addressesOfUser[keyOfDefaultAddress]));
		addressForOrder = $( "#addressOfUser option:selected" ).text();
	}
	// 获取以选择的收货地址，用于订单的生成
	$( "#addressOfUser" ).change( function() {
		// 必须选择有效地址
		if ( $( "#addressOfUser" ).val() != "-1" ) {
			addressForOrder = $( "#addressOfUser option:selected" ).text();
		} else {
			addressForOrder = "";
		}
		//alert(addressForOrder)
	} );
	
	// 确认订单，此时生成一个订单，该订单有商品信息，和收货地址
	/*
		订单的“数据结构”
		{
			goods: {},
			address: "",
			money: 1234.56
		}
	*/
	var orderWithAddressAndMoney = {  };
	
	// 用户的所有订单
	/*
		var ordersOfUser = { 
				uuid: sendData	
		};	
	*/
	var ordersOfUser = {  };
	if ( getCookie2(ordersOfUserName) != "" ) {
		ordersOfUser = JSON.parse( getCookie2(ordersOfUserName) );
	}
	
	function confirmTheOrder() {
		if ( addressForOrder == "" ) {
			alert("请选择收货地址")
			return;
		}
		// 构建订单的“数据结构”
		// 商品是json格式的对象
		orderWithAddressAndMoney["goods"] = tempOrder;
		// 地址是字符串
		orderWithAddressAndMoney["address"] = addressForOrder;
		orderWithAddressAndMoney["money"] = money;
		
		//alert(JSON.stringify(orderWithAddressAndMoney))
		/*
			订单在支付成功的时候，
				1、把订单信息传到controller，对相应的商品id的库存进行修改
				2、并且把购物车对应的商品删除
		*/
		//alert("传到controller相应的更新数据库");
		//alert(JSON.stringify(orderWithAddressAndMoney));
		var orderId = new Date().valueOf();
		var sendData = {
				"orderId": orderId,
				money: orderWithAddressAndMoney.money,
				name: $( "#userName" ).val(),
				userId: $( "#userId" ).val(),
				"goods": JSON.stringify(orderWithAddressAndMoney.goods),
				address: orderWithAddressAndMoney.address
		};
		$.ajax( {
			url: "${root}/order/data/orderWillBePaid.do",
			type: "post",
			dataType: "json",
			data: sendData,
			success: function( result ) {
				if ( result.code == 1 ) {
					alert( result.msg );
					
					// 把订单信息存在cookie中，
					ordersOfUser[uuid()] = {
							"orderId": orderId,
							money: orderWithAddressAndMoney.money,
							name: $( "#userName" ).val(),
							userId: $( "#userId" ).val(),
							"goods": orderWithAddressAndMoney.goods,
							address: orderWithAddressAndMoney.address
					};
					// 更新
					setCookie2(ordersOfUserName, JSON.stringify(ordersOfUser), 10);
					
					// 删除cookie里的购物车中的对应商品
					var cart = JSON.parse(getCookie2(username));
					for (key in tempOrder) {
						// 删除
						cart[key] = undefined;
						//alert(key + " -> " + JSON.stringify(cart[key]))
					}
					// 更新
					setCookie2(username, JSON.stringify(cart), 10);
					
					location.href = "${root}/order/data/orderToBePaid.do";
				} else {
					alert( result.msg );
				}
			}
		} );
		
		/* // 删除cookie里的购物车中的对应商品
		var cart = JSON.parse(getCookie2(username));
		for (key in tempOrder) {
			// 删除
			cart[key] = undefined;
			//alert(key + " -> " + JSON.stringify(cart[key]))
		}
		// 更新
		setCookie2(username, JSON.stringify(cart), 10); */
		//alert(JSON.stringify(cart))
		//location.href = "${root}/cart/data/cart.html";
	}
	
	
	
	
	// 订单table的样式
	//$( "table[id=jiangfengkx] tr:even" ).css("background-color", "gray");
		
	$( "table[id=jiangfengkx] tr" ).mouseover( function() {
		$( "#" + this.id ).css("background-color", "yellow");
	} ).mouseout( function() {
		$( "#" + this.id ).removeAttr("style");
		$( "table[id=index_center] tr:even" ).css("background-color", "gray");
	} );
</script>

</body>
</html>