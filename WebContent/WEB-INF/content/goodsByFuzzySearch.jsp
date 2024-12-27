<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set value="${pageContext.request.contextPath }" var="root"/>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询页面</title>
	<script type="text/javascript" src="${root }/static-resources/js/bayernfeng.js"></script>
	<link href="${root }/static-resources/css/bayernfeng.css" rel="stylesheet" type="text/css"/>

	<script type="text/javascript" src="${root }/static-resources/js/jquery-3.5.1.js"></script>

	<link href="${root }/static-resources/css/slider.css" rel="stylesheet" type="text/css"/>
	<link href="${root }/static-resources/css/common.css" rel="stylesheet" type="text/css">
	<link href="${root }/static-resources/css/product.css" rel="stylesheet" type="text/css">

</head>
<body>

	<jsp:include page="head.jsp"/>
	
	<div class="container productList">
		<div class="span6">
			 <!-- 引入左边的导航栏 -->
			 <jsp:include page="left.jsp"/>
		</div>
		<div class="span18 last">
			
			<form id="productForm" action="" method="get">
				<input type="hidden" id="brandId" name="brandId" value="">
				<input type="hidden" id="promotionId" name="promotionId" value="">
				<input type="hidden" id="orderType" name="orderType" value="">
				<input type="hidden" id="pageNumber" name="pageNumber" value="1">
				<input type="hidden" id="pageSize" name="pageSize" value="20">
					
				<div id="result" class="result table clearfix">
					<ul id="goodsByFuzzySearch">
					</ul>
				</div>
				每页显示数：
				<select id="changePageSize">
					<option value="4">4</option>
					<option value="8">8</option>
					<option value="12">12</option>
					<option value="16">16</option>
				</select>
				当前页数：<font color="blue" id="messageOfPage">1</font>
					，共：<font color="blue" id="messageOfTotalPages">7</font>&nbsp;页
				<div id="pagination" class="pagination">
				</div>
			</form>
		</div>
	</div>
	
	<jsp:include page="foot.jsp"/>
	
