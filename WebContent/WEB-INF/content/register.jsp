<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set value="${pageContext.request.contextPath }" var="root"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员注册</title>
	<script type="text/javascript" src="${root }/static-resources/js/bayernfeng.js"></script>
	<link href="${root }/static-resources/css/bayernfeng.css" rel="stylesheet" type="text/css"/>

	<script type="text/javascript" src="${root }/static-resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="${root }/static-resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="${root }/static-resources/js/verify.js" ></script>
	
	<link href="${root }/static-resources/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${root }/static-resources/css/register.css" rel="stylesheet" type="text/css"/>
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
	
	<script type="text/javascript">
	
		// 验证确认密码
		var valiConfirmPassword = function(thiz) {
			//var val = thiz.value;
			// thiz.id 是 confirmPassword
			// 密码输入框的id即idOfPasswordInput应该是password
			//var idOfPasswordInput = thiz.id;
			//alert(idOfPasswordInput)
			// 算了，根据下面代码取值
			var password = $( "input[name='password']" ).val();
			var confirmPassword = $( "input[name='confirmPassword']" ).val();
			if ( confirmPassword == password ) {
				showValiResult(thiz, true);
				return true;
			} else {
				showValiResult(thiz, false);
				return false;
			}
		}
	
	</script>
	
</head>
<body onload="changeButtonToDisabled();">

	<jsp:include page="head.jsp"/>

	<div class="container register">
		<div style="display: none;" id="normalRegister" class="span24">
			<div class="wrap">
				<div class="main clearfix">
					<div class="title">
						<strong style="cursor: pointer;">会员注册</strong>USER REGISTER
						<strong style="cursor: pointer;">手机快速注册</strong>
						<strong style="cursor: pointer;">邮箱注册</strong>
					</div>
					<form id="registerForm" novalidate="novalidate">
						<table>
							<tbody><tr>
								<th>
									<span class="requiredField">*</span>用户名:
								</th>
								<td>
									<input class="bayernfeng-vali" 
									oninput="jiangfengjiangfeng(); ifUsernameExist(this);"
									onblur="jiangfengjiangfeng(); ifUsernameExist(this);"
									onmouseout="jiangfengjiangfeng(); ifUsernameExist(this);"
									 placeholder="用户名至少有一个字母和数字,3~8" type="text" id="username" name="username" class="text" maxlength="20">
									
									<span id="usernameSpan"></span>
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>密&nbsp;&nbsp;码:
								</th>
								<td>
									<input class="bayernfeng-vali" oninput="valiPassword(this); jiangfengjiangfeng();" placeholder="密码至少有一个字母和数字,3~8" type="password" id="password" name="password" class="text" maxlength="20" autocomplete="off">
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>确认密码:
								</th>
								<td>
									<input class="bayernfeng-vali" oninput="valiConfirmPassword(this); jiangfengjiangfeng();" placeholder="密码至少有一个字母和数字,3~8" type="password" id="confirmPassword" name="confirmPassword" class="text" maxlength="20" autocomplete="off">
								</td>
							</tr>
									
							<tr>
								<th>
									<!-- <span class="requiredField">*</span> -->验证码:
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
									<input id="normalRegisterButton" type="button" class="submit" value="同意以下协议并注册">
								</td>
							</tr>
							<tr>
								<th>&nbsp;
									
								</th>
								<td>
									注册协议
								</td>
							</tr>
							<tr>
								<th>&nbsp;
									
								</th>
								<td>
									<div id="agreement" class="agreement" style="height: 200px;">
										<p>尊敬的用户欢迎您注册成为本网站会员。请用户仔细阅读以下全部内容。如用户不同意本服务条款任意内容，请不要注册或使用本网站服务。如用户通过本网站注册程序，即表示用户与本网站已达成协议，自愿接受本服务条款的所有内容。此后，用户不得以未阅读本服务条款内容作任何形式的抗辩。</p> <p>一、本站服务条款的确认和接纳<br>本网站涉及的各项服务的所有权和运作权归本网站所有。本网站所提供的服务必须按照其发布的服务条款和操作规则严格执行。本服务条款的效力范围及于本网站的一切产品和服务，用户在享受本网站的任何服务时，应当受本服务条款的约束。</p> <p>二、服务简介<br>本网站运用自己的操作系统通过国际互联网络为用户提供各项服务。用户必须:  1. 提供设备，如个人电脑、手机或其他上网设备。 2. 个人上网和支付与此服务有关的费用。</p> <p>三、用户在不得在本网站上发布下列违法信息<br>1. 反对宪法所确定的基本原则的； 2. 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3. 损害国家荣誉和利益的； 4. 煽动民族仇恨、民族歧视，破坏民族团结的； 5. 破坏国家宗教政策，宣扬邪教和封建迷信的； 6. 散布谣言，扰乱社会秩序，破坏社会稳定的； 7. 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8. 侮辱或者诽谤他人，侵害他人合法权益的； 9. 含有法律、行政法规禁止的其他内容的。</p> <p>四、有关个人资料<br>用户同意:  1. 提供及时、详尽及准确的个人资料。 2. 同意接收来自本网站的信息。 3. 不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。 4. 本网站不公开用户的姓名、地址、电子邮箱和笔名。除以下情况外:  a) 用户授权本站透露这些信息。 b) 相应的法律及程序要求本站提供用户的个人资料。</p> <p>五、服务条款的修改<br>本网站有权在必要时修改服务条款，一旦条款及服务内容产生变动，本网站将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以主动取消获得的本网站信息服务。如果用户继续享用本网站信息服务，则视为接受服务条款的变动。</p> <p>六、用户隐私制度<br>尊重用户个人隐私是本网站的一项基本政策。所以，本网站一定不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本网站中的非公开内容，除非有法律许可要求或本网站在诚信的基础上认为透露这些信息在以下四种情况是必要的:  1. 遵守有关法律规定，遵从本网站合法服务程序。 2. 保持维护本网站的商标所有权。 3. 在紧急情况下竭力维护用户个人和社会大众的隐私安全。 4. 符合其他相关的要求。</p> <p>七、用户的帐号、密码和安全性<br>用户一旦注册成功，将获得一个密码和用户名。用户需谨慎合理的保存、使用用户名和密码。如果你不保管好自己的帐号和密码安全，将负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。你可随时根据指示改变你的密码。用户若发现任何非法使用用户帐号或存在安全漏洞的情况，请立即通告本网站。   八、 拒绝提供担保 用户明确同意信息服务的使用由用户个人承担风险。本网站不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保，但会在能力范围内，避免出错。</p> <p>九、有限责任<br>如因不可抗力或其它本站无法控制的原因使本站销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等本站会尽可能合理地协助处理善后事宜，并努力使客户免受经济损失，同时会尽量避免这种损害的发生。</p> <p>十、用户信息的储存和限制<br>本站有判定用户的行为是否符合国家法律法规规定及本站服务条款权利，如果用户违背本网站服务条款的规定，本网站有权中断对其提供服务的权利。</p> <p>十一、用户管理<br>用户单独承担发布内容的责任。用户对服务的使用是根据所有适用于本站的国家法律、地方法律和国际法律标准的。用户必须遵循:  1. 使用网络服务不作非法用途。 2. 不干扰或混乱网络服务。 3. 遵守所有使用网络服务的网络协议、规定、程序和惯例。 用户须承诺不传输任何非法的、骚扰性的、中伤他人的、辱骂性的、恐性的、伤害性的、庸俗的，淫秽等信息资料。另外，用户也不能传输何教唆他人构成犯罪行为的资料；不能传输助长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法律的资料。未经许可而非法进入其它电脑系统是禁止的。 若用户的行为不符合以上提到的服务条款，本站将作出独立判断立即取消用户服务帐号。用户需对自己在网上的行为承担法律责任。用户若在本站上散布和传播反动、色情或其它违反国家法律的信息，本站的系统记录有可能作为用户违反法律的证据。</p> <p>十二、通告<br>所有发给用户的通告都可通过重要页面的公告或电子邮件或常规的信件传送。服务条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。</p> <p>十三、信息内容的所有权<br>本网站定义的信息内容包括: 文字、软件、声音、相片、录象、图表；在广告中全部内容；本网站为用户提供的其它信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在本网站和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。本站所有的文章版权归原文作者和本站共同所有，任何人需要转载本站的文章，必须征得原文作者或本站授权。</p> <p>十四、法律<br>本协议的订立、执行和解释及争议的解决均应适用中华人民共和国的法律。用户和本网站一致同意服从本网站所在地有管辖权的法院管辖。如发生本网站服务条款与中华人民共和国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它条款则依旧保持对用户的约束力。</p>
									</div>
								</td>
							</tr>
						</tbody></table>
						<div class="login">
