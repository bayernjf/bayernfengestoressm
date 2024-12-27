<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set value="${pageContext.request.contextPath }" var="root"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
	<script type="text/javascript" src="${root }/static-resources/js/bayernfeng.js"></script>
	<link href="${root }/static-resources/css/bayernfeng.css" rel="stylesheet" type="text/css"/>
	
	<link href="${root }/static-resources/css/common.css" rel="stylesheet" type="text/css">
	<link href="${root }/static-resources/css/product.css" rel="stylesheet" type="text/css">

</head>
<body>

	<div class="container productList">
		<div class="span6">
			<div id="showAllCategories" class="hotProductCategory">
				
			</div>
		</div>
	</div>
	
	
<script type="text/javascript">
	var root = location.pathname.split("/")[1];
	var showAllCategories = function() {
		$.ajax( {
			url: "/"+root+"/category/showAllcategories.do",
			type: "post",
			dataType: "json",
			success: function( result ) {
				if ( result.code == 1 ) {
					/*	result.msg
					 *  {
					 *  	"childrenCate":[{"id":2,"parentid":1,"type":"无公害蔬菜"},{"id":3,"parentid":1,"type":"特菜类"},{"id":4,"parentid":1,"type":"有机蔬菜"}],
					 *  	"id":1,
					 *  	"type":"蔬菜"
					 *  }
					 */
					$.each( result.msg, function( index, thiz ) {
						var content = "\
							<dl>\
								<dt id='category"+thiz.id+"'>\
									<a onclick='showGoodsByCategory_Id();' href='${root}/good/showGoodsByCategory_Id.html/"+thiz.id+"/1'>"+thiz.type+"</a>\
								</dt>\
							</dl>\
						";
						$( "#showAllCategories" ).append( content );
						$.each( thiz.childrenCate, function( childIndex, childThiz ) {
							var childContent = "\
								<dd>\
									<a onclick='showGoodsByCategory_Id();' href='${root}/good/showGoodsByCategory_Id.html/"+childThiz.id+"/1'>"+childThiz.type+"</a>\
								</dd>\
							";
							$( "#category"+thiz.id ).after( childContent );
						} );
					} );
				} else {
					var content = "未找到信息";
					$( "#showAllCategories" ).append( content );
				}
			}
		} );
	}
	showAllCategories();
</script>
	
	
	
	
	
	















<!-- <script type="text/javascript">
		var root = location.pathname.split("/")[1];
		var showGoodsByCategoryByDefault = function() {
			$.ajax( {
				url: "/"+root+"/category/default.do",
				type: "post",
				dataType: "json",
				success: function( result ) {
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
					} else {
						var content = "未找到信息";
						$( "#showGoodsByCategory" ).append( content );
					}
				}
			} );
		}
		//showGoodsByCategoryByDefault();
	</script> -->
</body>
</html>