<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set value="${pageContext.request.contextPath }" var="root"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情</title>
	<script type="text/javascript" src="${root }/static-resources/js/bayernfeng.js"></script>
	<link href="${root }/static-resources/css/bayernfeng.css" rel="stylesheet" type="text/css"/>

	<script type="text/javascript" src="${root }/static-resources/js/jquery-3.5.1.js"></script>

	<link href="${root }/static-resources/css/slider.css" rel="stylesheet" type="text/css"/>
	<link href="${root }/static-resources/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${root }/static-resources/css/index.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<jsp:include page="head.jsp"/>

<!-- 内容部分 -->
	<div class="container productContent">
		<div class="span6">
			 <!-- 引入左边的导航栏 -->
			 <jsp:include page="left.jsp"/>
		</div>
		<div class="span18 last">

			<div class="productImage">
				<a title="" style="outline-style: none; text-decoration: none;"
					id="zoom" href="" rel="gallery">
					<div class="zoomPad">
						<img style="opacity: 1;" title="" class="medium" id="imagesTitle">
					</div>
				</a>

			</div>
			<div class="name" id="name"></div>
			<div class="sn">
				<div>编号:<span id="bianhao"></span></div>
			</div>
			<div class="sn">
				<div>库存:<span id="kucun"></span></div>
			</div>
			<div class="info">
				<dl>
					<dt>亿家价:</dt>
					<dd>
						<strong>￥：<span id="estoreprice"></span>元/份</strong>
					 参 考 价：<del>￥<span id="marketprice"></span>元/份</del>
					</dd>
				</dl>
				<dl>
					<dt>促销:</dt>
					<dd>
						<a target="_blank" title="限时抢购 (2014-07-30 ~ 2015-01-01)">限时抢购</a>
					</dd>
				</dl>
				<dl>
					<dt></dt>
					<dd>
						<span> </span>
					</dd>
				</dl>
			</div>
			<div class="action">

				<dl class="quantity">
					<dt>购买数量:</dt>
					<dd>
						<input id="quantity" name="quantity" value="1" maxlength="4"
							onpaste="return false;" type="text" onkeyup="judge(this)">
						<div>
							<span id="increase" class="increase" onclick="add(this)">&nbsp;</span> 
							<span id="decrease" class="decrease" onclick="reduce(this)">&nbsp;</span>
						</div>
					</dd>
					<dd>件</dd>
				</dl>
				<div class="buy">
					<input id="addCart" class="addCart" value="加入购物车" type="button">

				</div>
			</div>
			<div id="bar" class="bar">
				<ul>
					<li id="introductionTab"><a href="#introduction">商品介绍</a></li>

				</ul>
			</div>

			<div id="introduction" name="introduction" class="introduction">
				<div class="title">
					<strong>商品介绍</strong>
				</div>
				<div>
					 <h1 id="description" align="center"></h1><br>
					<img id="detail" style="width:600px;height:500px;align:center;">
				</div>
			</div>

		</div>
	</div>

<jsp:include page="foot.jsp"/>



<!-- 很重要 -->
<script type="text/javascript">
	//做加的操作
	function add(_this){
		var quantity=document.getElementById("quantity").value;
		//如果加到99不可再加
		if(quantity==99){
			return;
		}
		quantity++;
		document.getElementById("quantity").value=quantity;
	}
	//做减得操作
	function reduce(_this){
		 var quantity=document.getElementById("quantity").value;
		//如果减到1不可再减少
		if(quantity==1){
			return;
		}
		quantity--;
		document.getElementById("quantity").value=quantity;
	}
	//改正。用户可以恶意的输入非法的数字,非法烦的数字转换成数字
	function judge(_this){
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
	}



// *********************************添加购物车功能：直接使用cookie*****************************************
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
	
// 购物车
var shopCart = { "-1": "-1" };

var username = sessionStorage["username"];
//setCookie(username, JSON.stringify(shopCart), 10);
var item = {  };