<div class="ad">
					<dl>
	<dt>
		注册即享受
	</dt>
	<dd>
		正品保障、正规发票
	</dd>
	<dd>
		货到付款、会员服务
	</dd>
	<dd>
		自由退换、售后上门
	</dd>
</dl>
</div>							<dl>
								<dt>已经拥有账号了？</dt>
								<dd>
									立即登录即可体验在线购物！
									<a href="./login.html">立即登录</a>
								</dd>
							</dl>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<!-- 手机快速注册 -->
		<div style="display: block;" id="fastRegister" class="span24">
			<div class="wrap">
				<div class="main clearfix">
					<div class="title">
						<strong style="cursor: pointer;">会员注册</strong>USER REGISTER
						<strong style="cursor: pointer;">手机快速注册</strong>
						<strong style="cursor: pointer;">邮箱注册</strong>
					</div>
					<form id="registerForm" novalidate="novalidate">
						<table>
							<tbody><tr>
								<th>
									<span class="requiredField">*</span>手机号:
								</th>
								<td>
									<select id="prefixOfPhone" name="prefixOfPhone">
									</select>
									<input oninput="showErrorForPhone(); ifPhoneIsExist(this); jiangfengjiangfeng();" 
										    onblur="showErrorForPhone(); ifPhoneIsExist(this); jiangfengjiangfeng();" 
										onmouseout="showErrorForPhone(); ifPhoneIsExist(this); jiangfengjiangfeng();" placeholder="手机号" type="text" id="phone" name="phone" class="text" maxlength="20">
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
									<input disabled="disabled" style="background: gray; cursor: no-drop;" id="phoneRegisterButton" type="button" class="submit classForBtn" value="同意以下协议并注册">
								</td>
							</tr>
							<tr>
								<th>&nbsp;
									
								</th>
								<td>
									注册协议
								</td>
							</tr>
							<tr>
								<th>&nbsp;
									
								</th>
								<td>
									<div id="agreement" class="agreement" style="height: 200px;">
										<p>尊敬的用户欢迎您注册成为本网站会员。请用户仔细阅读以下全部内容。如用户不同意本服务条款任意内容，请不要注册或使用本网站服务。如用户通过本网站注册程序，即表示用户与本网站已达成协议，自愿接受本服务条款的所有内容。此后，用户不得以未阅读本服务条款内容作任何形式的抗辩。</p> <p>一、本站服务条款的确认和接纳<br>本网站涉及的各项服务的所有权和运作权归本网站所有。本网站所提供的服务必须按照其发布的服务条款和操作规则严格执行。本服务条款的效力范围及于本网站的一切产品和服务，用户在享受本网站的任何服务时，应当受本服务条款的约束。</p> <p>二、服务简介<br>本网站运用自己的操作系统通过国际互联网络为用户提供各项服务。用户必须:  1. 提供设备，如个人电脑、手机或其他上网设备。 2. 个人上网和支付与此服务有关的费用。</p> <p>三、用户在不得在本网站上发布下列违法信息<br>1. 反对宪法所确定的基本原则的； 2. 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3. 损害国家荣誉和利益的； 4. 煽动民族仇恨、民族歧视，破坏民族团结的； 5. 破坏国家宗教政策，宣扬邪教和封建迷信的； 6. 散布谣言，扰乱社会秩序，破坏社会稳定的； 7. 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8. 侮辱或者诽谤他人，侵害他人合法权益的； 9. 含有法律、行政法规禁止的其他内容的。</p> <p>四、有关个人资料<br>用户同意:  1. 提供及时、详尽及准确的个人资料。 2. 同意接收来自本网站的信息。 3. 不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。 4. 本网站不公开用户的姓名、地址、电子邮箱和笔名。除以下情况外:  a) 用户授权本站透露这些信息。 b) 相应的法律及程序要求本站提供用户的个人资料。</p> <p>五、服务条款的修改<br>本网站有权在必要时修改服务条款，一旦条款及服务内容产生变动，本网站将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以主动取消获得的本网站信息服务。如果用户继续享用本网站信息服务，则视为接受服务条款的变动。</p> <p>六、用户隐私制度<br>尊重用户个人隐私是本网站的一项基本政策。所以，本网站一定不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本网站中的非公开内容，除非有法律许可要求或本网站在诚信的基础上认为透露这些信息在以下四种情况是必要的:  1. 遵守有关法律规定，遵从本网站合法服务程序。 2. 保持维护本网站的商标所有权。 3. 在紧急情况下竭力维护用户个人和社会大众的隐私安全。 4. 符合其他相关的要求。</p> <p>七、用户的帐号、密码和安全性<br>用户一旦注册成功，将获得一个密码和用户名。用户需谨慎合理的保存、使用用户名和密码。如果你不保管好自己的帐号和密码安全，将负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。你可随时根据指示改变你的密码。用户若发现任何非法使用用户帐号或存在安全漏洞的情况，请立即通告本网站。   八、 拒绝提供担保 用户明确同意信息服务的使用由用户个人承担风险。本网站不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保，但会在能力范围内，避免出错。</p> <p>九、有限责任<br>如因不可抗力或其它本站无法控制的原因使本站销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等本站会尽可能合理地协助处理善后事宜，并努力使客户免受经济损失，同时会尽量避免这种损害的发生。</p> <p>十、用户信息的储存和限制<br>本站有判定用户的行为是否符合国家法律法规规定及本站服务条款权利，如果用户违背本网站服务条款的规定，本网站有权中断对其提供服务的权利。</p> <p>十一、用户管理<br>用户单独承担发布内容的责任。用户对服务的使用是根据所有适用于本站的国家法律、地方法律和国际法律标准的。用户必须遵循:  1. 使用网络服务不作非法用途。 2. 不干扰或混乱网络服务。 3. 遵守所有使用网络服务的网络协议、规定、程序和惯例。 用户须承诺不传输任何非法的、骚扰性的、中伤他人的、辱骂性的、恐性的、伤害性的、庸俗的，淫秽等信息资料。另外，用户也不能传输何教唆他人构成犯罪行为的资料；不能传输助长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法律的资料。未经许可而非法进入其它电脑系统是禁止的。 若用户的行为不符合以上提到的服务条款，本站将作出独立判断立即取消用户服务帐号。用户需对自己在网上的行为承担法律责任。用户若在本站上散布和传播反动、色情或其它违反国家法律的信息，本站的系统记录有可能作为用户违反法律的证据。</p> <p>十二、通告<br>所有发给用户的通告都可通过重要页面的公告或电子邮件或常规的信件传送。服务条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。</p> <p>十三、信息内容的所有权<br>本网站定义的信息内容包括: 文字、软件、声音、相片、录象、图表；在广告中全部内容；本网站为用户提供的其它信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在本网站和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。本站所有的文章版权归原文作者和本站共同所有，任何人需要转载本站的文章，必须征得原文作者或本站授权。</p> <p>十四、法律<br>本协议的订立、执行和解释及争议的解决均应适用中华人民共和国的法律。用户和本网站一致同意服从本网站所在地有管辖权的法院管辖。如发生本网站服务条款与中华人民共和国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它条款则依旧保持对用户的约束力。</p>
									</div>
								</td>
							</tr>
						</tbody></table>
						<div class="login">
