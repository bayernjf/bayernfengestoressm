<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set value="${pageContext.request.contextPath }" var="root"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类页面</title>
	<script type="text/javascript" src="${root }/static-resources/js/bayernfeng.js"></script>
	<link href="${root }/static-resources/css/bayernfeng.css" rel="stylesheet" type="text/css"/>
	
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
					<ul id="showGoodsByCategory">
						<%-- <li>
							<a href="./京华商城分页面.htm">
								<img src="${root }/static-resources/image/4a51167a-89d5-4710-aca2-7c76edc355b8-thumbnail.jpg" width="170" height="170"  style="display: inline-block;">
								<span style='color:green'>
								 	大冬瓜
								</span>
								<span class="price">
									商城价： ￥4.78/份
								</span>
							</a>
						</li> --%>
					</ul>
				</div>
				<div id="paginationContainer">
					
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
					<%-- <a class="firstPage" href="${root }/good/showGoodsByCategory_Id.html/0/2"></a>
					<a class="previousPage" href="${root }/good/showGoodsByCategory_Id.html/0/2"></a>
					
					<a href="${root }/good/showGoodsByCategory_Id.html/0/2">2</a>
					<span class="currentPage">1</span>
					<a href="${root }/good/showGoodsByCategory_Id.html/0/2">2</a>
					
					<a class="nextPage" href="${root }/good/showGoodsByCategory_Id.html/0/2"></a>
					<a class="lastPage" href="${root }/good/showGoodsByCategory_Id.html/0/2"></a> --%>
					
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
	var showGoodsByCategory_Id = function() {
		$( "#showGoodsByCategory" ).empty();
		$.ajax( {
			url: "/"+root+"/good/data/getGoodsByCategory_Id.do/${category_id}/${pageNo}",
			type: "post",
			dataType: "json",
			data: { pageSize: pageSize },
			success: function( result ) {
				/* alert( "count -> " + result.mapOfPageInfo.count );
				alert( "pageNo -> " + result.mapOfPageInfo.pageNo );
				alert( "pageSize -> " + result.mapOfPageInfo.pageSize );
				alert( "totalPages -> " + result.mapOfPageInfo.totalPages );
				alert( "showPageNum -> " + result.mapOfPageInfo.showPageNum );
				alert( "listOfPageNo -> " + result.mapOfPageInfo.listOfPageNo ); */
				if ( result.code == 1 ) {
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
							</li>";
						$( "#showGoodsByCategory" ).append( content );
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
									content = "<a href='${root }/good/showGoodsByCategory_Id.html/${category_id}/"+thiz+"'>"+thiz+"</a>";
									$( "#pagination" ).append( content );
								}
							} );
							content = "\
								<a class='nextPage' href='${root }/good/showGoodsByCategory_Id.html/${category_id}/"+(parseInt(currentPageNo)+1)+"'></a>\
								<a class='lastPage' href='${root }/good/showGoodsByCategory_Id.html/${category_id}/"+result.mapOfPageInfo.totalPages+"'></a>\
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
							<a class='firstPage' href='${root }/good/showGoodsByCategory_Id.html/${category_id}/1'></a>\
							<a class='previousPage' href='${root }/good/showGoodsByCategory_Id.html/${category_id}/"+(parseInt(currentPageNo)-1)+"'></a>\
						";
						$( "#pagination" ).append( content );
						$.each( result.mapOfPageInfo.listOfPageNo, function( index, thiz ) {
							if ( thiz != currentPageNo ) {
								content = "<a href='${root }/good/showGoodsByCategory_Id.html/${category_id}/"+thiz+"'>"+thiz+"</a>";
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
							<a class='firstPage' href='${root }/good/showGoodsByCategory_Id.html/${category_id}/1'></a>\
							<a class='previousPage' href='${root }/good/showGoodsByCategory_Id.html/${category_id}/"+(parseInt(currentPageNo)-1)+"'></a>\
						";
						$( "#pagination" ).append( content );
						$.each( result.mapOfPageInfo.listOfPageNo, function( index, thiz ) {
							if ( thiz < currentPageNo ) {
								content = "<a href='${root }/good/showGoodsByCategory_Id.html/${category_id}/"+thiz+"'>"+thiz+"</a>";
								$( "#pagination" ).append( content );
							} else if ( thiz == currentPageNo ) {
								content = "<span class='currentPage'>"+thiz+"</span>";
								$( "#pagination" ).append( content );
							} else {
								content = "<a href='${root }/good/showGoodsByCategory_Id.html/${category_id}/"+thiz+"'>"+thiz+"</a>";
								$( "#pagination" ).append( content );
							}
						} );
						content = "\
							<a class='nextPage' href='${root }/good/showGoodsByCategory_Id.html/${category_id}/"+(parseInt(currentPageNo)+1)+"'></a>\
							<a class='lastPage' href='${root }/good/showGoodsByCategory_Id.html/${category_id}/"+result.mapOfPageInfo.totalPages+"'></a>\
						";
						$( "#pagination" ).append( content );
					}
					
					$( "#messageOfPage" ).text( currentPageNo );
					$( "#messageOfTotalPages" ).text( result.mapOfPageInfo.totalPages );
				} else {
					$( "#messageOfPage" ).text( 0 );
					$( "#messageOfTotalPages" ).text( 0 );
					var content = "<h1 align='center'>此种类还没有商品</h1>";
					$( "#showGoodsByCategory" ).append( content );
				}
			}
		} );
	}
	showGoodsByCategory_Id();
	
	$( "#changePageSize option[value='"+pageSize+"']" ).attr("selected", "selected");
	$( "#changePageSize" ).change( function() {
		// 改变后，把pageSize存到sessionStorage中
		sessionStorage.setItem("pageSize", $(this).val());
		//alert( sessionStorage.getItem("pageSize") == null );
		$( "#pagination" ).empty();
		//showGoodsByCategory_Id();
		// http://localhost:8080/bayernfengestoressm/good/showGoodsByCategory_Id.html/0/1
		location.href = location.href;
	} );
</script>

</body>
</html>