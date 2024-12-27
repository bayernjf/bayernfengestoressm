<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath }" var="root"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员登录</title>
	<script type="text/javascript" src="${root }/static-resources/js/bayernfeng.js"></script>
	<link href="${root }/static-resources/css/bayernfeng.css" rel="stylesheet" type="text/css"/>

	<script type="text/javascript" src="${root }/static-resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="${root }/static-resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="${root }/static-resources/js/verify.js" ></script>

	<link href="${root }/static-resources/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${root }/static-resources/css/login.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="${root }/static-resources/css/verify.css">


<style type="text/css">

/* 没有效果 */
.classForBtn {
	background: gray;
	cursor: not-allowed;
}

</style>
	

<script type="text/javascript">




	var valiResultsObj = {};
	var jiangfengjiangfeng = function() {
		//alert($( ".bayernfeng-vali" ).length)
		// 遍历class是bayernfeng-vali的元素
		$.each( $( ".bayernfeng-vali" ), function( index, thiz ) {
			// 如果该元素后的验证信息<span><font color='green'>，则为正确
			var color = $( "#"+thiz.id ).next().children(":first").prop("color");
			// 从0开始
			valiResultsObj[index] = color;
		} );
		// 每次输入，进行循环遍历验证，只要有red，flag为false，
		var flag = true;
		for (index in valiResultsObj) {
			//alert(index + " -> " + valiResultsObj[index])
			if (valiResultsObj[index] == "red" || valiResultsObj[index] == undefined) {
				flag = false;
			}
		}
		// 都满足条件，使得button可用
		if (flag) {
			//alert("可用")
			changeDisabbledButtonToFunctional("btn");
		} else {
			changeFunctionalButtonToDisabbled("btn");
		}
	}
	
	// 页面刚加载的时候，如果是记住用户，则复选框是被选中的状态，此时是的button可用
	var checkboxCheckedOnload = function() {
		if ( $( "#isRememberUsername" ).prop("checked") == true ) {
			changeDisabbledButtonToFunctional("btn");
		}
	}
	
	/* var jiangfengjiangfengForValueVali = function() {
		$.each( $( ".bayernfeng-vali" ), function( index, thiz ) {
			var value = $( "#"+thiz.id ).val();
			
			var flag = false;
			switch (index) {
			case 0:
				flag = valiAccount(value);
				break;
			case 1:
				flag = valiPassword(value);
			default:
				break;
			}
			var color = "";
			if (flag) {
				color = "green";
			} else {
				color = "red";
			}
			valiResultsObj[index] = color;
		} );
		var flag = true;
		for (index in valiResultsObj) {
			if (valiResultsObj[index] == "red") {
				flag = false;
			}
		}
		if (flag) {
			changeDisabbledButtonToFunctional("btn");
		} else {
			changeFunctionalButtonToDisabbled("btn");
		}
	} */
</script>

<style type="text/css">
	
		.j-getCode {
			/* position:absolute;
			right:0;
			top:20px;
			padding:4px 20px; */
			background:#FFE8BB;
			color:#FF6600;
			border-radius:45px;
		}
		.send {
			background:#E5E5E5;
			color:#777;
		}
		.j-getCode:hover {
			cursor:pointer;
		}
		#j-count {
			font-style:normal;
			padding-right:2px
		}
	
	</style>

</head>
<body onload="changeButtonToDisabled(); checkboxCheckedOnload();">

<jsp:include page="head.jsp"/>



	<div class="container login">
		<div class="span12">
<div class="ad">
					<img src="${root }/static-resources/image/login.jpg" width="500" height="330" alt="会员登录" title="会员登录">
