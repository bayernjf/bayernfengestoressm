<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set value="${pageContext.request.contextPath }" var="root"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

	<script type="text/javascript" src="${root }/static-resources/js/jquery-3.5.1.js"></script>

	<link type="text/css" rel="stylesheet"  href="${root }/static-resources/css/basic.css">
 	<link type="text/css" rel="stylesheet"  href="${root }/static-resources/css/web.css">

</head>
<body onload="countDown();" style="background-image: url('/photosOfUsers/05e80d1777.jpg');">

<!-- 进入此页面，说明已经付款成功，则利用异步，更新数据库 -->
<input id="orderId" type="hidden" value="${sessionScope.orderId }">
<script type="text/javascript">
	var orderId = $( "#orderId" ).val();
	//alert("orderId : " + orderId)
	$.ajax( {
		url: "${root}/order/data/updateStatOfOrder.do",
		type: "post",
		dataType: "json",
		data: { "orderId": orderId, "stat": 2 },
		success: function( result ) {
			//alert( result.code )
			if ( result.code == 1 ) {
				alert("订单已付款成功")
			}
		}
	} );
</script>

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
			<span class="line line2 line_active2"></span>
		</li>
		<li class="last">
			<span class="but but_active">3</span>
			<span class="txt txt_active">已完成</span>
		</li>
	</ul>
</div>
<!--订单支付路径结束-->


已经付款成功，即将转到个人中心。<br>
<font size="5" color="red" id="count">3</font>秒后......跳转到<a href="${root }/user/userHome.html"><font color="blue">个人中心</font></a><br>
<script type="text/javascript">

	var root = location.pathname.split("/")[1];

	//计时器
	var timecount;
	var i;
	var countDown = function() {
		// 重复执行函数doCountDown
		timecount = setInterval(doCountDown, 1000);
		i = 3;
	}
	var doCountDown = function() {
		i--;
		if (i == 0) {
			//location.href = "/"+root+"/user/userHome.html";
			// 结束执行函数doCountDown
			clearInterval(timecount);
			return;
		}
		document.getElementById("count").innerHTML = i;
	}
	
</script>
</body>
</html>