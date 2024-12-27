<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set value="${pageContext.request.contextPath }" var="root"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
	<script type="text/javascript" src="${root }/static-resources/js/bayernfeng.js"></script>
	<link href="${root }/static-resources/css/bayernfeng.css" rel="stylesheet" type="text/css"/>

	<link href="${root }/static-resources/css/common.css" rel="stylesheet" type="text/css"/>

</head>

<style type="text/css">

	.fengmessage {
		
		color: blue;
	
	}
	
	
	#li-div-search {
	 	width: 550px;
		display: table-cell;
		vertical-align: middle;
	}
	
	.search {
		margin: auto;
	}
	
	.search input {
		/* float: left;
		width: 250px;
		height: 42px;
		border: 2px solid #7BA7AB;
		border-radius: 5px 0 0 5px;
		color: #9E9C9C;
		outline: none;
		padding-left: 10px; */
	}
	
	.search button {
		float: left;
		width: 40px;
		height: 46px;
		border: none;
		background: #2EA7E0;
		border-radius: 0 5px 5px 0;
		cursor: pointer;
	}
	
	.search button:before {
		content: ">";
		font-weight: bold;
		font-family: FontAwesome;
		font-size: 16px;
		color: #F9F0DA;
	}

</style>


<body onload="showingTime();">

<script type="text/javascript">

	//alert(location.href);
	var locationBeforeLogin = location.href
	var fengstorage = window.sessionStorage;
	if (!locationBeforeLogin.includes("login.html") || !locationBeforeLogin.includes("register.html")) {
		fengstorage.setItem("locationBeforeLogin", locationBeforeLogin);
	}
	//alert(fengstorage.getItem("locationBeforeLogin"));
	
</script>

<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="${root }/index.html">
				<img src="${root }/static-resources/image/logo.gif" width="180" alt="">
			</a>
		</div>
	</div>
	<div class="span9">
<div class="headerAd">
					<img src="${root }/static-resources/image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障">
</div>	</div>
	<div class="span10 last">
		<div class="topNav clearfix">
		<span class="fengmessage">天气：</span><span class="fengmessage" id="showWeather">上海，晴，14℃-21℃</span><span class="fengmessage">&nbsp;&nbsp;|&nbsp;时间：</span><span class="fengmessage" id="showTime"></span>
			<ul>
				<!-- 没有登录的时候，显示下面两个 -->
				<li id="headerLogin" class="headerLogin" style="display: list-item;">
					<a href="${root }/user/login.html">登录</a>|
				</li>
				<li id="headerRegister" class="headerRegister" style="display: list-item;">
					<a href="${root }/user/register.html">注册</a>|
				</li>
				<!-- 登录成功的时候，显示下面两个 -->
				<li id="headerUsername" class="headerUsername">欢迎
				<img style="width: 40px; height: 40px; border-radius: 25px" class="user-pic" src="${sessionScope.user.photo }">
				<font color="red">${sessionScope.user.name }</font></li>
				<li id="headerLogout" class="headerLogout">
					<a href="${root }/user/data/logout.do" >退出</a>|
				</li>
				<li id="headerUserHome">
					<a href="${root }/user/userHome.html">会员中心</a>
					|
				</li>
				<li>
					<a>购物指南</a>
					|
				</li>
				<li>
					<a>关于我们</a>
					
				</li>
			</ul>
		</div>
		<div class="cart">
			<a href="${root }/cart/data/cart.html">购物车</a>
		</div>
			<div class="phone">
				客服热线:
				<strong>15726607618</strong>
			</div>
	</div>
				
	<div class="span24">
		<ul class="mainNav">
			<li id="li-search">
				<div id="li-div-search">
					<div class="search">
						<form id="formForSearch" action="" method="post">
							<input type="text" placeholder="搜索" name="keyWords" value='${keyWords}'>
							<button id="buttonForSubmit" type="submit"></button>
						</form>
					</div>
				</div>
			</li>
		</ul>
		<ul class="mainNav">
			<li>
				<a href="${root }/index.html">首页</a>
				|
			</li>
			<li>
				<a href="${root}/good/showGoodsByCategory_Id.html/0/1">产品分类</a>
<%-- 						<a href="${root }/category/category.html">产品分类</a> --%>
				|
			</li>
			<li>
				<a>定制套餐</a>
				|
			</li>
			<li>
				<a >安全频道</a>
				|
			</li>
			<li>
				<a>商城卡</a>
				|
			</li>
			<li>
				<a >蔬菜基地</a>
				|
			</li>
			<li>
				<a>节气养生</a>
				|
			</li>
			<li>
				<a>便民服务</a>
				|
			</li>
					
		</ul>
	</div>

</div>

<script type="text/javascript" src="${root }/static-resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="${root }/static-resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${root }/static-resources/js/verify.js" ></script>
<script type="text/javascript">

	$( function() {
		
		//修改head.jsp中需要显示的内容：登录后，显示用户名和登出选项。
		if (<%=request.getSession().getAttribute("user")%> != null) {
			$( "#headerUsername" ).css("display", "list-item");
			$( "#headerLogout" ).css("display", "list-item");
			$( "#headerLogin" ).css("display", "none");
			$( "#headerRegister" ).css("display", "none");
		} else {
			$( "#headerUserHome" ).css("display", "none");
			$( "#headerUsername" ).css("display", "none");
			$( "#headerLogout" ).css("display", "none");
			$( "#headerLogin" ).css("display", "list-item");
			$( "#headerRegister" ).css("display", "list-item");
		}
		
	} );
	
	// 退出登录得时候，把sessionStorage得username删除
	$( "a:contains('退出')" ).click( function() {
		sessionStorage.removeItem("username");
	} );
	
	
	$( "#buttonForSubmit" ).click( function() {
		var keyWords = $( "input[name='keyWords']" ).val();
		if ( keyWords == "" ) {
			keyWords = -1;
		}
		/* if ( keyWords == "-1" ) {
			alert($( "input[name='keyWords']" ).val())
		} */
		$( "#formForSearch" ).attr("action", "${root }/good/goodsByFuzzySearch.html/"+keyWords+"/1");
	} );
	if ( $( "input[name='keyWords']" ).val() == "-1" ) {
		$( "input[name='keyWords']" ).val( "" );
	}
	
	
	
	/* var showingTime = function() {
		document.getElementById("showTime").innerHTML = "时间："
	} */
	var showingTime = function() {
		var day = new Date().getDay();
		switch (day) {
			case 0:
				day = "&nbsp;&nbsp;星期日";
			break;
			case 1:
				day = "&nbsp;&nbsp;星期一";
			break;
			case 2:
				day = "&nbsp;&nbsp;星期二";
			break;
			case 3:
				day = "&nbsp;&nbsp;星期三";
			break;
			case 4:
				day = "&nbsp;&nbsp;星期四";
			break;
			case 5:
				day = "&nbsp;&nbsp;星期五";
			break;
			case 6:
				day = "&nbsp;&nbsp;星期六";
			break;
		}
		setInterval(function() {
			//document.getElementById("myTime").innerHTML = new Date();
			document.getElementById("showTime").innerHTML = new Date().toLocaleString() + day;
		}, 10);
		
	}
</script>
</body>
</html>