</div>		</div>
		<div style="display: block;" id="normalLogin" class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong id="doNormalLogin" style="cursor: pointer;">账号密码登录</strong>USER LOGIN
						<strong id="doFastLogin" style="cursor: pointer;">手机快速登录</strong>
					</div>
					<form id="loginForm" novalidate="novalidate">
						<!-- 登录前的地址 -->
						<input id="locationBeforeLogin" type="hidden" name="locationBeforeLogin">
						<table>
							<tbody><tr>
								<th>
										用户名/E-mail/手机号:
								</th>
								<td>
									<input class="bayernfeng-vali" oninput="valiAccount(this); jiangfengjiangfeng();" value="${cookie.username.value }" placeholder="用户名至少有一个字母和数字,3~8" type="text" id="username" name="username" class="text" maxlength="20">
									
								</td>
							</tr>
							<tr>
								<th>
									密&nbsp;&nbsp;码:
								</th>
								<td>
									<input class="bayernfeng-vali" oninput="valiPassword(this); jiangfengjiangfeng();" placeholder="密码至少有一个字母和数字,3~8" value="${cookie.password.value }" type="password" id="password" name="password" class="text" maxlength="20" autocomplete="off">
								</td>
							</tr>
								<tr>
									<th>
										验证码:
									</th>
									<td>
									<div class="fieldSet" id="mpanel4" style="margin-top:10px;"></div>
										<span class="fieldSet">
											
											<%-- <input type="text" id="captcha" name="captcha" class="text captcha" maxlength="4" autocomplete="off"><img id="captchaImage" class="captchaImage" src="${root }/static-resources/image/captcha.jhtml" title="点击更换验证码"> --%>
										</span>
									</td>
								</tr>
							<tr>
								<th>&nbsp;
									
								</th>
								<td>
									<label>
										<input type="checkbox" id="isRememberUsername" name="isRememberUsername" value="feng" ${cookie.valueOfCheck.value == feng ? "" : "checked" }>记住用户名
									</label>
									<label>
										&nbsp;&nbsp;<a href="${root }/user/forgetPassword.html">找回密码</a>
									</label>
								</td>
							</tr>
							<tr>
								<th>&nbsp;
									
								</th>
								<td>
									<input id="btn" type="button" class="submit classForBtn" value="登 录">
								</td>
							</tr>
							<tr class="register">
								<th>&nbsp;
									
								</th>
								<td>
									<dl>
										<dt>还没有注册账号？</dt>
										<dd>
											立即注册即可体验在线购物！
											<a href="./register.html">立即注册</a>
										</dd>
									</dl>
								</td>
							</tr>
						</tbody></table>
					</form>
				</div>
			</div>
		</div>
		
		<!-- 手机快速登陆 -->
		<div style="display: none;" id="fastLogin" class="span12 last">
			<div class="wrap">
				<div class="main">
					<div class="title">
						<strong id="doNormalLogin2" style="cursor: pointer;">账号密码登录</strong>USER LOGIN
						<strong id="doFastLogin2" style="cursor: pointer;">手机快速登录</strong>
					</div>
					<form id="loginForm" novalidate="novalidate">
						<!-- 登录前的地址 -->
						<input id="locationBeforeLogin" type="hidden" name="locationBeforeLogin">
						<table>
							<tbody><tr>
								<th>
										手机号:
								</th>
								<td>
									<select id="prefixOfPhone" name="prefixOfPhone">
									</select>
									<input oninput="showErrorForPhone();" onblur="showErrorForPhone();" onmouseout="showErrorForPhone();" placeholder="手机号" type="text" id="phone" name="phone" class="text" maxlength="20">
									<span id="phoneSpan"></span>
								</td>
							</tr>
							<tr>
									<th>
										<!-- <span class="requiredField">*</span> -->验证码:
									</th>
									<td>
										<span class="fieldSet">
											<input readonly="readonly" type="text" id="captcha2" name="captcha" class="text captcha" maxlength="4" autocomplete="off"><%-- <img id="captchaImage" class="captchaImage" src="${root }/static-resources/image/captcha.jhtml" title="点击更换验证码"> --%>
										</span>
										<span class="j-getCode" id="getCode" onclick="getCode(this)">获取验证码</span>
        								<span class="j-getCode send" id="resetCode" disabled="disabled" style="display:none"><em id="j-count"></em>秒后再获取</span>
									</td>
								</tr>
							<tr>
								<th>&nbsp;
									
								</th>
								<td>
									<input disabled="disabled" style="background: gray; cursor: no-drop;" id="funciontalDisabled" type="button" class="submit classForBtn" value="登 录">
									<span>新用户则注册</span>
								</td>
							</tr>
							<tr class="register">
								<th>&nbsp;
									
								</th>
								<td>
									<dl>
										<dt>还没有注册账号？</dt>
										<dd>
											立即注册即可体验在线购物！
											<a href="./register.html">立即注册</a>
										</dd>
									</dl>
								</td>
							</tr>
						</tbody></table>
					</form>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="foot.jsp"/>

<script type="text/javascript">

//手机号的前缀
var prefixOfPhoneObj = {
		 "+86": "中国大陆 +86",
		"+886": "中国台湾 +886",
		"+852": "中国香港 +852",
		 "+49": "德国 +49",
		  "+1": "美国 +1"
};
// 遍历到下拉栏
$.each( prefixOfPhoneObj, function( key, thiz ) {
	//alert(key + " -> " + thiz)
	var content = "<option value='"+key+"'>"+thiz+"</option>";
	$( "#prefixOfPhone" ).append( content );
} );