<div class="ad">
					<dl>
	<dt>
		注册即享受
	</dt>
	<dd>
		正品保障、正规发票
	</dd>
	<dd>
		货到付款、会员服务
	</dd>
	<dd>
		自由退换、售后上门
	</dd>
</dl>
</div>							<dl>
								<dt>已经拥有账号了？</dt>
								<dd>
									立即登录即可体验在线购物！
									<a href="./login.html">立即登录</a>
								</dd>
							</dl>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<!-- 邮箱注册 -->
		<div style="display: none;" id="emailRegister" class="span24">
			<div class="wrap">
				<div class="main clearfix">
					<div class="title">
						<strong style="cursor: pointer;">会员注册</strong>USER REGISTER
						<strong style="cursor: pointer;">手机快速注册</strong>
						<strong style="cursor: pointer;">邮箱注册</strong>
					</div>
					<form id="registerForm" novalidate="novalidate">
						<table>
							<tbody><tr>
								<th>
									<span class="requiredField">*</span>邮箱:
								</th>
								<td>
									<input oninput="ifEmailIsExist(this); jiangfengjiangfeng();" 
										    onblur="ifEmailIsExist(this); jiangfengjiangfeng();" 
										onmouseout="ifEmailIsExist(this); jiangfengjiangfeng();" 
										placeholder="邮箱" type="text" id="email" name="email" class="text" maxlength="20">
									<span id="emailSpan"></span>
								</td>
							</tr>
									
							<tr>
								<th>&nbsp;
									
								</th>
								<td>
									<input disabled="disabled" style="background: gray; cursor: no-drop;" id="emailRegisterButton" type="button" class="submit classForBtn" value="同意以下协议并注册">
								</td>
							</tr>
							<tr>
								<th>&nbsp;
									
								</th>
								<td>
									注册协议
								</td>
							</tr>
							<tr>
								<th>&nbsp;
									
								</th>
								<td>
									<div id="agreement" class="agreement" style="height: 200px;">
										<p>尊敬的用户欢迎您注册成为本网站会员。请用户仔细阅读以下全部内容。如用户不同意本服务条款任意内容，请不要注册或使用本网站服务。如用户通过本网站注册程序，即表示用户与本网站已达成协议，自愿接受本服务条款的所有内容。此后，用户不得以未阅读本服务条款内容作任何形式的抗辩。</p> <p>一、本站服务条款的确认和接纳<br>本网站涉及的各项服务的所有权和运作权归本网站所有。本网站所提供的服务必须按照其发布的服务条款和操作规则严格执行。本服务条款的效力范围及于本网站的一切产品和服务，用户在享受本网站的任何服务时，应当受本服务条款的约束。</p> <p>二、服务简介<br>本网站运用自己的操作系统通过国际互联网络为用户提供各项服务。用户必须:  1. 提供设备，如个人电脑、手机或其他上网设备。 2. 个人上网和支付与此服务有关的费用。</p> <p>三、用户在不得在本网站上发布下列违法信息<br>1. 反对宪法所确定的基本原则的； 2. 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3. 损害国家荣誉和利益的； 4. 煽动民族仇恨、民族歧视，破坏民族团结的； 5. 破坏国家宗教政策，宣扬邪教和封建迷信的； 6. 散布谣言，扰乱社会秩序，破坏社会稳定的； 7. 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8. 侮辱或者诽谤他人，侵害他人合法权益的； 9. 含有法律、行政法规禁止的其他内容的。</p> <p>四、有关个人资料<br>用户同意:  1. 提供及时、详尽及准确的个人资料。 2. 同意接收来自本网站的信息。 3. 不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。 4. 本网站不公开用户的姓名、地址、电子邮箱和笔名。除以下情况外:  a) 用户授权本站透露这些信息。 b) 相应的法律及程序要求本站提供用户的个人资料。</p> <p>五、服务条款的修改<br>本网站有权在必要时修改服务条款，一旦条款及服务内容产生变动，本网站将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以主动取消获得的本网站信息服务。如果用户继续享用本网站信息服务，则视为接受服务条款的变动。</p> <p>六、用户隐私制度<br>尊重用户个人隐私是本网站的一项基本政策。所以，本网站一定不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本网站中的非公开内容，除非有法律许可要求或本网站在诚信的基础上认为透露这些信息在以下四种情况是必要的:  1. 遵守有关法律规定，遵从本网站合法服务程序。 2. 保持维护本网站的商标所有权。 3. 在紧急情况下竭力维护用户个人和社会大众的隐私安全。 4. 符合其他相关的要求。</p> <p>七、用户的帐号、密码和安全性<br>用户一旦注册成功，将获得一个密码和用户名。用户需谨慎合理的保存、使用用户名和密码。如果你不保管好自己的帐号和密码安全，将负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。你可随时根据指示改变你的密码。用户若发现任何非法使用用户帐号或存在安全漏洞的情况，请立即通告本网站。   八、 拒绝提供担保 用户明确同意信息服务的使用由用户个人承担风险。本网站不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保，但会在能力范围内，避免出错。</p> <p>九、有限责任<br>如因不可抗力或其它本站无法控制的原因使本站销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等本站会尽可能合理地协助处理善后事宜，并努力使客户免受经济损失，同时会尽量避免这种损害的发生。</p> <p>十、用户信息的储存和限制<br>本站有判定用户的行为是否符合国家法律法规规定及本站服务条款权利，如果用户违背本网站服务条款的规定，本网站有权中断对其提供服务的权利。</p> <p>十一、用户管理<br>用户单独承担发布内容的责任。用户对服务的使用是根据所有适用于本站的国家法律、地方法律和国际法律标准的。用户必须遵循:  1. 使用网络服务不作非法用途。 2. 不干扰或混乱网络服务。 3. 遵守所有使用网络服务的网络协议、规定、程序和惯例。 用户须承诺不传输任何非法的、骚扰性的、中伤他人的、辱骂性的、恐性的、伤害性的、庸俗的，淫秽等信息资料。另外，用户也不能传输何教唆他人构成犯罪行为的资料；不能传输助长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法律的资料。未经许可而非法进入其它电脑系统是禁止的。 若用户的行为不符合以上提到的服务条款，本站将作出独立判断立即取消用户服务帐号。用户需对自己在网上的行为承担法律责任。用户若在本站上散布和传播反动、色情或其它违反国家法律的信息，本站的系统记录有可能作为用户违反法律的证据。</p> <p>十二、通告<br>所有发给用户的通告都可通过重要页面的公告或电子邮件或常规的信件传送。服务条款的修改、服务变更、或其它重要事件的通告都会以此形式进行。</p> <p>十三、信息内容的所有权<br>本网站定义的信息内容包括: 文字、软件、声音、相片、录象、图表；在广告中全部内容；本网站为用户提供的其它信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在本网站和广告商授权下才能使用这些内容，而不能擅自复制、再造这些内容、或创造与内容有关的派生产品。本站所有的文章版权归原文作者和本站共同所有，任何人需要转载本站的文章，必须征得原文作者或本站授权。</p> <p>十四、法律<br>本协议的订立、执行和解释及争议的解决均应适用中华人民共和国的法律。用户和本网站一致同意服从本网站所在地有管辖权的法院管辖。如发生本网站服务条款与中华人民共和国法律相抵触时，则这些条款将完全按法律规定重新解释，而其它条款则依旧保持对用户的约束力。</p>
									</div>
								</td>
							</tr>
						</tbody></table>
						<div class="login">
