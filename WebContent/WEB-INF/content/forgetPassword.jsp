<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath }" var="root"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>找回密码</title>
	<script type="text/javascript" src="${root }/static-resources/js/bayernfeng.js"></script>
	<link href="${root }/static-resources/css/bayernfeng.css" rel="stylesheet" type="text/css"/>

	<script type="text/javascript" src="${root }/static-resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="${root }/static-resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="${root }/static-resources/js/verify.js" ></script>

	<link href="${root }/static-resources/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${root }/static-resources/css/login.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" type="text/css" href="${root }/static-resources/css/verify.css">


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
<body>

	<jsp:include page="head.jsp"/>
	
	<!-- 验证验证码 -->
	<div id="forgetThePassword" class="container login">
		<div class="span12 last">
			<div class="wrap">
				<div align="center" class="main">
					<div class="title">
						<strong>找回密码</strong>
					</div>
					<form id="loginForm" novalidate="novalidate">
						<table>
							<tbody><tr>
								<th>
										手机号:
								</th>
								<td>
									<select id="prefixOfPhone" name="prefixOfPhone">
									</select>
									<input class="bayernfeng-vali" 
										   oninput="showErrorForPhone(); ifPhoneIsExist(this); jiangfengjiangfeng();" 
										    onblur="showErrorForPhone(); ifPhoneIsExist(this); jiangfengjiangfeng();" 
										onmouseout="showErrorForPhone(); ifPhoneIsExist(this); jiangfengjiangfeng();" placeholder="手机号" type="text" id="phone" name="phone" class="text" maxlength="20">
									<span id="phoneSpan"></span>
								</td>
							</tr>
								<tr>
									<th>
										验证码:
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
									<input disabled="disabled" style="background: gray; cursor: no-drop;" id="funciontalDisabled" type="button" class="submit classForBtn" value="确认">
								</td>
							</tr>
							
						</tbody></table>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改密码 -->
	<div id="modifyThePassword" class="container login">
		<div class="span12 last">
			<div class="wrap">
				<div align="center" class="main">
					<div class="title">
						<strong>修改密码</strong>
					</div>
					<form id="loginForm" novalidate="novalidate">
						<table>
							<tbody>
								<tr>
									<th>
										新&nbsp;&nbsp;密&nbsp;&nbsp;码:
									</th>
									<td>
										<input class="bayernfeng-vali" 
											oninput="valiPassword(this);" 
											placeholder="密码至少有一个字母和数字,3~8" 
											type="password" id="newpassword" name="newpassword" class="text" maxlength="20" autocomplete="off">
								
										<span></span>
										<!-- 眼睛可以看到密码 -->
										<span style="cursor: pointer;" id="showPassword">显示密码</span>
									</td>
								</tr>
								<tr>
									<th>
										密&nbsp;&nbsp;码&nbsp;&nbsp;强&nbsp;&nbsp;度:
									</th>
									<td>
										<hr>
									</td>
								</tr>
								<tr id="confirmnewpasswordTr">
									<th>
										确&nbsp;&nbsp;认&nbsp;&nbsp;密&nbsp;&nbsp;码:
									</th>
									<td>
										<input type="password" id="confirmnewpassword" name="confirmnewpassword" class="text" maxlength="20" autocomplete="off">
									</td>
								</tr>
							<tr>
								<th>&nbsp;
									
								</th>
								<td>
									<input id="btn3" type="button" class="submit" value="确认修改">
									<input style="display: none" id="btn4" type="button" class="submit" value="确认修改">
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


// *****************************js验证*****************************

	
	

// *****************************js验证*****************************