$( "#addCart" ).click( function() {
	// 添加一个购买数量属性
	item["item"]["buyNum"] = $( "#quantity" ).val();
	//alert( item["item"].buyNum );
	// 把用户名当作key，购物车里的物品数组作为值存入cookie
	// 下次登录进入购物车之前，从cookie拿值。
	// 把商品放到购物车中
	
	// 如果没有登录，先创建一个临时的购物车
	if ( undefined == username ) {
		// 没登陆之前，临时的购物车，
		// 然后登录后，先判断有没有临时的购物车，
		// 未登录时的购物车
		var shopCartWhenNotLogin = JSON.parse(sessionStorage.getItem("shopCartWhenNotLogin"));
		if ( shopCartWhenNotLogin == null ) {
			shopCartWhenNotLogin = { "-1": "-1" };
		}
		// 商品的id
		var id = $( "#bianhao" ).text();
		var flag = true;
		for (key in shopCartWhenNotLogin) {
			// 已存在，修改数量
			if ( id == key ) {
				flag = false;
				break;
			}
		}
		if ( flag ) {
			// 添加
			shopCartWhenNotLogin[id] = item["item"];
		} else { // 已存在
			var buyNum = parseInt(shopCartWhenNotLogin[key].buyNum);
			buyNum += parseInt($( "#quantity" ).val());
			shopCartWhenNotLogin[id].buyNum = buyNum;
		}
		// 更新保存到session中
		sessionStorage.setItem("shopCartWhenNotLogin", JSON.stringify(shopCartWhenNotLogin));
	} else {
		// 然后登录后，先判断有没有临时的购物车，
		// 如果没登录之前，添加了购物车里的商品，
		// 在登录后，把临时的购物车更新到原来的购物车
		
		
		// 如果该用户（暂且是用户名）此前购物车里有信息
		if ( getCookie(username) != "" ) {
			// 从cookie拿到当前用户的购物车
			shopCart = JSON.parse(getCookie(username));
		} else {
			setCookie(username, JSON.stringify(shopCart), 10);
		}
		// 添加的商品id和shopCart里的每一个商品id对比，如果相同，修改buyNum，
		// 否则添加
		// 当前商品的id和key对比，如果没有，则添加，有，则修改数量
		var currentId = $("#bianhao").text();
		// 默认值true，规定：没有找到key
		var flag = true;
		for (key in shopCart) {
			//alert("商品编号："+$("#bianhao").text() +" -> 循环的key："+ key)
			if ( currentId ==  key) {
				// 找到
				flag = false;
				// 跳出循环，非常重要
				break;
			}
		}
		// 没有找到key，添加
		if (flag) {
			// 添加商品
			shopCart[currentId] = item["item"];
		} else {
			// 找到key，修改数量
			// 原来的购买数量
			var buyNum = parseInt(shopCart[currentId]["buyNum"]);
			//alert(key+" 原来buyNum："+buyNum);
			buyNum += parseInt($( "#quantity" ).val());
			//alert(currentId+" 添加了："+$( "#quantity" ).val()+" 添加后："+buyNum);
			// 更新购买数量
			shopCart[currentId]["buyNum"] = buyNum;
			
			// 更新商品价格
			shopCart[currentId]["estoreprice"] = $( "#estoreprice" ).text();
		}
		
		// 更新购物车
		setCookie(username, JSON.stringify(shopCart), 10);
	}
	//alert(username+" 的购物车："+getCookie(username));
	//sessionStorage.setItem($("#bianhao").text(), JSON.stringify(item));
	//alert("添加成功："+ $("#bianhao").text() + ", 添加数量：" + $( "#quantity" ).val());
	if ( confirm("添加成功："+ $("#bianhao").text() + ", 添加数量：" + $( "#quantity" ).val() + "\n是否跳转到购物车") ) {
		location.href = "${root}/cart/data/cart.html";
	}
	// 存到sessionStorage里
	//sessionStorage.setItem(username, getCookie(username));
} );


//*********************************添加购物车功能：直接使用cookie*****************************************


// 根据商品的id异步获得商品，返回一个json格式的数据
$.ajax( {
	url: "${root}/good/data/getGoodById.do/${goodId}",
	type: "post",
	dataType: "json",
	success: function( result ) {
		if (result.code == 1) {
			var good = result.msg;
			$( "#name" ).html(good.name);
			$( "#bianhao" ).html(good.id);
			$( "#estoreprice" ).html(good.estoreprice);
			$( "#marketprice" ).html(good.marketprice);
			$( "#imagesTitle" ).attr("src", "/upload/image/"+good.titleimage);
			$( "#detail" ).attr("src", "/upload/image/"+good.titleimage);
			$( "#description" ).html(good.description);
			$( "#kucun" ).html(good.num);
			
			// 存到
			item["item"] = good;
		} else {
			
		}
	}
} );

</script>

</body>
</html>