<div class="ad">
					<dl>
	<dt>
		注册即享受
	</dt>
	<dd>
		正品保障、正规发票
	</dd>
	<dd>
		货到付款、会员服务
	</dd>
	<dd>
		自由退换、售后上门
	</dd>
</dl>
</div>							<dl>
								<dt>已经拥有账号了？</dt>
								<dd>
									立即登录即可体验在线购物！
									<a href="./login.html">立即登录</a>
								</dd>
							</dl>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="foot.jsp"/>

<div id="_my97DP" style="position: absolute; top: -1970px; left: -1970px;"><iframe style="width: 190px; height: 191px;" src="./会员注册 - Powered By Mango Team_files/My97DatePicker.htm" frameborder="0" border="0" scrolling="no"></iframe></div>


<script type="text/javascript">

// 手机号的前缀
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
			changeDisabbledButtonToFunctional("funciontalDisabled");
		} else {
			changeFunctionalButtonToDisabbled("funciontalDisabled");
		}
	}

// *****************************js验证*****************************







var sendCode = uuid();

	// 手机快速注册
	$( "#funciontalDisabled" ).click( function() {
		
		var captcha = $( "#captcha2" ).val();
		
		if (captcha != sendCode) {
			alert("验证码错误");
		} else {
			// 验证码验证成功进行跳转。通过手机号登陆！
			var phone = { "phone": $( "#phone" ).val() };
			$.ajax( {
				url: "${root}/user/data/registerByPhone.do",
				type: "post",
				data: phone,
				dataType: "json",
				success: function( result ) {
					if ( result.code == 1 ) {
						location.href = "${root}/user/login.html";
					} else {
						// 之前数据库没有用户，此时执行注册功能。
						// 然后跳转到登陆页面
						location.href = "${root}/user/register.html";
					}
				}
			} );
		}
		
	} );
	
	var thisPhoneIsNotExsit = true;
	// 再手机符合条件，输入的过程中，判断注册的时候，用户是否存在，
	function ifPhoneIsExist(thiz) {
		var phoneNumber = $( "#phone" ).val();
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
						// 手机号已注册
						thisPhoneIsNotExsit = false;
					} else {
						thisPhoneIsNotExsit = true;
					}
				}
			} );
			if (!thisPhoneIsNotExsit) {
				showFengMessage("phoneSpan", "手机号已注册", "red");
				changeFunctionalButtonToDisabbled("phoneRegisterButton");
			} else {
				showFengMessage("phoneSpan", "√", "green");
				changeDisabbledButtonToFunctional("phoneRegisterButton");
			}
		}
		if ( !isPhoneNumber(phoneNumber) ) {
			showFengMessage("phoneSpan", "×", "red");
			changeFunctionalButtonToDisabbled("phoneRegisterButton");
		}
	}
	
	$( "#phoneRegisterButton" ).click( function() {
		if ( sendCode == $( "#captcha2" ).val() ) {
			$.ajax( {
				url: "${root}/user/data/registerByPhone.do",
				type: "post",
				dataType: "json",
				data: { phone: $( "#phone" ).val() },
				success: function( result ) {
					if ( result.code == 1 ) {
						alert( result.msg );
						location.href = "${root}/user/login.html";
					} else {
						alert( result.msg );
					}
				}
			} );
		} else {
			alert("验证码错误")
		}
	} );
	
	$( "#getCode" ).click( function() {
		// 手机号正确
		var phoneNumber = $( "#phone" ).val();
		
		if (isPhoneNumber(phoneNumber) && thisPhoneIsNotExsit) {
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
			if (thisPhoneIsNotExsit) {
				alert("请输入正确手机号")
			} else {
				alert("手机号已注册")
			}
			
		}
	} );
	
	
	
	//是否输入正确的手机号标识，如果为1则为正确的手机号，为0，则为不正确的手机号
	var isPhone = 1;

	function getCode(e) {

	    checkphone(); //获取手机验证码

	    if (isPhone && thisPhoneIsNotExsit) {
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

</script>





	<script type="text/javascript">
		
		
		$( function() {
			
			// 切换手机注册或普通注册或邮箱注册
			$( "strong:contains('会员注册')" ).hover( function() {
				//alert("普通");
				$( "#normalRegister" ).css("display", "block");
				$( "#fastRegister" ).css("display", "none");
				$( "#emailRegister" ).css("display", "none");
			} );
			$( "strong:contains('手机快速注册')" ).hover( function() {
				//alert("手机");
				$( "#normalRegister" ).css("display", "none");
				$( "#fastRegister" ).css("display", "block");
				$( "#emailRegister" ).css("display", "none");
			} );
			$( "strong:contains('邮箱注册')" ).hover( function() {
				//alert("邮箱");
				$( "#normalRegister" ).css("display", "none");
				$( "#fastRegister" ).css("display", "none");
				$( "#emailRegister" ).css("display", "block");
			} );
			
			// 手机快速注册
			//doWithPhoneAndCode("btn2");
			
		} );
	
	</script>
	
	
<script type="text/javascript">

//定义一个变量，若验证码通过，则为true
var flagfeng = false;

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
			flagfeng = true;
		},
		error : function() {
//		        	alert('验证失败！');
		}
		
	});
	
	// 普通注册
	$( "#normalRegisterButton" ).click( function() {
		// 验证码通过才进行
		if (flagfeng) {
			// 执行注册动作
			//alert("执行注册动作")
			var sendData = {
				username: $( "input[name='username']" ).val(),
				password: $( "input[name='password']" ).val()
			};
			$.ajax( {
				url: "${root}/user/data/register.do",
				type: "post",
				dataType: "json",
				data: sendData,
				success: function( result ) {
					if ( result.code == 1 ) {
						alert(result.msg)
						location.href = "${root}/user/login.html";
					} else {
						alert(result.msg)
					}
				}
			} );			
			
		// 没通过
		} else {
			alert("验证码未通过")
		}
	} );
	
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
			changeDisabbledButtonToFunctional("normalRegisterButton");
		} else {
			changeFunctionalButtonToDisabbled("normalRegisterButton");
		}
	}
	
	
	
	
	var thisUsernameIsNotExsit = true;
	// 再手机符合条件，输入的过程中，判断注册的时候，用户是否存在，
	function ifUsernameExist(thiz) {
		var username = $( "#username" ).val();
		if (isUsername(username)) {
			// 从数据库拿数据
			var usernameObj = { "username": $( "#username" ).val() };
			$.ajax( {
				url: "${root}/user/data/findUsername.do",
				type: "post",
				data: usernameObj,
				dataType: "json",
				success: function( result ) {
					if ( result.code == 1 ) {
						// 用户已存在
						thisUsernameIsNotExsit = false;
					} else {
						thisUsernameIsNotExsit = true;
					}
				}
			} );
			if (!thisUsernameIsNotExsit) {
				showFengMessage("usernameSpan", "用户名已存在", "red");
				//$( "#usernameSpan" ).html("<font size='5px' color='red'>用户名已存在</font>");
				thisUsernameIsNotExsit = false;
			} else {
				showFengMessage("usernameSpan", "√", "green");
				//$( "#usernameSpan" ).html("<font size='5px' color='green'>√</font>");
				thisUsernameIsNotExsit = true;
			}
		}
		if ( !isUsername(username) ) {
			showFengMessage("usernameSpan", "×", "red");
			//$( "#usernameSpan" ).html("<font size='5px' color='red'>×</font>");
		}
	}

	
	
	
	
	var thisEmailIsNotExsit = true;
	// 在邮箱符合条件，输入的过程中，判断注册的时候，用户是否存在，
	function ifEmailIsExist(thiz) {
		var email = $( "#email" ).val();
		if (isEmail(email)) {
			// 从数据库拿数据
			var emailObj = { "email": $( "#email" ).val() };
			$.ajax( {
				url: "${root}/user/data/findEmail.do",
				type: "post",
				data: emailObj,
				dataType: "json",
				success: function( result ) {
					if ( result.code == 1 ) {
						// 邮箱已存在
						thisEmailIsNotExsit = false;
					} else {
						thisEmailIsNotExsit = true;
					}
				}
			} );
			if (!thisEmailIsNotExsit) {
				showFengMessage("emailSpan", "邮箱已存在", "red");
				changeFunctionalButtonToDisabbled("emailRegisterButton");
			} else {
				showFengMessage("emailSpan", "√", "green");
				changeDisabbledButtonToFunctional("emailRegisterButton");
			}
		}
		if ( !isEmail(email) ) {
			showFengMessage("emailSpan", "×", "red");
			changeFunctionalButtonToDisabbled("emailRegisterButton");
		}
	}
	
	$( "#emailRegisterButton" ).click( function() {
		$.ajax( {
			url: "${root}/user/data/registerByEmail.do",
			type: "post",
			data: { email: $( "#email" ).val() },
			dataType: "json",
			success: function( result ) {
				if ( result.code == 1 ) {
					alert(result.msg);
				} else {
					alert(result.msg);
				}
			}
		} );
	} );
	
</script>


</body>
</html>