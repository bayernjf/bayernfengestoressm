<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${pageContext.request.contextPath }" var="root"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员中心</title>
	<script type="text/javascript" src="${root }/static-resources/js/bayernfeng.js"></script>
	<link href="${root }/static-resources/css/bayernfeng.css" rel="stylesheet" type="text/css"/>
	
	<script type="text/javascript" src="${root }/static-resources/js/jquery-3.5.1.js"></script>
	
	<link href="${root }/static-resources/css/cart.css" rel="stylesheet" type="text/css">
	
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
	
		<audio controls>
			<!-- <source src="horse.ogg" type="audio/ogg"> -->
			<source src="/fengmusic/River Flows In You - 李闰珉.mp3" type="audio/mpeg">
		</audio>
<!-- 		<audio autoplay="autoplay" controls>
			<source src="horse.ogg" type="audio/ogg">
			<source src="/fengmusic/River Flows In You - 李闰珉.mp3" type="audio/mpeg">
		</audio> -->
	
		<div>
			注册时间：<font size="5" color="red"><fmt:formatDate value="${user.registertime }" pattern="yyyy-MM-dd hh:mm:ss"/></font><br>
			登录时间：<font size="5" color="red"><fmt:formatDate value="${user.logintime }" pattern="yyyy-MM-dd hh:mm:ss"/></font><br>
			<font size="5" color="blue">accountName(username) -> </font>
			<img id="photoOfUser" style="width: 40px; height: 40px; border-radius: 25px; cursor: pointer;" class="user-pic" src="${sessionScope.user.photo }">
			
			<font id="toModifyUsername" size="5" color="red" style="cursor: pointer;">${user.username }</font>
			<!-- <form style="display: none;" id="modifyPhotoForm">
				<input id="modifyPhoto" name="modifyPhoto" type="file">
				<input id="modifyPhotoButton" type="button" value="修改头像">
			</form> -->
			<span style="display: none" id="spanToModifyUsername"><font color="green">点击修改账号</font></span>
			<span style="display: none" id="spanPhotoOfUser"><font color="green">点击头像修改</font></span>
			<br>
			<form enctype="multipart/form-data" style="display: none;" id="modifyPhotoForm" action="${root }/user/data/fengupload.do" method="post">
				<input id="modifyPhoto" name="modifyPhoto" type="file">
				<input id="modifyPhotoButton" type="submit" value="修改头像">
			</form>
			
			<font style="cursor: pointer;" id="fontEmail" size="5" color="blue">email -> </font>
			<font id="toModifyEmail" style="cursor: pointer;" size="5" color="red">${user.email }</font>
			<span style="display: none" id="spanToModifyEmail"><font color="green">点击修改邮箱</font></span>
			<br>
			
			<font style="cursor: pointer;"  id="fontPhone" size="5" color="blue">phone -> </font>
			<font id="toModifyPhone" style="cursor: pointer;" size="5" color="red">${user.phone }</font>
			<span style="display: none" id="spanToModifyPhone"><font color="green">点击修改手机号</font></span>
			<br>
			
			<font size="5" color="blue">alias(name可改) -> </font>
			<font id="toModifyName" style="cursor: pointer;" size="5" color="red">${user.name }</font>
			<span style="display: none" id="spanToModifyName"><font color="green">点击昵称修改</font></span>
			<br>
			
			<font size="5" color="blue">birthday -> </font>
			<font id="userBirthday" size="5" color="red"><fmt:formatDate value="${user.birthday }" pattern="yyyy-MM-dd"/></font>
			<input type="date" id="birthday" name="birthday"><br>
			
			<font size="5" color="blue">sex -> </font>
			<select id="sexOfUserSelect" name="sexOfUser">
				<option value="-1">---修改性别---</option>
				<option value="male">男</option>
				<option value="female">女</option>
			</select>
			<font id="sexOfUser" size="5" color="red">${user.sex }</font><br>
			<span>修改密码：</span>
			<input class="bayernfeng-vali"
				oninput="valiPassword(this); bayernjiangfeng(this);" 
				onblur="valiPassword(this); bayernjiangfeng(this);"
				placeholder="至少一个字母和数字,3~8" type="password" id="password" name="password" class="text" maxlength="20" autocomplete="off">
			<button id="confirmToModifyPassword">确认修改</button>
		</div>
		<div>
			<!-- 点击默认收货地址的时候，动态显示 -->
			默认收货地址：<font size="5" id="spanuserdefaultAddresss"></font>
		</div>
		<br><br>
		<h4>我的订单：</h4>
		<ol>
			<li><a href="${root }/order/userOrders.html"><font class="fengorder" color="Chocolate">待付款</font></a></li>&nbsp;
			<li><a href="${root }/order/userOrders.html"><font class="fengorder" color="Indigo">待发货</font></a></li>&nbsp;
			<li><a href="${root }/order/userOrders.html"><font class="fengorder" color="BurlyWood">待收货</font></a></li>&nbsp;
			<li><a href="${root }/order/userOrders.html"><font class="fengorder" color="CadetBlue">待评价</font></a></li>&nbsp;
			<li><a href="${root }/order/userOrders.html"><font class="fengorder" color="GreenYellow">退款</font></a></li>
		</ol>
		<input id="user_id" type="hidden" value="${sessionScope.user.id }">
		<div class="span24">
			<div class="step step1">
			</div>
			<table id="jiangfengkx">
				<tbody id="addressesOfUser">
					<tr id="toBeCounted">
						<th><input id="AllChecks" type="checkbox"></th>
						<th>收货地址</th>
						<th>设置默认地址</th>
						<th>修改</th>
						<th>删除</th>
					</tr>
					<!-- <tr>
						<td><input type="checkbox"></td>
						<td>安徽 蚌埠 龙子湖区 治淮路淮委东大院3单元 姜峰 18211111111</td>
						<td><input type="radio" name="defaultAddress"></td>
						<td style="cursor: pointer;">修改</td>
						<td style="cursor: pointer;">删除</td>
					</tr> -->
				</tbody>
			</table>
			<div class="bottom">
				<a><span onclick="deleteSelectedAddresss();" id="deleteSelected" style="cursor: pointer;">删除已选中</span></a>
				<a><span id="addNewAddress" style="cursor: pointer;">添加新地址</span></a>
			</div>
		</div>
		<!-- 添加 -->
		<div id="editAddress" style="display: none;">
			<div><font color="red">添加</font></div>
			省：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="province" name="province">
				<option value="-1">---请选择省---</option>
				<!-- <option value="1">jiang</option> -->
			</select><br><br>
			市：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="city" name="city"><br>
				<option value="-1">---请选择市---</option>
				<!-- <option value="11">jiang</option> -->
			</select><br><br>
			区：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="district" name="district">
				<option value="-1">---请选择区---</option>
				<!-- <option value="111">jiang</option> -->
			</select><br><br>
			详细地址：<input id="detailOfAddress" type="text" name="detailOfAddress"><br><br>
			联系人：&nbsp;&nbsp;&nbsp;<input id="consignee" type="text" name="consignee"><br><br>
			联系电话：<input id="phone" type="text" name="phone"><br><br>
			<input id="submitTheAddresss" type="button" value="添加">
		</div>
		<!-- 修改 -->
		<div id="modifyTheAddresss" style="display: none;">
			<div><font color="red">修改</font></div>
			省：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="province2" name="province2">
				<option value="-1">---请选择省---</option>
				<!-- <option value="1">jiang</option> -->
			</select><br><br>
			市：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="city2" name="city2">
				<option value="-1">---请选择市---</option>
				<!-- <option value="11">jiang</option> -->
			</select><br><br>
			区：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select id="district2" name="district2">
				<option value="-1">---请选择区---</option>
				<!-- <option value="111">jiang</option> -->
			</select><br><br>
			详细地址：<input id="detailOfAddress2" type="text" name="detailOfAddress2"><br><br>
			联系人：&nbsp;&nbsp;&nbsp;<input id="consignee2" type="text" name="consignee2"><br><br>
			联系电话：<input id="phone2" type="text" name="phone2"><br><br>
			<input id="submitToModifyTheAddresss" type="button" value="修改">
		</div>
	</div>
	
	<jsp:include page="foot.jsp"/>
	
