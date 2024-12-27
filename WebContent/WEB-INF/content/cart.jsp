<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath }" var="root"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
	<script type="text/javascript" src="${root }/static-resources/js/bayernfeng.js"></script>
	<link href="${root }/static-resources/css/bayernfeng.css" rel="stylesheet" type="text/css"/>

	<script type="text/javascript" src="${root }/static-resources/js/jquery-3.5.1.js"></script>

	<link href="${root }/static-resources/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${root }/static-resources/css/cart.css" rel="stylesheet" type="text/css">
	<link href="${root }/static-resources/css/index.css" rel="stylesheet" type="text/css"/>

	<link type="text/css" rel="stylesheet"  href="${root }/static-resources/css/basic.css">
 	<link type="text/css" rel="stylesheet"  href="${root }/static-resources/css/web.css">

</head>
<body>

<jsp:include page="head.jsp"/>


<div class="container cart">
		<div class="span24">
		
			<audio controls>
				<!-- <source src="horse.ogg" type="audio/ogg"> -->
				<source src="/fengmusic/River Flows In You - 李闰珉.mp3" type="audio/mpeg">
			</audio>
<!-- 			<audio autoplay="autoplay" controls>
				<source src="horse.ogg" type="audio/ogg">
				<source src="/fengmusic/River Flows In You - 李闰珉.mp3" type="audio/mpeg">
			</audio> -->
			
			<!--订单支付路径开始-->
			<div id="dd_address">
				<ul>
					<li>
						<span class="but but_active">1</span>
						<span class="txt txt_active">提交订单</span>
						<span class="line line_active"></span>
					</li>
					<li>
						<span class="but">2</span>
						<span class="txt txt2">确认订单并支付</span>
						<span class="line line2"></span>
					</li>
					<li class="last">
						<span class="but">3</span>
						<span class="txt">已完成</span>
					</li>
				</ul>
			</div>
			<!--订单支付路径结束-->
			
				<table id="jiangfengkx">
					<tbody><tr id="toShowAllGoodsFromCart">
						<th><input id="AllChecks" type="checkbox">全选/反选</th>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
						<th>操作</th>
					</tr>
						<%-- <tr>
							<td width="80"><input type="checkbox"></td>
							<td width="60">
								<input type="hidden" name="id" value="22">
								<img src="${root }/static-resources/image/dadonggua.jpg">
							</td>
							<td>
								<a target="_blank"> 有机蔬菜      大冬瓜...</a>
							</td>
							<td>
								￥298.00
							</td>
							<td class="quantity" width="60">
								1
							</td>
							<td width="140">
								<span class="subtotal">￥596.00</span>
							</td>
							<td>
								<a href="javascript:;" class="delete">删除</a>
							</td>
						</tr> --%>
				</tbody></table>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
					<c:if test="${user eq null }">
						<em>
							登录后确认是否享有优惠
						</em>
					</c:if>
					<c:if test="${user ne null }">
						赠送积分: <em id="effectivePoint">0</em>
						商品金额: <strong id="effectivePrice">￥0.00元</strong>
					</c:if>
				</div>
				<div class="bottom">
<!-- 					<a onclick="return confirmIfDelete();" href="http://www.baidu.com">删除已选择</a> -->
					<a href="javascript: confirmIfDelete();">删除已选择</a>
					<a href="javascript: confirmIfClearAll();" id="clear" class="clear">清空购物车</a>
					<a onclick="submitTheCart();" name="submitTheCart" style="cursor: pointer;" id="submit" class="submit">结算</a>
				</div>
		</div>
	</div>


<jsp:include page="foot.jsp"/>

<script type="text/javascript">

var setCookie = function( cname, cvalue, exdays ) {
  	var d = new Date();
  	d.setTime(d.getTime()+(exdays*24*60*60*1000));
  	var expires = "expires="+d.toGMTString();
  	document.cookie = cname + "=" + cvalue + "; " + expires + "; path=/";
}

var getCookie = function( cname ) {
  	var name = cname + "=";
  	var ca = document.cookie.split(';');
  	for(var i=0; i<ca.length; i++) {
    	var c = ca[i].trim();
    	if (c.indexOf(name)==0) return c.substring(name.length,c.length);
  	}
  	return "";
}