var sendCode = uuid();

	// 忘记密码的手机验证
	$( "#funciontalDisabled" ).click( function() {
		
		var captcha = $( "#captcha2" ).val();
		
		if (captcha != sendCode) {
			alert("验证码错误");
		} else {
			// 如果真，则显示修改密码表单
			change(true);
		}
		
	} );
	
	var phoneNumber;
	var thisPhoneIsExsit = true;
	// 再手机符合条件，输入的过程中，判断注册的时候，用户是否存在，
	function ifPhoneIsExist(thiz) {
		phoneNumber = $( "#phone" ).val();
		if (isPhoneNumber(phoneNumber)) {
			//alert("用户已存在");
			//$( "#phoneSpan" )
			// 从数据库拿数据
			var phone = { "phone": $( "#phone" ).val() };
			$.ajax( {
				url: "${root}/user/data/findPhone.do",
				type: "post",
				data: phone,
				dataType: "json",
				success: function( result ) {
					if ( result.code == 1 ) {
						thisPhoneIsExsit = true;
					} else {
						// 手机号不存在
						thisPhoneIsExsit = false;
					}
				}
			} );
			if (!thisPhoneIsExsit) {
				showFengMessage("phoneSpan", "手机号还未注册", "red");
				thisPhoneIsNotExsit = false;
			} else {
				showFengMessage("phoneSpan", "√", "green");
				thisPhoneIsExsit = true;
				phoneNumber = $( "#phone" ).val();
			}
		}
		if ( !isPhoneNumber(phoneNumber) ) {
			showFengMessage("phoneSpan", "×", "red");
		}
	}
	
	$( "#getCode" ).click( function() {
		// 手机号正确
		var phoneNumber = $( "#phone" ).val();
		
		if (isPhoneNumber(phoneNumber) && thisPhoneIsExsit) {
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
			if (thisPhoneIsExsit) {
				alert("请输入正确手机号")
			} else {
				alert("手机号不存在")
			}
			
		}
	} );
	
	
	
	//是否输入正确的手机号标识，如果为1则为正确的手机号，为0，则为不正确的手机号
	var isPhone = 1;

	function getCode(e) {

	    checkphone(); //获取手机验证码

	    if (isPhone && thisPhoneIsExsit) {
	        resetCode();
	    }


	}
	//检查手机号是否正确
	function checkphone() {
	    //获取手机验证码
	    var phone = $("#phone").val();
	    //手机验证码正则表达式
	    var reg = /^1[3|4|5|7|8][0-9]{9}$/;


	    isPhone = 1;
	    //如果验证不通过，则执行请输入正确的手机号
	    if (!reg.test(phone) || phone == "") {
	        //alert("请输入正确的手机号");
	        isPhone = 0;
	        return;
	    }
	}
	//输入正确手机号，获取验证码按钮发生变化
	//倒计时
	function resetCode() {
	    //设定倒数时间总数60秒
	    var jMinutes = 60;
	    $("#getCode").hide();
	    $("#resetCode").show();
	    $("#resetCode em").html(jMinutes - 1);

	    Timer = setInterval(function() {
	        jMinutes -= 1;
	        if (jMinutes == 0) {
	            clearInterval(Timer)
	            $("#resetCode").hide();
	            $("#getCode").show();
	        } else {
	            $("#resetCode em").html(jMinutes - 1);
	        }
	    }, 1000)



	}

	
	// 验证码验证成功后，直接跳转到个人中心，进行密码修改，
	// 修改密码成功后，跳转到登录页面
	
	
	$( "#forgetThePassword" ).css("display", "block");
	$( "#modifyThePassword" ).css("display", "none");
	

	
		
	function change(flag) {
		// 验证码验证成功后，跳转到该页面，显示修改密码表单，隐藏账号验证表单，进行密码修改，
		// 修改密码成功后，跳转到登录页面
		if (flag) {
			$( "#forgetThePassword" ).css("display", "none");
			$( "#modifyThePassword" ).css("display", "block");
		}
	}
	
	
	
	// 修改密码
	$( function() {
		
		// 点击新密码右边的东西，可以显示密码，并且隐藏”再次输入密码“输入框
		// 确认框不需要判断两次输入密码是否相同
		$( "#showPassword" ).on("click", function() {
			// 点击之前是”隐藏密码“
			if ($(this).text() == "隐藏密码") {
				// 点击后出现”显示密码“
				$( "#showPassword" ).html("显示密码");
				// 把密码隐藏，启用确认密码输入框
				$( "#confirmnewpasswordTr" ).css("display", "table-row");
				$( "#newpassword" ).attr("type", "password");
				$( "#btn4" ).css("display", "none");
				$( "#btn3" ).css("display", "block");
			} else { // 点击之前是”显示密码“
				// // 点击后出现”隐藏密码“
				$( "#showPassword" ).html("隐藏密码");
				// 把密码显示，隐藏确认密码输入框	
				$( "#confirmnewpasswordTr" ).css("display", "none");
				$( "#newpassword" ).attr("type", "text");
				// 修改按钮id
				//$( "#btn2" ).attr("id", "btn3");
				$( "#btn3" ).css("display", "none");
				$( "#btn4" ).css("display", "block");
			}
		} );
		$( "#btn4" ).click( function() {
			if ( isPasswordVali( $( "#newpassword" ).val() ) ) {
				var newPassword = $( "#newpassword" ).val();
				var sendData = { "newPassword": newPassword, "phone": phoneNumber };
				$.ajax( {
					url: "${root}/user/data/changePassword.do",
					type: "post",
					data: sendData,
					dataType: "json",
					success: function( result ) {
						if ( result.code == 1 ) {
							alert("密码修改成功");
							location.href = "${root}/user/login.html"
						} else {
							alert("修改失败")
						}
					}
				} );
			} else {
				alert("密码至少有一个字母和数字，长度3~8")
			}
			
		} );
/* 			$( "#showPassword" ).click( function() {
			$( "#showPassword" ).html("隐藏密码");
		} ); */
		
		$( "#confirmnewpassword" ).attr("readonly", "readonly");
		
		$( "#newpassword" ).blur( function() {
			var newpassword = $( "#newpassword" ).val();
			var confirmnewpassword = $( "#confirmnewpassword" ).val();
			if (newpassword != '') {
				$( "#confirmnewpassword" ).removeAttr("readonly");
			} else {
				$( "#confirmnewpassword" ).val("");
				$( "#confirmnewpassword" ).attr("readonly", "readonly");
			}
		} );
		
		$( "#confirmnewpassword" ).click( function(event) {
			var coordinateX = event.pageX;
			var coordinateY = event.pageY;
			//$( "body" ).append($( "<span style='margin-left: "+coordinateX+"px; margin-bottom: "+coordinateY+"px; position: absolute'>节点</span>" ));
		} );
		
		$( "#btn3" ).click( function() {
			
			var newpassword = $( "#newpassword" ).val();
			var confirmnewpassword = $( "#confirmnewpassword" ).val();
			if (newpassword != "") {
				if (newpassword == confirmnewpassword) {
					if ( isPasswordVali( $( "#newpassword" ).val() ) ) {
						var newPassword = $( "#newpassword" ).val();
						var sendData = { "newPassword": newPassword, "phone": phoneNumber };
						$.ajax( {
							url: "${root}/user/data/changePassword.do",
							type: "post",
							dataType: "json",
							data: sendData,
							success: function( result ) {
								if ( result.code == 1 ) {
									alert("密码修改成功");
									location.href = "${root}/user/login.html"
								} else {
									alert("修改失败")
								}
							}
						} );
					} else {
						alert("密码至少有一个字母和数字，长度3~8")
					}
					
				} else {
					alert("两次密码不同");
				}
			} else {
				// 新密码输入内容以后才能输入确认密码
				//$( "#confirmnewpassword" ).attr("readonly", "readonly");
				alert("请输入新密码")
			}
			
		} );
		
	} );
	
		
		
		
</script>

</body>
</html>