<script type="text/javascript">
	var root = location.pathname.split("/")[1];
	var pageSize = sessionStorage.getItem("pageSize");
	if ( pageSize == null ) {
		pageSize = 4;
	}
	//模糊查询
	$.ajax( {
		url: "${root }/good/data/showGoodsByFuzzySearch.do/${keyWords}/${pageNo}",
		type: "post",
		dataType: "json",
		data: { pageSize: pageSize },
		success: function( result ) {
			if ( result.code == 1 ) {
				/* if ( result.keyWords != "-1" ) {
					$( "input[name='keyWords']" ).val( result.keyWords );
				} */
				// 把拿到的json数据循环遍历
				$.each( result.msg, function( index, thiz ) {
					var content = "\
						<li>\
							<a href='${root}/good/goodDetail.html/"+thiz.id+"'>\
								<img src='/upload/image/"+thiz.titleimage+"' width='170' height='170'  style='display: inline-block;'>\
								<span style='color:green'>\
								 	"+thiz.name+"\
								</span>\
								<span class='price'>\
									商城价： ￥"+thiz.estoreprice+"/份\
								</span>\
							</a>\
						</li>\
					";
					$( "#goodsByFuzzySearch" ).append( content );
				} );
			
				// 遍历显示分页的按钮
				// 点击的页码数
				var currentPageNo = location.href.substring(location.href.lastIndexOf("/") + 1);
				var content;
				// 第一页
				if ( currentPageNo == 1 ) {
					
					// 需要判断是否只有一页
					if ( result.mapOfPageInfo.totalPages != 1 ) {
						// 遍历显示分页的按钮
						content = "\
							<span class='firstPage'></span>\
							<span class='previousPage'></span>\
							<span class='currentPage'>1</span>\
						";
						$( "#pagination" ).append( content );
						$.each( result.mapOfPageInfo.listOfPageNo, function( index, thiz ) {
							if ( thiz != currentPageNo ) {
								content = "<a href='${root }/good/goodsByFuzzySearch.html/${keyWords}/"+thiz+"'>"+thiz+"</a>";
								$( "#pagination" ).append( content );
							}
						} );
						content = "\
							<a class='nextPage' href='${root }/good/goodsByFuzzySearch.html/${keyWords}/"+(parseInt(currentPageNo)+1)+"'></a>\
							<a class='lastPage' href='${root }/good/goodsByFuzzySearch.html/${keyWords}/"+result.mapOfPageInfo.totalPages+"'></a>\
						";
						$( "#pagination" ).append( content );
					} else {
						content = "\
							<span class='firstPage'></span>\
							<span class='previousPage'></span>\
							<span class='currentPage'>1</span>\
							<span class='nextPage'></span>\
							<span class='lastPage'></span>\
						";
						$( "#pagination" ).append( content );
					}
					
				// 最后一页
				} else if ( currentPageNo == result.mapOfPageInfo.totalPages ) {
					// 遍历显示分页的按钮
					content = "\
						<a class='firstPage' href='${root }/good/goodsByFuzzySearch.html/${keyWords}/1'></a>\
						<a class='previousPage' href='${root }/good/goodsByFuzzySearch.html/${keyWords}/"+(parseInt(currentPageNo)-1)+"'></a>\
					";
					$( "#pagination" ).append( content );
					$.each( result.mapOfPageInfo.listOfPageNo, function( index, thiz ) {
						if ( thiz != currentPageNo ) {
							content = "<a href='${root }/good/goodsByFuzzySearch.html/${keyWords}/"+thiz+"'>"+thiz+"</a>";
							$( "#pagination" ).append( content );
						}
					} );
					content = "\
						<span class='currentPage'>"+result.mapOfPageInfo.totalPages+"</span>\
						<span class='nextPage'></span>\
						<span class='lastPage'></span>\
					";
					$( "#pagination" ).append( content );
					
				// 其他页码数，有点特殊
				} else {
					// 遍历显示分页的按钮
					content = "\
						<a class='firstPage' href='${root }/good/goodsByFuzzySearch.html/${keyWords}/1'></a>\
						<a class='previousPage' href='${root }/good/goodsByFuzzySearch.html/${keyWords}/"+(parseInt(currentPageNo)-1)+"'></a>\
					";
					$( "#pagination" ).append( content );
					$.each( result.mapOfPageInfo.listOfPageNo, function( index, thiz ) {
						if ( thiz < currentPageNo ) {
							content = "<a href='${root }/good/goodsByFuzzySearch.html/${keyWords}/"+thiz+"'>"+thiz+"</a>";
							$( "#pagination" ).append( content );
						} else if ( thiz == currentPageNo ) {
							content = "<span class='currentPage'>"+thiz+"</span>";
							$( "#pagination" ).append( content );
						} else {
							content = "<a href='${root }/good/goodsByFuzzySearch.html/${keyWords}/"+thiz+"'>"+thiz+"</a>";
							$( "#pagination" ).append( content );
						}
					} );
					content = "\
						<a class='nextPage' href='${root }/good/goodsByFuzzySearch.html/${keyWords}/"+(parseInt(currentPageNo)+1)+"'></a>\
						<a class='lastPage' href='${root }/good/goodsByFuzzySearch.html/${keyWords}/"+result.mapOfPageInfo.totalPages+"'></a>\
					";
					$( "#pagination" ).append( content );
				}
				
				$( "#messageOfPage" ).text( currentPageNo );
				$( "#messageOfTotalPages" ).text( result.mapOfPageInfo.totalPages );
				
			} else {
				$( "#messageOfPage" ).text( 0 );
				$( "#messageOfTotalPages" ).text( 0 );
				var content = "<h1 align='center'>此种类还没有商品</h1>";
				$( "#goodsByFuzzySearch" ).append( content );
			}
			
		}
	} );

	
	$( "#changePageSize option[value='"+pageSize+"']" ).attr("selected", "selected");
	$( "#changePageSize" ).change( function() {
		// 改变后，把pageSize存到sessionStorage中
		sessionStorage.setItem("pageSize", $(this).val());
		//alert( sessionStorage.getItem("pageSize") == null );
		$( "#pagination" ).empty();
		location.href = location.href;
	} );
</script>
</body>
</html>