var id = "";
var finalTotal;
// 用于计算单个价格和
// ”数据结构“
// { "1": [25.5, 12] }
var mapOfPriceAndBuyNumWithId = {};
// mapOfPriceAndBuyNumWithId的key
var key;
//做加的操作
function add(_this){
	id = "quantity" + _this.id;
	key = _this.id;
	var quantity=document.getElementById(id).value;
	//如果加到99不可再加
	if(quantity==99){
		return;
	}
	quantity++;
	document.getElementById(id).value=quantity;
}
//做减得操作
function reduce(_this){
	id = "quantity" + _this.id;
	key = _this.id;
	 var quantity=document.getElementById(id).value;
	//如果减到1不可再减少
	if(quantity==1){
		return;
	}
	quantity--;
	document.getElementById(id).value=quantity;
}
//改正。用户可以恶意的输入非法的数字,非法烦的数字转换成数字
function judge(_this){
	id = _this.id;
	
	//alert(id.substring(id.indexOf("quantity"), "quantity".length))
	//alert(id.substring("quantity".length))
	key = id.substring("quantity".length);
	var val=_this.value;  
	if(/[^\d]/.test(val)){//替换非数字字符    
		var temp_amount=val.replace(/[^\d]/g,'');    
		_this.value=temp_amount; 
	}    
	val=_this.value;
	if(val>99){
		_this.value=99;
	}
	if(val<1){
		_this.value=1;
	}
	
	// 把该值动态影响到总价
	//alert("finalTotal: " + finalTotal);
	//alert(val);
	mapOfPriceAndBuyNumWithId[key][1] = val;
	// 修改单个商品的总价
	$( "#span"+key ).text( (parseFloat(mapOfPriceAndBuyNumWithId[key][0]) * parseInt(mapOfPriceAndBuyNumWithId[key][1])).toFixed(2) );
	var finalTotal = 0.00;
	for ( n in mapOfPriceAndBuyNumWithId) {
		finalTotal += parseFloat((parseFloat(mapOfPriceAndBuyNumWithId[n][0]) * parseInt(mapOfPriceAndBuyNumWithId[n][1])).toFixed(2));
	}
	// 计算总积分
	var point = (finalTotal / 50).toFixed(0)
	$( "#effectivePoint" ).text( point );
	// 修改总价
	$( "#effectivePrice" ).text( finalTotal.toFixed(2) );
	
	/*	更新cookie里的购物车
		一、购买数量改变
		二、删除购物车里的商品
	*/
	if ( shopCart != undefined) {
		// 修改
		shopCart[key].buyNum = val;
		// 保存到cookie 可以考虑优化，没必要每次改变都保存，再关闭购物车页面的时候保存。
		setCookie(username, JSON.stringify(shopCart), 10);
		
	}
	
	
	// 未登录的临时购物车处理
	// 更新保存到session中
	shopCartWhenNotLogin[key].buyNum = val;
	sessionStorage.setItem("shopCartWhenNotLogin", JSON.stringify(shopCartWhenNotLogin));
	
}


// 修改购买数量，计算总价
var fengJiang = function(thiz) {
	var buyNum = $( "#"+id ).val();
	// 修改单个商品的总价和购物车总价
	//alert("finalTotal: " + finalTotal);
	//alert(JSON.stringify(mapOfPriceAndBuyNumWithId));
	//alert(buyNum)
	mapOfPriceAndBuyNumWithId[key][1] = buyNum;
	// 修改单个商品的总价
	$( "#span"+key ).text( (parseFloat(mapOfPriceAndBuyNumWithId[key][0]) * parseInt(mapOfPriceAndBuyNumWithId[key][1])).toFixed(2) );
	var finalTotal = 0.00;
	for ( n in mapOfPriceAndBuyNumWithId) {
		finalTotal += parseFloat((parseFloat(mapOfPriceAndBuyNumWithId[n][0]) * parseInt(mapOfPriceAndBuyNumWithId[n][1])).toFixed(2));
	}
	// 计算总积分
	var point = (finalTotal / 50).toFixed(0)
	$( "#effectivePoint" ).text( point );
	// 修改总价
	$( "#effectivePrice" ).text( finalTotal.toFixed(2) );
	
	/*	更新cookie里的购物车
		一、购买数量改变
		二、删除购物车里的商品
	*/
	// 修改
	if ( shopCart != undefined) {
		shopCart[key].buyNum = buyNum;
		// 保存到cookie 可以考虑优化，没必要每次改变都保存，再关闭购物车页面的时候保存。
		setCookie(username, JSON.stringify(shopCart), 10);
		
	}
	
	
	// 未登录的临时购物车处理
	// 更新保存到session中
	shopCartWhenNotLogin[key].buyNum = buyNum;
	sessionStorage.setItem("shopCartWhenNotLogin", JSON.stringify(shopCartWhenNotLogin));
	
}