<script type="text/javascript">

	// cookie的值不要有“;”
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
	// 先从cookie中拿到地址JSON对象
	var addressesOfUser = {  };
	if (getCookie(userAddr) != "") {
		addressesOfUser = JSON.parse(getCookie(userAddr));
	}
	
	// 遍历显示到地址table中
	if ( JSON.stringify(addressesOfUser) != "{}" ) {
		$( "#hasNothing" ).remove();
		$.each( addressesOfUser, function( key, thiz ) {
			var provinceName = thiz.province.split(",")[1];
			var cityName = thiz.city.split(",")[1];
			var districtName = thiz.district.split(",")[1];
			var detailOfAddress = thiz.detailOfAddress;
			var consignee = thiz.consignee;
			var phone = thiz.phone;
			var defaultStat = thiz["default"];
			var fengtd = "";
			if (defaultStat == 1) {
				fengtd = "<input checked id='defaultAddress"+key+"' type='radio' name='defaultAddress'>";
			} else {
				fengtd = "<input id='defaultAddress"+key+"' type='radio' name='defaultAddress'>";
			}
			var address = "\
				<tr id='address"+key+"'>\
					<td><input id='fengcheck"+key+"' name='fengcheck' type='checkbox'></td>\
					<td>"+provinceName+" "+cityName+" "+districtName+" "+detailOfAddress+" "+consignee+" "+phone+"</td>\
					<td>"+fengtd+"</td>\
					<td id='modify"+key+"' onclick='modifyTheAddresss(this);' style='cursor: pointer;'>修改</td>\
					<td id='delete"+key+"' onclick='deleteTheAddresss(this);' style='cursor: pointer;'>删除</td>\
				</tr>\
			";
			$( "#addressesOfUser" ).append( address );
		} );
	} else {
		var address = "\
			<tr id='hasNothing'>\
				<td align='center' colspan='5'>还没有任何地址</td>\
			</tr>\
		";
		$( "#addressesOfUser" ).append( address );
	}
	
	// 显示默认地址
	function showDefaultAddress() {
		var defaultAddress = "";
		// 遍历cookie里的地址，找到默认的地址显示，否则显示“还未有默认地址”
		$( "#spanuserdefaultAddresss" ).empty();
		if ( getCookie(userAddr) != "" ) {
			var addresses = JSON.parse( getCookie(userAddr) );
			var defaultKey = "";
			
			var provinceName;
			var cityName;
			var districtName;
			var detailOfAddress;
			var consignee;
			var phone;
			var defaultStat;
			
			for (key in addresses) {
				if ( addresses[key]["default"] == 1 ) {
					defaultKey = key;
					provinceName = addresses[defaultKey].province.split(",")[1];
					cityName = addresses[defaultKey].city.split(",")[1];
					districtName = addresses[defaultKey].district.split(",")[1];
					detailOfAddress = addresses[defaultKey].detailOfAddress;
					consignee = addresses[defaultKey].consignee;
					phone = addresses[defaultKey].phone;
					defaultStat = addresses[defaultKey]["default"];
				}
			}
			
			if (defaultStat == 1) {
				defaultAddress = provinceName + " " + cityName + " " + districtName + " " + detailOfAddress + " " + consignee + " " + phone;
				/* // 把默认地址key存放在session里
				sessionStorage.setItem("keyOfDefaultAddress", defaultKey); */
				// 把默认地址key存放在cookie中
				var key = "keyOfDefaultAddress" + sessionStorage.getItem("username");
				setCookie(key, defaultKey, 10);
			} else {
				defaultAddress = "还没有默认地址，请设置";
				var key = "keyOfDefaultAddress" + sessionStorage.getItem("username");
				setCookie(key, null, 10);
			}
			$( "#spanuserdefaultAddresss" ).html( "<font color='red'>"+defaultAddress+"</font>" );
		} else {
			$( "#spanuserdefaultAddresss" ).html( "<font color='red'>还没有地址</font>" );
		}
		
	}
	showDefaultAddress();
	
	// 删除地址
	function deleteTheAddresss(thiz) {
		if ( confirm( "确认删除？" ) ) {
			//alert(thiz.id)
			var key = thiz.id.substring("delete".length)
			//alert(key)
			// 删除行
			$( "#"+key ).remove();
			// 如果该地址是默认地址，需要把session里的key设置成null
			if (addressesOfUser[key]["default"] == 1) {
				sessionStorage.setItem("keyOfDefaultAddress", null);
			}
			// 删除cookie中的地址
			addressesOfUser[key] = undefined;
			// 更新cookie中的地址
			setCookie(userAddr, JSON.stringify(addressesOfUser), 10);
			// 刷新
			location.href = "${root}/user/userHome.html";
		}
	}
	
	var toBeModifiedAddressesArr = [];
	// 提交修改并同步到地址table中
	$( "#submitToModifyTheAddresss" ).click( function( event ) {
		//alert(toBeModifiedAddressesArr[0] + " -> " + JSON.stringify(toBeModifiedAddressesArr[1]))
		var key = toBeModifiedAddressesArr[0];
		var userAddress = toBeModifiedAddressesArr[1];
		var provinceId = $( "#province2" ).val();
		var provinceName = $( "#province2 option:selected" ).text();
		var cityId = $( "#city2" ).val();
		var cityName = $( "#city2 option:selected" ).text();
		var districtId = $( "#district2" ).val();
		var districtName = $( "#district2 option:selected" ).text();
		var detailOfAddress = $( "#detailOfAddress2" ).val();
		var consignee = $( "#consignee2" ).val();
		var phone = $( "#phone2" ).val();
		// 地区代号；地区名
		userAddress["province"] = provinceId + "," + provinceName;
		userAddress["city"] = cityId + "," + cityName;
		userAddress["district"] = districtId + "," + districtName;

		userAddress["detailOfAddress"] = detailOfAddress;
		// 联系人
		userAddress["consignee"] = consignee;
		userAddress["phone"] = phone;
		addressesOfUser[key] = userAddress;
		// 更新cookie中的地址
		setCookie(userAddr, JSON.stringify(addressesOfUser), 10);
		location.href = "${root}/user/userHome.html";
		
	} );
	// 切换显示修改地址选项
	function modifyTheAddresss(thiz) {
		
		//alert(thiz.id)
		var key = thiz.id.substring("modify".length);
		//alert(key)
		// 切换显示修改选项，并且需要显示修改的内容
		if ( $( "#modifyTheAddresss" ).css("display") == "none" ) {
			$( "#modifyTheAddresss" ).css("display", "block");
			// 隐藏添加选项
			$( "#editAddress" ).css("display", "none");
		} else {
			$( "#modifyTheAddresss" ).css("display", "none");
		}
		var addresses = JSON.parse(getCookie(userAddr));
		var toBeModified = addresses[key];
		//alert(JSON.stringify(toBeModified))
		var province2Value = toBeModified.province.split(",")[0];
		var city2Value = toBeModified.city.split(",")[0];
		var district2Value = toBeModified.district.split(",")[0];
		var detailOfAddress2 = toBeModified.detailOfAddress;
		var consignee2 = toBeModified.consignee;
		var phone2 = toBeModified.phone;
		
		// 显示被修改的内容
		$( "#province2 option[value='"+province2Value+"']" ).attr("selected", "selected");
		$( "#city2" ).children( "option:not(:first)" ).remove();
		$( "#district2" ).children( "option:not(:first)" ).remove();
		var cities = fengAddress[province2Value]["cities"];
		$.each( cities, function( key, thiz ) {
			$( "#city2" ).append( "<option value='"+key+"'>"+thiz.cityName+"</option>" );
		} );
		var districts = fengAddress[province2Value]["cities"][city2Value]["districts"];
		$.each( districts, function( key, thiz ) {
			$( "#district2" ).append( "<option value='"+key+"'>"+thiz+"</option>" );
		} );
		
		$( "#city2 option[value='"+city2Value+"']" ).attr("selected", "selected");
		$( "#district2 option[value='"+district2Value+"']" ).attr("selected", "selected");
		
		//alert(province2Value + ", " + city2Value + ", " + district2Value);
		
		$( "#detailOfAddress2" ).val( detailOfAddress2 );
		$( "#consignee2" ).val( consignee2 );
		$( "#phone2" ).val( phone2 );
		
		
		// 拿到即将被修改的地址
		toBeModifiedAddressesArr[0] = key;
		toBeModifiedAddressesArr[1] = toBeModified;
		
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
	
	// 删除已选中
	function deleteSelectedAddresss() {
		var $checks = $( "input[name='fengcheck']:not(#AllChecks):checked" );
		if ( $checks.size() > 0 ) {
			if ( confirm( "确认删除？" ) ) {
				var addresses = JSON.parse(getCookie(userAddr));
				$.each( $checks, function( index, thiz ) {
					var key = thiz.id.substring("fengcheck".length);
					/* // 如果删除的是默认的地址，自动把默认的地址设置成另一个
					if ( addresses[key]["default"] == 1 ) {
						alert($checks[0]["default"])
					} */
// *******************************************上面的自动设置默认地址的不做了。当支付的时候，
// 如果没有默认地址，则需要选择地址以后才能进行付款
					// 删除
					addresses[key] = undefined;
					// 更新cookie里的地址
					setCookie(userAddr, JSON.stringify(addresses), 10);
					// 删除当前行
					$( "#address"+key ).remove();
				} );
			}
		} else {
			alert( "还没选中任何地址" );
		}
		
	}
	
	// 设置默认地址
	$( ":radio" ).click( function() {
		//alert(JSON.stringify(addressesOfUser))
		// 设置默认地址的时候，显示到默认地址栏
		var defaultKey = "";
		$.each( $( ":radio" ), function( index, thiz ) {
			var key = thiz.id.substring("defaultAddress".length);
			// 修改被选中的key的地址的default属性值1
			if ( thiz.checked ) {
				defaultKey = key;
				addressesOfUser[key]["default"] = 1;
				// 更新cookie中的地址
				setCookie(userAddr, JSON.stringify(addressesOfUser), 10);
			} else { // 否则0
				addressesOfUser[key]["default"] = 0;
				setCookie(userAddr, JSON.stringify(addressesOfUser), 10);
			}
		} );
		showDefaultAddress();
	} );
	
	// 点击添加地址，显示出地址选择
	$( "#addNewAddress" ).click( function() {
		// 最多只能有用十个地址
		if ( $( "#toBeCounted" ).siblings().size() > 9 ) {
			alert("最多只能添加十条地址，请修改或删除一些地址")
		} else {
			//alert(typeof($( "#editAddress" ).css("display")))
			if ( $( "#editAddress" ).css("display") == "none" ) {
				$( "#editAddress" ).css("display", "block");
				// 隐藏修改选项
				$( "#modifyTheAddresss" ).css("display", "none");
			} else {
				$( "#editAddress" ).css("display", "none");
			}
		}
	} );
	
	// 用户提交地址的时候，使用JSON
	// 然后作为json格式的字符串存放在数据库
	/*
		{
			"province":"34,安徽",
			"city":"3403,蚌埠",
			"district":"340301,龙子湖区",
			"detailOfAddress":"治淮路119号三
		}
	*/
	// 错误否则在不刷新的情况下，添加多次，最后刷新前面的数据都是最后添加的数据
	//var userAddress = {  };
	$( "#submitTheAddresss" ).click( function() {
		var userAddress = {  };
		var provinceId = $( "#province" ).val();
		var provinceName = $( "#province option:selected" ).text();
		var cityId = $( "#city" ).val();
		var cityName = $( "#city option:selected" ).text();
		var districtId = $( "#district" ).val();
		var districtName = $( "#district option:selected" ).text();
		var detailOfAddress = $( "#detailOfAddress" ).val();
		var consignee = $( "#consignee" ).val();
		var phone = $( "#phone" ).val();
		
		if ( !isPhoneNumber( phone ) ) {
			alert( "手机号不符合条件" );
			return false;
		}
		if ( detailOfAddress == "" ) {
			alert( "详细地址不能为空" );
			return false;
		}
		if ( consignee == "" ) {
			alert( "联系人不能为空" );
			return false;
		}
		// 地区代号；地区名
		userAddress["province"] = provinceId + "," + provinceName;
		userAddress["city"] = cityId + "," + cityName;
		userAddress["district"] = districtId + "," + districtName;

		// 只是地区代号
		//userAddress["province"] = provinceId;
		//userAddress["city"] = cityId;
		//userAddress["district"] = districtId;
		
		userAddress["detailOfAddress"] = detailOfAddress;
		// 联系人
		userAddress["consignee"] = consignee;
		userAddress["phone"] = phone;
		
		// 标记是否是默认地址，0则不是
		userAddress["default"] = 0;
		//alert( $( "#province" ).val() );
		//alert( $( "#province option:selected" ).val() );
		//alert( $( "#province option:selected" ).text() );
		
		var key = uuid();
		// 添加新地址到table
		var newAddress = "\
			<tr id='"+key+"'>\
				<td><input type='checkbox'></td>\
				<td>"+provinceName+" "+cityName+" "+districtName+" "+detailOfAddress+" "+consignee+" "+phone+"</td>\
				<td><input id='defaultAddress"+key+"' type='radio' name='defaultAddress'></td>\
				<td style='cursor: pointer;'>修改</td>\
				<td id='delete"+key+"' onclick='deleteTheAddresss(this);' style='cursor: pointer;'>删除</td>\
			</tr>\
		";
		$( "#addressesOfUser" ).append( newAddress );
		
		$( "#hasNothing" ).remove();
		
		// 然后把地址放到cookie中的地址对象中
		// 调用uuid函数，返回一个key
		//alert(key+":userAddress -> " + JSON.stringify(userAddress))
		addressesOfUser[key] = userAddress;
		//alert(key+":addressesOfUser -> " + JSON.stringify(addressesOfUser))
		// 更新cookie中的地址
		setCookie(userAddr, JSON.stringify(addressesOfUser), 10);
		// 刷新一下吧。。。。目前最简单的解决方法。因为在table里的地址
		// 是从cookie中拿到的，对于刚添加的地址还没有重新从cookie拿到，只是存在了cookie中。所有设置默认或者修改，删除无效果
		// 刷新
		location.href = "${root}/user/userHome.html";
	} );
	
	// 从数据库拿到用户的所有收货地址，然后存到cookie中（cookie的地址改变，同步到数据库）
	

	/* var fengAddress = {
		1: { provinceName: "安徽", cities: { 
			11: { cityName: "蚌埠", districts: {
				111: "龙子湖区",
				112: "蚌山区"
			} },
			12: { cityName: "合肥", districts: {
				121: "蜀山区",
				122: "瑶海区"
			} },
		} },
		2: { provinceName: "上海", cities: { 
			21: { cityName: "上海", districts: {
				211: "黄浦区",
				212: "闵行区"
			} },
		} },
		3: { provinceName: "江苏", cities: { 
			31: { cityName: "南京", districts: {
				311: "玄武区",
				312: "浦口区"
			} },
			32: { cityName: "苏州", districts: {
				321: "姑苏区",
				322: "吴中区"
			} }
		} }
	}; */
	var fengAddress = {  };
	// 从数据库获得地址数据：“数据结构”和上面的fengAddress必须一致！
	// 优化：获取前判断cookie中有没有地址信息，如果没有，从数据库获得
	// 暂且不做优化
	$.ajax( {
		url: "${root}/address/getAllAddresses.do",
		type: "post",
		dataType: "json",
		success: function( result ) {
			
			/*
			[	
				{
					"childrenProvinces":[
						{
							"childrenProvinces":[
								{
									"cityName":"请选择",
									"codeid":910101
								},
								{
									"cityName":"市辖区",
									"codeid":910102
								},
								{
									"cityName":"澳门特区",
									"codeid":910103
								}
							],
							"cityName":"澳门",
							"codeid":9101
						}
					],
					"cityName":"澳门",
					"codeid":91
				}
			],
				
				
				*/
			
			if ( result.code == 1 ) {
				//alert(JSON.stringify(result.msg));
				//alert(result.msg.codeid)
				$.each( result.msg, function( key, thiz ) {
					//alert(JSON.stringify(thiz.childrenProvinces[key]))
					//alert(thiz.codeid)
					var fengCities = {  };
					$.each( thiz.childrenProvinces, function( key2, thiz2 ) {
						//alert(JSON.stringify(thiz2))
						var fengDistricts = {  };
						$.each( thiz2.childrenProvinces, function( key3, thiz3 ) {
							fengDistricts[thiz3.codeid] = thiz3.cityName;
						} );
						fengCities[thiz2.codeid] = {
								cityName: thiz2.cityName,
								districts: fengDistricts
						};
					} );
					fengAddress[thiz.codeid] = {
						provinceName: thiz.cityName,
						cities: fengCities
					};
				} );
				// 对比下面的代码，后执行该行代码
				//alert("1111111111111111"+JSON.stringify(fengAddress))
				// 非常重要
				jiangfengjiang();
				// 显示拿到的数据在修改的地址下拉栏中
				jiangfengjiang2();
			} else {
				alert(result.msg);
			}
		}
	} );
	
	// 对比上面的代码，先执行该行代码
	//alert("222222222222222222222"+JSON.stringify(fengAddress))
	
	function showDistrict() {
		//alert( $( "#province" ).val() );
		//alert(JSON.stringify(fengAddress));
		// 当province的值改变的时候，遍历city
		// 先清空城市选项
		//$( "#city" ).empty();		
		$( "#district" ).children( "option:not(:first)" ).remove();		
		var districts = fengAddress[$( "#province" ).val()]["cities"][$( "#city" ).val()]["districts"];
		$.each( districts, function( key, thiz ) {
			$( "#district" ).append( "<option value='"+key+"'>"+thiz+"</option>" );
		} );
		
		// 修改的时候，根据需要修改的内容，先做显示
		$( "#district option[value='340301']" ).attr("selected", "selected");
	}
	
	function showCity() {
		//alert( $( "#province" ).val() );
		//alert(JSON.stringify(fengAddress));
		// 当province的值改变的时候，遍历city
		// 先清空城市选项
		//$( "#city" ).empty();		
		$( "#city" ).children( "option:not(:first)" ).remove();
		$( "#district" ).children( "option:not(:first)" ).remove();
		var cities = fengAddress[$( "#province" ).val()]["cities"];
		$.each( cities, function( key, thiz ) {
			$( "#city" ).append( "<option value='"+key+"'>"+thiz.cityName+"</option>" );
		} );
		
		// 修改的时候，根据需要修改的内容，先做显示
		$( "#city option[value='3403']" ).attr("selected", "selected");
	}
	
	$( "#city" ).change( showDistrict );
	
	$( "#province" ).change( showCity );
	
	function jiangfengjiang() {
		$.each( fengAddress, function( keyIfObj, thiz ) {
			//alert("keyIfObj: " + keyIfObj + " -> thiz(当前值): " + JSON.stringify(thiz))
			$( "#province" ).append( "<option value='"+keyIfObj+"'>"+thiz.provinceName+"</option>" );
		} );
		
		// 修改的时候，根据需要修改的内容，先做显示
		$( "#province option[value='34']" ).attr("selected", "selected");
		showCity();
		showDistrict();
	}
	
	
	// 修改的地址下拉栏$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
	
	function showDistrict2() {
		//alert( $( "#province" ).val() );
		//alert(JSON.stringify(fengAddress));
		// 当province的值改变的时候，遍历city
		// 先清空城市选项
		//$( "#city" ).empty();		
		$( "#district2" ).children( "option:not(:first)" ).remove();		
		var districts = fengAddress[$( "#province2" ).val()]["cities"][$( "#city2" ).val()]["districts"];
		$.each( districts, function( key, thiz ) {
			$( "#district2" ).append( "<option value='"+key+"'>"+thiz+"</option>" );
		} );
	}
	
	function showCity2() {
		//alert( $( "#province" ).val() );
		//alert(JSON.stringify(fengAddress));
		// 当province的值改变的时候，遍历city
		// 先清空城市选项
		//$( "#city" ).empty();		
		$( "#city2" ).children( "option:not(:first)" ).remove();
		$( "#district2" ).children( "option:not(:first)" ).remove();
		var cities = fengAddress[$( "#province2" ).val()]["cities"];
		$.each( cities, function( key, thiz ) {
			$( "#city2" ).append( "<option value='"+key+"'>"+thiz.cityName+"</option>" );
		} );
	}
	
	$( "#city2" ).change( showDistrict2 );
	
	$( "#province2" ).change( showCity2 );
	
	function jiangfengjiang2() {
		$.each( fengAddress, function( keyIfObj, thiz ) {
			//alert("keyIfObj: " + keyIfObj + " -> thiz(当前值): " + JSON.stringify(thiz))
			$( "#province2" ).append( "<option value='"+keyIfObj+"'>"+thiz.provinceName+"</option>" );
		} );
		
		showCity2();
		showDistrict2();
	}
	
	// 修改的地址下拉栏$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
	
	var fengArr = [1, 3, 4, "fengjiang", {1:2}];
	$.each( fengArr, function( indexIfArr, thiz ) {
		//alert("indexIfArr: " + indexIfArr + " -> thiz(当前值): " + thiz)
	} );
	
	
	
	// 从数据库拿到的用户生日
	//$( "#birthday" ).val( "2008-08-08" );
	$( "#birthday" ).val( $( "#userBirthday" ).text() )
	// 生日的修改
	$( "#birthday" ).change( function() {
		//alert( $( "#birthday" ).val() )
		$( "#userBirthday" ).text( $( "#birthday" ).val() );
		// 更新到数据库
		var sendData = { 
				id: $( "#userId" ).val(),
				username: $( "#userUsername" ).val(),
				password: $( "#userPassword" ).val(),
				birthday: $( "#userBirthday" ).text(),
				sex: $( "#userSex" ).val(),
				photo: $( "#userPhoto" ).val(),
				name: $( "#userName" ).val(),
				stat: 1,
				email: $( "#userEmail" ).val(),
				phone: $( "#userPhone" ).val()
		};
		$.ajax( {
			url: "${root}/user/data/updateUser.do",
			type: "post",
			dataType: "json",
			data: sendData,
			success: function( result ) {
				if ( result.code == 1 ) {
					//alert("修改成功");
					alert(result.msg);
					// 跳转到对应的controller来更新session里的user信息
					location.href = "${root}/user/data/modifyUserInSession.do";
				} else {
					alert("修改失败");
				}
			}
		} );
	} );
	
	
	
	
	
	$( "#photoOfUser" ).hover( function() {
		if ( $( "#spanPhotoOfUser" ).css("display") == "none" ) {
			$( "#spanPhotoOfUser" ).css("display", "inline");
		} else {
			$( "#spanPhotoOfUser" ).css("display", "none");
		}
	} );
	// 头像修改
	$( "#photoOfUser" ).click( function() {
		if ( $( "#modifyPhotoForm" ).css("display") == "none" ) {
			$( "#modifyPhotoForm" ).css("display", "block");
		} else {
			$( "#modifyPhotoForm" ).css("display", "none");
		}
	} );
	/* $( "#modifyPhotoButton" ).click( function() {
		alert("修改");
	} ); */
	
	
	
	// 修改性别
	$( "#sexOfUserSelect" ).change( function() {
		//alert($(this).val())
		var sex = $(this).val();
		if ( sex != "-1" ) {
			//alert($(this).val())
			$( "#sexOfUser" ).text( sex );
			// 很重要，隐藏的input，更新时需要用到
			$( "#userSex" ).val( sex );
			// 更新到数据库
			var sendData = { 
					id: $( "#userId" ).val(),
					username: $( "#userUsername" ).val(),
					password: $( "#userPassword" ).val(),
					birthday: $( "#userBirthday" ).text(),
					sex: $( "#userSex" ).val(),
					photo: $( "#userPhoto" ).val(),
					name: $( "#userName" ).val(),
					stat: 1,
					email: $( "#userEmail" ).val(),
					phone: $( "#userPhone" ).val()
			};
			$.ajax( {
				url: "${root}/user/data/updateUser.do",
				type: "post",
				dataType: "json",
				data: sendData,
				success: function( result ) {
					if ( result.code == 1 ) {
						//alert("修改成功");
						alert(result.msg);
						// 跳转到对应的controller来更新session里的user信息
						location.href = "${root}/user/data/modifyUserInSession.do";
					} else {
						alert("修改失败");
					}
				}
			} );
		}
	} );
	
	
	
	
	// 重置密码，若成功，此时需要跳转到登录页面
	var passwordCanBeModified = false;
	function bayernjiangfeng(thiz) {
		var password = thiz.value;
		if ( isPasswordVali(password) ) {
			passwordCanBeModified = true;
		} else {
			passwordCanBeModified = false;
		}
	}
	$( "#confirmToModifyPassword" ).click( function() {
		//alert( $("#password").val() )
		if ( passwordCanBeModified ) {
			var password = $("#password").val();
			$( "#userPassword" ).val( password );
			// 更新到数据库
			var sendData = { 
					id: $( "#userId" ).val(),
					username: $( "#userUsername" ).val(),
					password: $( "#userPassword" ).val(),
					birthday: $( "#userBirthday" ).text(),
					sex: $( "#userSex" ).val(),
					photo: $( "#userPhoto" ).val(),
					name: $( "#userName" ).val(),
					stat: 1,
					email: $( "#userEmail" ).val(),
					phone: $( "#userPhone" ).val()
			};
			$.ajax( {
				url: "${root}/user/data/modifyPassword.do",
				type: "post",
				dataType: "json",
				data: sendData,
				success: function( result ) {
					if ( result.code == 1 ) {
						//alert("修改成功");
						alert(result.msg);
						// 若成功，此时需要跳转到登录页面
						location.href = "${root}/user/login.html";
						/* // 若成功，此时需要执行登出操作
						location.href = "${root }/user/data/logout.do"; */
					} else {
						alert("修改失败");
					}
				}
			} );
		} else {
			alert("密码不符合条件")
		}
	} );
	
	
	
	// 修改昵称（name）
	$( "#toModifyName" ).hover( function() {
		if ( $( "#spanToModifyName" ).css("display") == "none" ) {
			$( "#spanToModifyName" ).css("display", "inline");
		} else {
			$( "#spanToModifyName" ).css("display", "none");
		}
	} );
	$( "#toModifyName" ).click( function() {
		var name = prompt("修改姓名（昵称不能为空，且长度不超多10）");
		if ( name != null && name.length < 5 && name != "") {
			//alert("yes")
			//重要
			$( "#userName" ).val( name );
			// 更新到数据库
			var sendData = { 
					id: $( "#userId" ).val(),
					username: $( "#userUsername" ).val(),
					password: $( "#userPassword" ).val(),
					birthday: $( "#userBirthday" ).text(),
					sex: $( "#userSex" ).val(),
					photo: $( "#userPhoto" ).val(),
					name: $( "#userName" ).val(),
					stat: 1,
					email: $( "#userEmail" ).val(),
					phone: $( "#userPhone" ).val()
			};
			$.ajax( {
				url: "${root}/user/data/updateUser.do",
				type: "post",
				dataType: "json",
				data: sendData,
				success: function( result ) {
					if ( result.code == 1 ) {
						//alert("修改成功");
						alert(result.msg);
						// 跳转到对应的controller来更新session里的user信息
						location.href = "${root}/user/data/modifyUserInSession.do";
					} else {
						alert("修改失败");
					}
				}
			} );
		} else if ( name != null ) {
			alert("昵称不能为空，且长度不超多10")
		}
		
	} );
	
	
	
	// 修改邮件（email）
	function updateEmail(arg_email) {
		var email = arg_email;
		if ( email != null && email != "" && isEmail(email)) {
			//alert("yes")
			//重要
			$( "#userEmail" ).val( email );
			// 更新到数据库
			var sendData = { 
					id: $( "#userId" ).val(),
					username: $( "#userUsername" ).val(),
					password: $( "#userPassword" ).val(),
					birthday: $( "#userBirthday" ).text(),
					sex: $( "#userSex" ).val(),
					photo: $( "#userPhoto" ).val(),
					name: $( "#userName" ).val(),
					stat: 1,
					email: $( "#userEmail" ).val(),
					phone: $( "#userPhone" ).val()
			};
			$.ajax( {
				url: "${root}/user/data/updateUser.do",
				type: "post",
				dataType: "json",
				data: sendData,
				success: function( result ) {
					if ( result.code == 1 ) {
						//alert("修改成功");
						alert(result.msg);
						// 跳转到对应的controller来更新session里的user信息
						location.href = "${root}/user/data/modifyUserInSession.do";
					} else {
						alert("修改失败");
					}
				}
			} );
		} else if ( email != null ) {
			alert("邮箱不符合条件或已存在，请重新修改")
		}
	}
	// 判断邮箱是否存在
	// 很重要
	/* var thisEmailIsNotExist = false;
	function ifEmailIsExist(arg_email) {
	//var ifEmailIsExist = function(arg_email) {
		var email = arg_email;
		if (isEmail(email)) {
			// 从数据库拿数据
			var emailObj = { "email": email };
			$.ajax( {
				url: "${root}/user/data/findEmail.do",
				type: "post",
				data: emailObj,
				dataType: "json",
				success: function( result ) {
					if ( result.code == 1 ) {
						// 邮箱已存在
						thisEmailIsNotExist = false;
						alert("存在")
					} else {
						thisEmailIsNotExist = true;
						alert("不存在")
					}
				}
			} );
		}
	} */
	$( "#toModifyEmail" ).hover( function() {
		if ( $( "#spanToModifyEmail" ).css("display") == "none" ) {
			$( "#spanToModifyEmail" ).css("display", "inline");
		} else {
			$( "#spanToModifyEmail" ).css("display", "none");
		}
	} );
	$( "#fontEmail" ).hover( function() {
		if ( $( "#spanToModifyEmail" ).css("display") == "none" ) {
			$( "#spanToModifyEmail" ).css("display", "inline");
		} else {
			$( "#spanToModifyEmail" ).css("display", "none");
		}
	} );
	$( "#toModifyEmail, #fontEmail" ).click( function() {
		var email = prompt("修改邮箱（不能为空）");
		if ( email != null && email != "" && isEmail(email)) {
			// 从数据库拿数据
			var emailObj = { "email": email };
			$.ajax( {
				url: "${root}/user/data/findEmail.do",
				type: "post",
				data: emailObj,
				dataType: "json",
				success: function( result ) {
					if ( result.code == 1 ) {
						// 邮箱已存在
						alert("邮箱已存在")
					} else {
						//alert("不存在")
						updateEmail(email)
					}
				}
			} );
		} else if ( email != null ) {
			alert("邮箱不符合条件或已存在，请重新修改")
		}
	} );
	
	// 修改手机号（phone）
	function updatePhone(arg_phone) {
		var phone = arg_phone;
		if ( phone != null && phone != "" && isPhoneNumber(phone)) {
			//重要
			$( "#userPhone" ).val( phone );
			// 更新到数据库
			var sendData = { 
					id: $( "#userId" ).val(),
					username: $( "#userUsername" ).val(),
					password: $( "#userPassword" ).val(),
					birthday: $( "#userBirthday" ).text(),
					sex: $( "#userSex" ).val(),
					photo: $( "#userPhoto" ).val(),
					name: $( "#userName" ).val(),
					stat: 1,
					email: $( "#userEmail" ).val(),
					phone: $( "#userPhone" ).val()
			};
			$.ajax( {
				url: "${root}/user/data/updateUser.do",
				type: "post",
				dataType: "json",
				data: sendData,
				success: function( result ) {
					if ( result.code == 1 ) {
						//alert("修改成功");
						alert(result.msg);
						// 跳转到对应的controller来更新session里的user信息
						location.href = "${root}/user/data/modifyUserInSession.do";
					} else {
						alert("修改失败");
					}
				}
			} );
		} else if ( phone != null ) {
			alert("手机号不符合条件或已存在，请重新修改")
		}
	}
	$( "#toModifyPhone" ).hover( function() {
		if ( $( "#spanToModifyPhone" ).css("display") == "none" ) {
			$( "#spanToModifyPhone" ).css("display", "inline");
		} else {
			$( "#spanToModifyPhone" ).css("display", "none");
		}
	} );
	$( "#fontPhone" ).hover( function() {
		if ( $( "#spanToModifyPhone" ).css("display") == "none" ) {
			$( "#spanToModifyPhone" ).css("display", "inline");
		} else {
			$( "#spanToModifyPhone" ).css("display", "none");
		}
	} );
	$( "#toModifyPhone, #fontPhone" ).click( function() {
		var phone = prompt("修改手机号（不能为空）");
		if ( phone != null && phone != "" && isPhoneNumber(phone)) {
			// 从数据库拿数据
			var phoneObj = { "phone": phone };
			$.ajax( {
				url: "${root}/user/data/findPhone.do",
				type: "post",
				data: phoneObj,
				dataType: "json",
				success: function( result ) {
					if ( result.code == 1 ) {
						// 手机号已注册
						alert("手机号已注册");
					} else {
						updatePhone(phone);
					}
				}
			} );
		} else if ( phone != null ) {
			alert("手机号不符合条件或已存在，请重新修改")
		}
	} );
	
	// 修改账号（username）
	function updateUsername(arg_username) {
		var username = arg_username;
		if ( username != null && username != "" && isUsername(username)) {
			//重要
			$( "#userUsername" ).val( username );
			// 更新到数据库
			var sendData = { 
					id: $( "#userId" ).val(),
					username: $( "#userUsername" ).val(),
					password: $( "#userPassword" ).val(),
					birthday: $( "#userBirthday" ).text(),
					sex: $( "#userSex" ).val(),
					photo: $( "#userPhoto" ).val(),
					name: $( "#userName" ).val(),
					stat: 1,
					email: $( "#userEmail" ).val(),
					phone: $( "#userPhone" ).val()
			};
			$.ajax( {
				url: "${root}/user/data/updateUser.do",
				type: "post",
				dataType: "json",
				data: sendData,
				success: function( result ) {
					if ( result.code == 1 ) {
						//alert("修改成功");
						alert(result.msg);
						// 跳转到对应的controller来更新session里的user信息
						location.href = "${root}/user/data/modifyUserInSession.do";
					} else {
						alert("修改失败");
					}
				}
			} );
		} else if ( username != null ) {
			alert("用户名不符合条件或已存在，请重新修改")
		}
	}
	$( "#toModifyUsername" ).hover( function() {
		if ( $( "#spanToModifyUsername" ).css("display") == "none" ) {
			$( "#spanToModifyUsername" ).css("display", "inline");
		} else {
			$( "#spanToModifyUsername" ).css("display", "none");
		}
	} );
	$( "#toModifyUsername" ).click( function() {
		var username = prompt("修改普通账号（username）（不能为空）");
		if ( username != null && username != "" && isUsername(username)) {
			// 从数据库拿数据
			var usernameObj = { "username": username };
			$.ajax( {
				url: "${root}/user/data/findUsername.do",
				type: "post",
				data: usernameObj,
				dataType: "json",
				success: function( result ) {
					if ( result.code == 1 ) {
						// 手机号已注册
						alert("用户名已存在");
					} else {
						updateUsername(username);
					}
				}
			} );
		} else if ( username != null ) {
			alert("用户名不符合条件或已存在，请重新修改")
		}
	} );
	
	
	
	
	// 地址table的样式
	//$( "table[id=jiangfengkx] tr:even" ).css("background-color", "gray");
		
	$( "table[id=jiangfengkx] tr" ).mouseover( function() {
		$( "#" + this.id ).css("background-color", "yellow");
	} ).mouseout( function() {
		$( "#" + this.id ).removeAttr("style");
		$( "table[id=index_center] tr:even" ).css("background-color", "gray");
	} );
</script>
	
	
<script type="text/javascript">

	$( ".fengorder" ).click( function() {
		var user_id = $( "#user_id" ).val();
		var text = $( this ).text();
		var stat = -1;
		switch (text) {
		case "待付款":
			stat = 1;
			break;
		case "已支付订单":
			stat = 2;
			break;
		case "已发货订单":
			stat = 3;
			break;
		case "已完成订单":
			stat = 4;
			break;
		case "已取消订单":
			stat = 5;
			break;
		default:
			stat = -1;
			break;
		}
		if ( stat == 1 ) {
			//alert("user_id : " + user_id + " stat : " + stat)
			$.ajax( {
				url: "${root}/order/data/getOrdersOfUserByStat.do",
				type: "post",
				dataType: "json",
				data: { "user_id": user_id, "stat": stat },
				success: function( result ) {
					/* if ( result.code == 1 ) {
						location.href = location.href;
					} else {

					} */
				}
			} );
		}
	} );

</script>

</body>
</html>