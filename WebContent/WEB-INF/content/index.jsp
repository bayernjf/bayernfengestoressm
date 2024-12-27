<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set value="${pageContext.request.contextPath }" var="root"/>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>意坚商城</title>
	<script type="text/javascript" src="${root }/static-resources/js/bayernfeng.js"></script>
	<link href="${root }/static-resources/css/bayernfeng.css" rel="stylesheet" type="text/css"/>

	<script type="text/javascript" src="${root }/static-resources/js/jquery-3.5.1.js"></script>

	<link href="${root }/static-resources/css/slider.css" rel="stylesheet" type="text/css"/>
	<link href="${root }/static-resources/css/common.css" rel="stylesheet" type="text/css"/>
	<link href="${root }/static-resources/css/index.css" rel="stylesheet" type="text/css"/>

</head>
<body>

	<jsp:include page="head.jsp"/>
	
	
	
	
	<div class="container index">
		

		<div class="span24">
			<div id="hotProduct" class="hotProduct clearfix">
					<div class="title">
						<strong>热门商品</strong>
						<!-- <a  target="_blank"></a> -->
					</div>
					<ul class="tab">
							<li class="current">
								<a href="./蔬菜分类.htm?tagIds=1" target="_blank"></a>
							</li>
							<li>
								<a  target="_blank"></a>
							</li>
							<li>
								<a target="_blank"></a>
							</li>
					</ul>
<!-- 					<div class="hotProductAd">
			<img src="${root }/static-resources/image/a.jpg" width="260" height="343" alt="热门商品" title="热门商品">
</div> -->
						<!-- 从后台获得的json数据，然后循环展示。Ajax -->
						<ul id="topTenPopularGoods" class="tabContent" style="display: block;">
							<%-- <li>
								<a target="_blank"><img src="${root }/static-resources/image/b.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/0ff130db-0a1b-4b8d-a918-ed9016317009-thumbnail.jpg" style="display: block;"></a>
							</li> --%>
						</ul>
			</div>
		</div>
		<div class="span24">
			<div id="newProduct" class="newProduct clearfix">
					<div class="title">
						<strong>最新商品</strong>
						<a  target="_blank"></a>
					</div>
					<ul class="tab">
							<li class="current">
								<a href="./蔬菜分类.htm?tagIds=2" target="_blank"></a>
							</li>
							<li>
								<a  target="_blank"></a>
							</li>
							<li>
								<a target="_blank"></a>
							</li>
					</ul>
<!-- 					<div class="newProductAd">
									<img src="${root }/static-resources/image/q.jpg" width="260" height="343" alt="最新商品" title="最新商品">
						</div>
						 -->						
						 <ul id="topTenNewGoods" class="tabContent" style="display: block;">
									<%-- <li>
										<a  target="_blank"><img src="${root }/static-resources/image/l.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/4a51167a-89d5-4710-aca2-7c76edc355b8-thumbnail.jpg" style="display: block;"></a>									
									</li> --%>
									
						</ul>
			</div>
		</div>
		<div class="span24">
			<div class="friendLink">
				<dl>
					<dt>新手指南</dt>
							<dd>
								<a  target="_blank">支付方式</a>
								|
							</dd>
							<dd>
								<a  target="_blank">配送方式</a>
								|
							</dd>
							<dd>
								<a  target="_blank">售后服务</a>
								|
							</dd>
							<dd>
								<a  target="_blank">购物帮助</a>
								|
							</dd>
							<dd>
								<a  target="_blank">蔬菜卡</a>
								|
							</dd>
							<dd>
								<a  target="_blank">礼品卡</a>
								|
							</dd>
							<dd>
								<a target="_blank">银联卡</a>
								|
							</dd>
							<dd>
								<a  target="_blank">亿家卡</a>
								|
							</dd>
							
					<dd class="more">
						<a >更多</a>
					</dd>
				</dl>
			</div>
		</div>
	</div>
	
	
	
	
	<jsp:include page="foot.jsp"/>
	
	
	<!-- 在这写也行。。。最好再bayernfeng.js文件里写 -->
	<script type="text/javascript">
	
		$( function() {
			
			// 利用ajax来获取出去。json
			$.ajax( {
				
			} );
			
		} );
	
	</script>
	
	<script type="text/javascript">
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
							var content = "<li><a href='${root}/good/goodDetail.html/"+thiz.id+"'><img src='/upload/image/"+thiz.titleimage+"' style='display: block;'></a></li>";
							$( "#topTenPopularGoods" ).append( content );
						} );
					} else {
						var content = "未找到内容";
						$( "#topTenPopularGoods" ).append( content );
					}
				}
			} );
		}
		showTopTenPopularGoods();
		
		// 展示最热门的十个产品
		var showTopTenNewGoods = function() {
			$.ajax( {
				url: "/"+root+"/index/getTopTenNewGoods.do",
				type: "post",
				dataType: "json",
				success: function( result ) {
					if ( result.code == 1 ) {
						// 把拿到的json数据循环遍历
						$.each( result.msg, function( index, thiz ) {
							var content = "<li><a href='${root}/good/goodDetail.html/"+thiz.id+"'><img src='/upload/image/"+thiz.titleimage+"' style='display: block;'></a></li>";
							$( "#topTenNewGoods" ).append( content );
						} );
					} else {
						var content = "未找到内容";
						$( "#topTenNewGoods" ).append( content );
					}
				}
			} );
		}
		showTopTenNewGoods();
	</script>

</body>
</html>