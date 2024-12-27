/**
 * 
 */

var bairenfeng = function() {
	alert("jiangfeng");
}

var fengObj = {};
var fengArr = [];

//*************************************************展示获得的json格式的数据*****************************************
var root = location.pathname.split("/")[1];
// 展示最热门的十个产品
var showTopTenPopularGoods = function() {
	$.ajax( {
		url: "/"+root+"/index/getTopTenPopularGoods.do",
		type: "post",
		dataType: "json",
		success: function( result ) {
			if ( result.code == 1 ) {
				// 把拿到的json数据循环遍历
				$.each( result.msg, function( index, thiz ) {
					$( "#topTenPopularGoods" ).append( "<li>111111111</li>" );
				} );
			} else {
				
			}
		}
	} );
}


//*************************************************展示获得的json格式的数据*****************************************










// *************************************************各种函数，用来验证给定的字符串*****************************************
// 是手机号码，返回true
var isPhoneNumber = function(arg) {
	//获取手机验证码
    var phone = arg;
    //手机验证码正则表达式
    var reg = /^1[3|4|5|7|8][0-9]{9}$/;
    if (phone == "") {
       return false;
    }
    //如果验证不通过，则执行请输入正确的手机号
    if (!reg.test(phone)) {
        return false;
    } else {
    	return true;
    }
}

// 是电子邮箱，返回true
var isEmail = function(arg) {
    var email = arg;
    // 邮箱正则表达式
    var reg = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
    if (email == "") {
       return false;
    }
    if (!reg.test(email)) {
        return false;
    } else {
    	return true;
    }
}

// 只允许有中文数字英文任意组合，符合返回true
var isUsername = function(arg) {
	 var username = arg;
	    // 用户名至少有一个字母和数字，长度3~8
	    var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{3,8}$/;
	    if (username == "") {
	       return false;
	    }
	    if (!reg.test(username)) {
	        return false;
	    } else {
	    	return true;
	    }
}

var isPasswordVali = function(arg) {
	var password = arg;
	// 密码至少有一个字母和数字，长度3~8
	var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{3,8}$/;
	if (password == "") {
		return false;
	}
	if (!reg.test(password)) {
		return false;
	} else {
		return true;
	}
}

// *************************************************各种函数，用来验证给定的字符串*****************************************






// 根据当前元素只在一个元素后面添加一个显示正确的信息，可以覆盖
var afterOneWithRight = function(thiz) {
	//alert("afterOneWithRight thiz.value : " + thiz.value)
	var color = "green";
	var msg = "√";
	var id = thiz.id;
	// 选择当前元素紧跟下一个的元素。
	var $span = $( "#"+id + " + span" );
	// 获得元素的标签名
	//alert($span.prop("tagName"));
	// 如果有才删除
	if (undefined != $span.prop("tagName")) {
		// 先删除原来的
		$span.remove();
	}
	// 再添加一个新的
	$( "#"+id ).after("<span><font size='5px' color='"+color+"'>"+msg+"</font></span>");
}
// 根据当前元素只在一个元素后面添加一个显示错误的信息，可以覆盖
var afterOneWithWrong = function(thiz) {
	var color = "red";
	var msg = "×";
	var id = thiz.id;
	var $span = $( "#"+id + " + span" );
	if (undefined != $span.prop("tagName")) {
		$span.remove();
	}
	$( "#"+id ).after("<span><font size='5px' color='"+color+"'>"+msg+"</font></span>");
}

// 根据验证的结果，给当前元素一个带有验证信息结果的sibling
var showValiResult = function(thiz, flag) {
	// 如果验证正确
	if (flag) {
		afterOneWithRight(thiz);
	} else {
		afterOneWithWrong(thiz);
	}
}

//*************************************************验证表单*****************************************

// 考虑使用Vue.js来进行动态绑定。

//定义一个函数，当所有的验证都通过的时候，满足条件，执行代码，只要有一个不满足，不能执行
var valiResultsObj = {};
var toggleButtonFuncAndDisa = function(arg) {
	
}