// 删除商品时，计算总价，给一个商品的id
function buyNumIsZero(key) {
	var buyNum = 0;
	// 修改单个商品的总价和购物车总价
	//alert("finalTotal: " + finalTotal);
	//alert(JSON.stringify(mapOfPriceAndBuyNumWithId));
	//alert(buyNum)
	mapOfPriceAndBuyNumWithId[key][1] = buyNum;
	// 修改单个商品的总价
	$( "#span"+key ).text( (parseFloat(mapOfPriceAndBuyNumWithId[key][0]) * parseInt(mapOfPriceAndBuyNumWithId[key][1])).toFixed(2) );
	var finalTotal = 0.00;
	for ( n in mapOfPriceAndBuyNumWithId) {
		finalTotal += parseFloat((parseFloat(mapOfPriceAndBuyNumWithId[n][0]) * parseInt(mapOfPriceAndBuyNumWithId[n][1])).toFixed(2));
	}
	// 计算总积分
	var point = (finalTotal / 50).toFixed(0)
	$( "#effectivePoint" ).text( point );
	// 修改总价
	$( "#effectivePrice" ).text( finalTotal.toFixed(2) );
}

$( function() {
	// 监听购买数量的改变
	// 没效果？？？？
	$( "#"+id ).change( function() {
		alert("fffffff")
	} );
} );


