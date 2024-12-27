<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath }" var="root"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
	<script type="text/javascript" src="${root }/static-resources/js/bayernfeng.js"></script>
	<link href="${root }/static-resources/css/bayernfeng.css" rel="stylesheet" type="text/css"/>

	<script type="text/javascript" src="${root }/static-resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="${root }/static-resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="${root }/static-resources/js/verify.js" ></script>

	<link href="${root }/static-resources/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${root }/static-resources/css/login.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="${root }/static-resources/css/verify.css">






<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.3"></script>
<script type="text/javascript">
        function load() {
            var map = new BMap.Map("container");
            var point = new BMap.Point(113.67312,34.758085); //默认中心点
            var marker = new BMap.Marker(point);
            var opts = {
                width: 250,     // 信息窗口宽度  
                height: 100,     // 信息窗口高度  
                //title: "信息窗口标题"  // 信息窗口标题  
            }
			
			// 创建窗口信息对象。
            //var infoWindow = new BMap.InfoWindow("这里显示提示信息", opts);
 
 
            marker.enableDragging(); //启用拖拽
            marker.addEventListener("dragend", function (e) {
                point = new BMap.Point(e.point.lng, e.point.lat); //标记坐标（拖拽以后的坐标）
                marker = new BMap.Marker(point);
 
                document.getElementByIdx_x("lng").value = e.point.lng;
                document.getElementByIdx_x("lat").value = e.point.lat;
                infoWindow = new BMap.InfoWindow("当前位置<br />经度：" + e.point.lng + "<br />纬度：" + e.point.lat, opts);
 
                map.openInfoWindow(infoWindow, point);
            })
 
            map.addControl(new BMap.NavigationControl()); //左上角控件
            map.enableScrollWheelZoom(); //滚动放大
            map.enableKeyboard(); //键盘放大
 
            map.centerAndZoom(point, 13); //绘制地图
            map.addOverlay(marker); //标记地图
 
			// 打开信息窗口，infoWindow是创建窗口信息对象的信息
            //map.openInfoWindow(infoWindow, map.getCenter());
			
			// 打开信息窗口
			map.openInfoWindow(map.getCenter());
        }
         
</script>
<style type="text/css">
	html{height: 100%;}
	body{height: 50%;margin: 0px;padding: 0px;}
	#container{width:550px;height: 460px;}
</style>



</head>
<body onload="load(); countDown();" style="background-image: url('/photosOfUsers/05e80d1777.jpg');">

	username: <input id="username" type="text"></input><span id="spanUsername"></span><br><br>
	password: <input id="password" type="password"></input><span id="spanPassword"></span>
	
	<h1>文件上传</h1>
	<form enctype="multipart/form-data" style="display: block;" id="modifyPhotoForm" action="fengupload.do" method="post">
		<input id="modifyPhoto" name="modifyPhoto" type="file">
		<input id="modifyPhotoButton" type="submit" value="修改头像">
	</form>
	
	<hr>
	
	男：<input id="sexOfUserMale" class="userSex" name="userSex" type="radio" value="male">
	女：<input id="sexOfUserFemale" class="userSex" name="userSex" type="radio" value="female"><br>
	
	<script type="text/javascript">
	
	var usernameFlag = false;
	$( "#username" ).blur( function() {
		
		var reg = /^1[3|4|5|7|8][0-9]{9}$/;
		var username = $( "#username" ).val();
		usernameFlag = reg.test(username);
		// 符合
		if (usernameFlag) {
			$( "#spanUsername" ).html("<font color='green'>√</font>");
		} else {
			$( "#spanUsername" ).html("<font color='red'>×</font>");
		}
	} );
	
	
	$( "#spanUsername" ).html("jiangfeng");
	$( "#spanPassword" ).html("jiangfeng");
	
	$( ":radio" ).click( function() {
		alert("ffff")
	} );
	
	
	// 修改性别
	$( "#sexOfUserMale" ).click( function() {
		alert("111")
	} );
	$( "#sexOfUserFemale" ).click( function() {
		alert("222")
	} );
</script>
	
	
	
	
	
	
	<div id="container"></div>
	
	
	
	
	
	
已经付款成功，即将转到个人中心。<br>
<input type="button" value="点击2秒钟后" onclick="doTimeOut();"><br>
<input type="button" value="点击倒计时" onclick="countDown();"><span id="count">3</span>秒后跳转到个人中心。。。<br>
<script type="text/javascript">

	var doTimeOut = function() {
		setTimeout(function() {
			alert("两秒钟结束");
		}, 2000);
		
	}
	
	// 计时器
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
			location.href = "http://www.baidu.com";
			// 结束执行函数doCountDown
			clearInterval(timecount);
			return;
		}
		document.getElementById("count").innerHTML = i;
	}
	
</script>
	
</body>



</html>