//*****************************工具函数*****************************
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
	
	$( function() {
		
		// 切换快速登陆或普通登陆
		$( "strong:contains('账号密码登录')" ).hover( function() {
			//alert("普通");
			$( "#normalLogin" ).css("display", "block");
			$( "#fastLogin" ).css("display", "none");
		} );
		$( "strong:contains('手机快速登录')" ).hover( function() {
			//alert("快速");
			$( "#normalLogin" ).css("display", "none");
			$( "#fastLogin" ).css("display", "block");
		} );
		
		
		var sendCode = uuid();
		
		// 手机快速登陆
		//doWithPhoneAndCode("funciontalDisabled");
		$( "#funciontalDisabled" ).click( function() {
			//alert("手机快速登陆");
			
			var captcha = $( "#captcha2" ).val();
			
			if (captcha != sendCode) {
				alert("验证码错误");
			} else {
				//alert("成功");
				// 验证码验证成功进行跳转。通过手机号登陆！
				$( "input[name='locationBeforeLogin']" ).val(fengstorage.getItem("locationBeforeLogin"));
				var locationBeforeLogin = $( "input[name='locationBeforeLogin']" ).val();
				var phone = { "phone": $( "#phone" ).val(), "locationBeforeLogin": locationBeforeLogin };
				$.ajax( {
					url: "${root}/user/data/loginByPhone.do",
					type: "post",
					data: phone,
					dataType: "json",
					success: function( result ) {
						if ( result.code == 1 ) {
							//alert(result.msg.username)
							// 把username存到sessionStorage，用于购物车的功能实现
						   	sessionStorage.setItem("username", result.msg.username);
						   	location.href = "${root}/user/data/loginSuccess.do";
						} else {
							// 之前数据库没有用户，此时执行注册功能。
							// 然后跳转到登陆页面
							location.href = "${root}/user/login.html";
						}
					}
				} );
			}
			
		} );

		$( "#getCode" ).click( function() {
			// 手机号正确
			var phoneNumber = $( "#phone" ).val();
			if (isPhoneNumber(phoneNumber)) {
				// 发送验证码
				sendCode = "1234";
				// 下面注释的代码完全正常可用，再开发阶段，不要使用
				/* $.ajax( {
					url: "${root}/util/getCode.do",
					type: "post",
					dataType: "json",
					success: function( result ) {
						if ( result.code == 1 ) {
							sendCode = result.msg;
							//alert("sendCode -> " + sendCode);
						}
					}
				} ); */
			} else {
				alert("请输入正确手机号")
			}
		} );
		
	} );

</script>

	<script type="text/javascript">
		
		// 定义一个变量，若验证码通过，则为true
		var flag = false;
		// 是否点击了记住我
		var isRemeberMe = false;
	
		// 验证码
		$('#mpanel4').slideVerify({
			type : 2,		//类型
			vOffset : 5,	//误差量，根据需求自行调整
			vSpace : 5,	//间隔
			imgName : ['1.jpg', '2.jpg'],
			imgSize : {
				width: '200px',
				height: '100px',
			},
			blockSize : {
				width: '20px',
				height: '20px',
			},
			barSize : {
				width : '200px',
				height : '20px',
			},
			ready : function() {
			},
			success : function() {
				//alert('验证成功，添加你自己的代码！');
				//......后续操作
				flag = true;
			},
			error : function() {
	//		        	alert('验证失败！');
			}
			
		});
	
		$( function() {
			
			// 选中记住我
			/* $( "#isRememberUsername" ).click( function() {
				//alert("ffffffffffffff");
				//isRemeberMe = true;
				alert($( "#isRememberUsername" ).prop("checked"));
			} ); */
			
			$( "#btn" ).click( function() {
				//alert(fengstorage.getItem("locationBeforeLogin"));
				$( "input[name='locationBeforeLogin']" ).val(fengstorage.getItem("locationBeforeLogin"));
				var locationBeforeLogin = $( "input[name='locationBeforeLogin']" ).val();
				//alert("fffffff: " + locationBeforeLogin);
				var username = $( "input[name='username']" ).val();
			   	var password = $( "input[name='password']" ).val();
			  	//var isRememberUsername = $( "input[name='isRememberUsername']" ).val();
			  	var isRememberUsername = "jiang";
			  	// 如果点击了记住我
			   	if ($( "#isRememberUsername" ).prop("checked")) {
			   		isRememberUsername = "feng";
				}
			   	//alert("isRememberUsername: " + isRememberUsername);
			   	
			   	//构建传递的json格式数据
			   	var sendData = { "username": username, "password": password, "isRememberUsername": isRememberUsername, "locationBeforeLogin": locationBeforeLogin };
				// 当验证码成功是，执行。否则提示
				if (flag) {
					$.ajax( {
						url: "${root}/user/data/login.do",
					   	type: "POST",
					   	data: sendData,
					   	dataType: "json",
					   	success: function( result ) {
						if ( result.error_code == "0" ) {
						   //alert( result.error_msg );
						   // 把username存到sessionStorage，用于购物车的功能实现
						   sessionStorage.setItem("username", username);
						   location.href = "${root}/user/data/loginSuccess.do";
						   return true;
					   	} else if ( result.error_code == "2" ) {
					   		alert( result.error_msg );
					   	}
						else {
						   alert( result.error_msg );
						   return false;
						}
						}
					} );
				} else {
					alert("验证码未通过！");
				}
			  	
			} );
		} );
	</script>
	
</body>
</html>