// 验证账号，可能普通用户名，或者是手机号码，或者是电子邮箱
var valiAccount = function(thiz) {
	var val = thiz.value;
	//alert(val);
	// 满足三种中的任意一个
	if (isUsername(val) || isEmail(val) || isPhoneNumber(val)) {
		// 第二个参数是true，所以选择的是显示正确的消息
		showValiResult(thiz, true);
		return true;
	} else {
		showValiResult(thiz, false);
		return false;
	}
}

// 验证密码
var valiPassword = function(thiz) {
	var val = thiz.value;
	if (isPasswordVali(val)) {
		showValiResult(thiz, true);
		return true;
	} else {
		showValiResult(thiz, false);
		return false;
	}
}


// *************************************************验证表单*****************************************


// 在登录或者注册的时候，会判断输入的是邮箱还是手机号，或者是用户名。
// 然后返回相应的字符串，传给后台，然后后台根据字符串调用相应的方法
var whichWayToLoginOrRegister = function(arg) {
	
	var email = "email";
	var phone = "phone";
	// 可以是中文
	var username = "username";
	var result = "";
	
	if (isPhoneNumber(arg)) {
		result = phone;
	} else if (isEmail(arg)) {
		result = email;
	} else if (isUsername(arg)) {
		result = username;
	}
	
	return result;
}

var doWithPhoneAndCode = function(id) {
	$( "#"+id ).click( function() {
		//alert("手机快速登陆");
		
		var captcha = $( "#captcha2" ).val();
		
		if (captcha != "1234") {
			alert("验证码错误");
		} else {
			alert("成功");
		}
		
	} );
}

var showFengMessage = function(id, msg, color) {
	$( "#"+id ).html("<font size='5px' color='"+color+"'>"+msg+"</font>");
}

// 改变每一个表单提交按钮（button）的样式
var changeButtonToDisabled = function() {
	// 获得所有button
	var $btns = $( ":button" );
	$btns.each( function() {
		// 当前的一个button
		$( this ).attr("disabled", "disabled").css("background", "gray").css("cursor", "no-drop");
	} );
}
// 使得给定id的表单提交按钮（button）可以用
var changeDisabbledButtonToFunctional = function(id) {
	$( "#"+id ).removeAttr("style").removeAttr("disabled");
}
// 使得给定id的表单提交按钮（button）不可用
var changeFunctionalButtonToDisabbled = function(id) {
	$( "#"+id ).attr("disabled", "disabled").css("background", "gray").css("cursor", "no-drop");
}

//是否输入正确的手机号标识，如果为1则为正确的手机号，为0，则为不正确的手机号
var isPhone = 1;

/* $( function() {
	$( "#phone" ).blur( function() {
		checkphone();
	} );
} ); */
var showErrorForPhone = function() {
	//var id = thiz.id;
	checkphone();
	if (isPhone) {
		$( "#captcha2" ).removeAttr("readonly");
		//$( "#"+id ).removeAttr("style").removeAttr("disabled");
		changeDisabbledButtonToFunctional("funciontalDisabled");
	} else {
		$( "#captcha2" ).attr("readonly", "readonly");
		changeFunctionalButtonToDisabbled("funciontalDisabled");
	}
}

function getCode(e) {

    checkphone(); //获取手机验证码

    if (isPhone) {
    	$( "#captcha2" ).removeAttr("readonly");
        resetCode();
    } else {
    	$( "#captcha2" ).attr("readonly", "readonly");
    }

}
//检查手机号是否正确
function checkphone() {
	//获取手机验证码
    var phone = $("#phone").val();
    //手机验证码正则表达式
    var reg = /^1[3|4|5|7|8][0-9]{9}$/;


    isPhone = 1;
    if (phone == "") {
        //alert("请输入手机号");
        showFengMessage("phoneSpan", "×", "red");
        isPhone = 0;
        return;
    }
    //如果验证不通过，则执行请输入正确的手机号
    if (!reg.test(phone)) {
        //alert("请输入正确的手机号");
       showFengMessage("phoneSpan", "×", "red");
        isPhone = 0;
        return;
    } else {
    	showFengMessage("phoneSpan", "√", "green");
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