/* 购物车，此时的信息需要存到cookie中
	在临时的购物车中，遍历临时购物车，与此购物车（仓库）对比
	如果有相同的id（商品编号，即shopCart对象的属性名）
	修改buyNum
*/


	
	
	var username = sessionStorage["username"];
	// 如果没有登录，先创建一个临时的购物车
	// 没登录的时候创建一个临时购物车，存在session中
	var shopCartWhenNotLogin = { "-1": "-1" };
	if ( JSON.parse(sessionStorage.getItem("shopCartWhenNotLogin")) != null ) {
		shopCartWhenNotLogin = JSON.parse(sessionStorage.getItem("shopCartWhenNotLogin"));
	}
	// 用户没有登录的时候
	if ( username == undefined ) {
		//alert("jiangfeng")
		//alert(JSON.stringify(shopCartWhenNotLogin))
		if ( JSON.stringify(shopCartWhenNotLogin) == '{"-1":"-1"}' ) {
			var content = "\
				<tr id='emptyCart'>\
					<td colspan='8' align='center'>\
						<a href='${root}/good/showGoodsByCategory_Id.html/0/1'><font color='red'>该购物车还没有商品，快点添加购买吧</font></a>\
					</td>\
				</tr>\
			";
			$( "#toShowAllGoodsFromCart" ).after( content );
		} else {
			var content = "\
				<tr id='emptyCart'>\
					<td colspan='8' align='center'>\
						<a href='${root}/good/showGoodsByCategory_Id.html/0/1'><font color='red'>继续购买</font></a>\
					</td>\
				</tr>\
			";
			$( "#toShowAllGoodsFromCart" ).after( content );
		}
		
		$.each( shopCartWhenNotLogin, function( index, thiz ) {
			//alert(thiz.id);
			// 因为购物车里有一对 "-1": "-1"
			if ( thiz.id != undefined ) {
				// 单价 * 数量 保留两位小数
				var totalOfEach = (parseInt(thiz.buyNum) * parseFloat(thiz.estoreprice)).toFixed(2);
				
				// 把价格和购买数量存到对象里。以便修改购买数量的时候动态修改价格
				var priceAndNumArr = [parseFloat(thiz.estoreprice), parseInt(thiz.buyNum)];
				mapOfPriceAndBuyNumWithId[thiz.id] = priceAndNumArr;
				totalOfEach = (parseFloat(mapOfPriceAndBuyNumWithId[thiz.id][0]) * parseInt(mapOfPriceAndBuyNumWithId[thiz.id][1])).toFixed(2);
				// 上面的代码对动态改变不起作用
				total += parseFloat(totalOfEach);
				finalTotal = total;
				var content = "\
					<tr id='cartTr"+thiz.id+"'>\
						<td width='80'><input id='fengcheck"+thiz.id+"' name='fengcheck' type='checkbox'></td>\
						<td width='60'>\
							<input type='hidden' name='id' value='"+thiz.id+"'>\
							<img src='/upload/image/"+thiz.titleimage+"'>\
						</td>\
						<td>\
							<a href='${root}/good/goodDetail.html/"+thiz.id+"'> "+thiz.name+"</a>\
						</td>\
						<td>\
							"+mapOfPriceAndBuyNumWithId[thiz.id][0]+"\
						</td>\
						<td class='quantity' width='70'>\
							<input id='quantity"+thiz.id+"' name='quantity' value='"+mapOfPriceAndBuyNumWithId[thiz.id][1]+"' maxlength='4'\
								onpaste='return false;' type='text' onkeyup='judge(this)'>\
							<div>\
								<span id='"+thiz.id+"' class='increase' onclick='add(this); fengJiang(this);'>&nbsp;</span>\
								<span id='"+thiz.id+"' class='decrease' onclick='reduce(this); fengJiang(this);'>&nbsp;</span>\
							</div>\
						</td>\
						<td width='140'>\
							<span id='span"+thiz.id+"' class='subtotal'>"+totalOfEach+"</span>\
						</td>\
						<td>\
							<a><span id='identifyFordelete"+thiz.id+"' style='cursor: pointer;' onclick='confirmIfDelete(this);' class='delete'>删除</span></a>\
						</td>\
					</tr>\
				";
				$( "#toShowAllGoodsFromCart" ).after( content );
			}
		} );
		
	// 用户登录的时候
	} else {
		//alert(username+" 的购物车："+sessionStorage.getItem(username));
		//var shopCart = JSON.parse(sessionStorage.getItem(username));
		var shopCart = {"-1":"-1"};
		if ( getCookie(username) != "" ) {
			shopCart = JSON.parse(getCookie(username));
		}
		
		// 如果未登录前临时购物车有商品，则更新到shopCart中，
		if ( sessionStorage.getItem("shopCartWhenNotLogin") != '{"-1":"-1"}' ) {
			var shopCartWhenNotLogin = JSON.parse(sessionStorage.getItem("shopCartWhenNotLogin"));
			for (keyWhenNotLogin in shopCartWhenNotLogin) {
				var flag = true;
				for (key in shopCart) {
					// 临时购物车的商品在用户购物车中已存在，修改数量
					if (keyWhenNotLogin == key) {
						flag = false;
						break;
					}
				}
				// 不存在，添加
				if (flag) {
					shopCart[keyWhenNotLogin] = shopCartWhenNotLogin[keyWhenNotLogin];
				} else { // 存在，修改数量
					var buyNum = parseInt(shopCart[keyWhenNotLogin].buyNum);
					var buyNumWhenNotLogin = parseInt(shopCartWhenNotLogin[keyWhenNotLogin].buyNum);
					shopCart[keyWhenNotLogin].buyNum = buyNum + buyNumWhenNotLogin;
				}
				// 更新到购物车后，删除临时购物车的商品
				shopCartWhenNotLogin[keyWhenNotLogin] = undefined;
				// 更新
				sessionStorage.setItem("shopCartWhenNotLogin", JSON.stringify(shopCartWhenNotLogin))
				setCookie(username, JSON.stringify(shopCart), 10);
			}
		}
		
		// 整个购物车的商品价格
		var total = 0.00;
		// true
		//alert(getCookie(username) == '{"-1":"-1"}')
		// false
		//alert(getCookie(username) == "{'-1':''-1'}")
		if ( getCookie(username) == '{"-1":"-1"}' ) {
			var content = "\
				<tr id='emptyCart'>\
					<td colspan='8' align='center'>\
						<a href='${root}/good/showGoodsByCategory_Id.html/0/1'><font color='red'>该购物车还没有商品，快点添加购买吧</font></a>\
					</td>\
				</tr>\
			";
			$( "#toShowAllGoodsFromCart" ).after( content );
		} else {
			var content = "\
				<tr id='emptyCart'>\
					<td colspan='8' align='center'>\
						<a href='${root}/good/showGoodsByCategory_Id.html/0/1'><font color='red'>继续购买</font></a>\
					</td>\
				</tr>\
			";
			$( "#toShowAllGoodsFromCart" ).after( content );
		}
		
		$.each( shopCart, function( index, thiz ) {
			//alert(thiz.id);
			// 因为购物车里有一对 "-1": "-1"
			if ( thiz.id != undefined ) {
				// 单价 * 数量 保留两位小数
				var totalOfEach = (parseInt(thiz.buyNum) * parseFloat(thiz.estoreprice)).toFixed(2);
				
				// 把价格和购买数量存到对象里。以便修改购买数量的时候动态修改价格
				var priceAndNumArr = [parseFloat(thiz.estoreprice), parseInt(thiz.buyNum)];
				mapOfPriceAndBuyNumWithId[thiz.id] = priceAndNumArr;
				totalOfEach = (parseFloat(mapOfPriceAndBuyNumWithId[thiz.id][0]) * parseInt(mapOfPriceAndBuyNumWithId[thiz.id][1])).toFixed(2);
				// 上面的代码对动态改变不起作用
				total += parseFloat(totalOfEach);
				finalTotal = total;
				var content = "\
					<tr id='cartTr"+thiz.id+"'>\
						<td width='80'><input id='fengcheck"+thiz.id+"' name='fengcheck' type='checkbox'></td>\
						<td width='60'>\
							<input type='hidden' name='id' value='"+thiz.id+"'>\
							<img src='/upload/image/"+thiz.titleimage+"'>\
						</td>\
						<td>\
							<a href='${root}/good/goodDetail.html/"+thiz.id+"'> "+thiz.name+"</a>\
						</td>\
						<td>\
							"+mapOfPriceAndBuyNumWithId[thiz.id][0]+"\
						</td>\
						<td class='quantity' width='70'>\
							<input id='quantity"+thiz.id+"' name='quantity' value='"+mapOfPriceAndBuyNumWithId[thiz.id][1]+"' maxlength='4'\
								onpaste='return false;' type='text' onkeyup='judge(this)'>\
							<div>\
								<span id='"+thiz.id+"' class='increase' onclick='add(this); fengJiang(this);'>&nbsp;</span>\
								<span id='"+thiz.id+"' class='decrease' onclick='reduce(this); fengJiang(this);'>&nbsp;</span>\
							</div>\
						</td>\
						<td width='140'>\
							<span id='span"+thiz.id+"' class='subtotal'>"+totalOfEach+"</span>\
						</td>\
						<td>\
							<a><span id='identifyFordelete"+thiz.id+"' style='cursor: pointer;' onclick='confirmIfDelete(this);' class='delete'>删除</span></a>\
						</td>\
					</tr>\
				";
				$( "#toShowAllGoodsFromCart" ).after( content );
			}
		} );
	}
	// 计算总积分
	var point = (finalTotal / 50).toFixed(0)
	if ( point == "NaN" ) {
		point = 0;
	}
	$( "#effectivePoint" ).text( point );
	// 修改总价
	$( "#effectivePrice" ).text( finalTotal.toFixed(2) );

	// 一、在购物车修改数量，或者删除商品时，更新cookie中的购物车。
	// 二、订单生成以后，该商品在购物车中清除，更新cookie中的购物车。
	

	// 从cookie里拿当前用户的购物车。然后赋值给在session范围里的购物车
	
	

	// 删除当前物品
	function confirmIfDelete(thiz) {
		//return confirm("是否执行该操作");
		if ( confirm("是否执行该操作") ) {
			// 删除当前行
			if (undefined != thiz) {
				var key = thiz.id.substring("identifyFordelete".length);
				buyNumIsZero(key);
				if ( shopCart != undefined) {
					// 删除
					shopCart[key] = undefined;
					// 更新cookie里的购物车
					setCookie(username, JSON.stringify(shopCart), 10);
				}

				// 未登录的临时购物车处理
				// 更新保存到session中
				shopCartWhenNotLogin[key] = undefined;
				sessionStorage.setItem("shopCartWhenNotLogin", JSON.stringify(shopCartWhenNotLogin));
				
				
				// 删除当前行
				$( "#cartTr"+key ).remove();
				
				if ( getCookie(username) == '{"-1":"-1"}' ) {
					// 删除该行的siblings
					$( "#toShowAllGoodsFromCart" ).siblings().remove();
					var content = "\
						<tr id='emptyCart'>\
							<td colspan='8' align='center'>\
								<a href='${root}/good/showGoodsByCategory_Id.html/0/1'><font color='red'>该购物车还没有商品，快点添加购买吧</font></a>\
							</td>\
						</tr>\
					";
					$( "#toShowAllGoodsFromCart" ).after( content );
					// 总积分
					$( "#effectivePoint" ).text( 0 );
					// 修改总价
					$( "#effectivePrice" ).text( "￥0.00元" );
				}
				
			} else { // 删除已选中
				//alert("删除已选中")
				$.each( $( "input:not(#AllChecks):checked" ), function( index, thiz ) {
					var key = thiz.id.substring("fengcheck".length);
					buyNumIsZero(key);
					if ( shopCart != undefined) {
						// 删除
						shopCart[key] = undefined;
						// 更新cookie里的购物车
						setCookie(username, JSON.stringify(shopCart), 10);
					}
					
					
					// 未登录的临时购物车处理
					// 更新保存到session中
					shopCartWhenNotLogin[key] = undefined;
					sessionStorage.setItem("shopCartWhenNotLogin", JSON.stringify(shopCartWhenNotLogin));
					
					
					// 删除当前行
					$( "#cartTr"+key ).remove();
					
					if ( getCookie(username) == '{"-1":"-1"}' ) {
						// 删除该行的siblings
						$( "#toShowAllGoodsFromCart" ).siblings().remove();
						var content = "\
							<tr id='emptyCart'>\
								<td colspan='8' align='center'>\
									<a href='${root}/good/showGoodsByCategory_Id.html/0/1'><font color='red'>该购物车还没有商品，快点添加购买吧</font></a>\
								</td>\
							</tr>\
						";
						$( "#toShowAllGoodsFromCart" ).after( content );
						// 总积分
						$( "#effectivePoint" ).text( 0 );
						// 修改总价
						$( "#effectivePrice" ).text( "￥0.00元" );
					}
				} );
			}
			
		}
	}

	// 清空购物车
	function confirmIfClearAll() {
		if ( confirm("是否执行该操作") ) {
			//alert("已清空购物车")
			// 删除所有
			shopCart = { "-1": "-1" };
			// 更新cookie里的购物车
			setCookie(username, JSON.stringify(shopCart), 10);
			//sessionStorage.setItem(username, JSON.stringify(shopCart));

			// 未登录的临时购物车处理
			// 更新保存到session中
			var shopCartWhenNotLogin = { "-1": "-1" };
			sessionStorage.setItem("shopCartWhenNotLogin", JSON.stringify(shopCartWhenNotLogin));
			
			// 删除该行的siblings
			$( "#toShowAllGoodsFromCart" ).siblings().remove();
			var content = "\
				<tr id='emptyCart'>\
					<td colspan='8' align='center'>\
						<a href='${root}/good/showGoodsByCategory_Id.html/0/1'><font color='red'>该购物车还没有商品，快点添加购买吧</font></a>\
					</td>\
				</tr>\
			";
			$( "#toShowAllGoodsFromCart" ).after( content );
			// 总积分
			$( "#effectivePoint" ).text( 0 );
			// 修改总价
			$( "#effectivePrice" ).text( "￥0.00元" );
		}
	}
	
	$( "#AllChecks" ).click( function() {
		if ( $( "#AllChecks" ).prop( "checked" ) ) {
			$.each( $( "input[name='fengcheck']" ), function( inedex, thiz ) {
				$(thiz).prop("checked", true)
			} );
		} else {
			$.each( $( "input[name='fengcheck']" ), function( inedex, thiz ) {
				$(thiz).prop("checked", false)
			} );
		}
	} );
	
	// 所有复选框，只要点击，就触发函数
	$( ":checkbox" ).click( function() {
		var $checks = $( "input:not(#AllChecks):checked" );
		if ( $checks.size() > 0) {
			var selectedTotal = 0.00;
			$.each( $checks, function( index, thiz ) {
				var key = thiz.id.substring("fengcheck".length);
				selectedTotal += parseInt(shopCart[key].buyNum) * parseFloat(shopCart[key].estoreprice);
			} );
			var point = (selectedTotal / 50).toFixed(0);
			if ( point == "NaN" ) {
				point = 0;
			}
			$( "#effectivePoint" ).text( point );
			$( "#effectivePrice" ).text( selectedTotal.toFixed(2) );
		} else {
			var finalTotal = 0.00;
			// 计算购物车的所有商品总价
			$.each( shopCart, function( index, thiz ) {
				if ( thiz.id != undefined ) {
					var key = thiz.id;
					finalTotal += parseInt(shopCart[key].buyNum) * parseFloat(shopCart[key].estoreprice);
				}
			} );
			var point = (finalTotal / 50).toFixed(0)
			if ( point == "NaN" ) {
				point = 0;
			}
			$( "#effectivePoint" ).text( point );
			$( "#effectivePrice" ).text( finalTotal.toFixed(2) );
		}
	} );
	
	/*
		结算，结算的时候，在sessionStorage里建一个临时订单，
		地址为默认，可以修改，修改后返回提交订单页面。
		只有确认提交订单，即在确认付款之前，把订单里的商品从购物车删除。
	*/
	$( "a[name='submitTheCart']" ).click( function() {
		
		if (<%=request.getSession().getAttribute("user")%> == null) {
			alert("请登录");
		} else {
			// 创建一个临时订单信息。存在session中
			var order = {  };
			var $checks = $( "input:not(#AllChecks):checked" );
			if ( $checks.size() > 0) {
				$.each( $checks, function( index, thiz ) {
					var key = thiz.id.substring("fengcheck".length);
					order[key] = shopCart[key];
				} );
				// 存在session里
				sessionStorage.setItem("tempOrder", JSON.stringify(order));
				sessionStorage.setItem("effectivePoint", $( "#effectivePoint" ).text())
				sessionStorage.setItem("effectivePrice", $( "#effectivePrice" ).text())
				location.href="${root }/order/data/order.html";
			} else {
				alert("还没选择商品");
			}
		}
		
	} );
	function submitTheCart() {
		
	}
	
	/* alert( sessionStorage.getItem("item") );
	alert( JSON.parse(sessionStorage.getItem("item")).item.buyNum );
	alert( JSON.parse(sessionStorage.getItem("item"))["item"].buyNum );
	alert( JSON.parse(sessionStorage.getItem("item"))["item"]["buyNum"] ); */
	
	//alert( JSON.parse(sessionStorage.getItem("shopCart"))[1] );
	//alert( sessionStorage.getItem("shopCart") );
	//var shopCart = JSON.parse(sessionStorage.getItem("shopCart"));
	/* var count = 0;
	for (key in shopCart) {
		//alert(key)
		count += 1;
	}
	alert(count) */
	//alert(sessionStorage.getItem("shopCart"));


	
	
	
	
	
	
	// 购物车table的样式
	//$( "table[id=jiangfengkx] tr:even" ).css("background-color", "gray");
		
	$( "table[id=jiangfengkx] tr" ).mouseover( function() {
		$( "#" + this.id ).css("background-color", "yellow");
	} ).mouseout( function() {
		$( "#" + this.id ).removeAttr("style");
		$( "table[id=index_center] tr:even" ).css("background-color", "gray");
	} );
	
	
	
	
	
	
	// 购物车的分页查询，选中的时候，即使选择下一页，也会记住被选择的。提交选中的订单
	
</script>

</body>
</html>