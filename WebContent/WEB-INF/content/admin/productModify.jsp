<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set value="${pageContext.request.contextPath }" var="root"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Modern an Admin Panel Category Flat Bootstarp Resposive Website Template | Typography :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="${root }/static-resources/admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="${root }/static-resources/admin/css/style.css" rel='stylesheet' type='text/css' />
<link href="${root }/static-resources/admin/css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="${root }/static-resources/admin/js/jquery.min.js"></script>
<!----webfonts--->
<link href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
<!---//webfonts--->  
<!-- Bootstrap Core JavaScript -->
<script src="${root }/static-resources/admin/js/bootstrap.min.js"></script>
</head>
<body>
<div id="wrapper">
     <!-- Navigation -->
        
        <jsp:include page="nav.jsp"/>
        
        <div id="page-wrapper">
        <div class="col-md-12 graphs">
	   <div class="xs">
  	    <h3>商品修改</h3>
  	    <div style="display: block;" id="singleAdd" class="well1 white">
	        <form action="${root }/admin/data/productModify.do" method="post" enctype="multipart/form-data" class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()">
	 			<fieldset>
	            <div class="form-group">
	              <label class="control-label">商品名称</label>
	              <input value="${goodToBeModified.name }" name="name" type="text" class="form-control1 ng-invalid ng-invalid-required ng-touched" ng-model="model.name" required="true">
	            </div>
	            <div class="form-group">
	              <label class="control-label">市场价</label>
	              <input value="${goodToBeModified.marketprice }" name="marketprice" type="email" class="form-control1 ng-invalid ng-valid-email ng-invalid-required ng-touched" ng-model="model.email" required="">
	            </div>
	            <div class="form-group">
	              <label class="control-label">网站价格</label>
	              <input value="${goodToBeModified.estoreprice }" name="estoreprice" type="text" class="form-control1 ng-invalid ng-invalid-required ng-touched" ng-model="model.password" required="">
	            </div>
	            <div class="form-group filled">
					<span id="parentidOfCategory" style="display: none;">${goodToBeModified.category.parentid }</span>
					<span id="idOfCategory" style="display: none;">${goodToBeModified.category_id }</span>
	              <label class="control-label">商品种类</label>
	              	父类：<select id="category_idFu" name="category_idFu" >
	              	<option value="feng"></option>
	              </select>
	              	子类：<select id="category_idZi" name="category_idZi" >
	              	<option value="feng"></option>
	              </select>
	            </div>
	            <div class="form-group">
	              <label class="control-label">库存</label>
	              <input value="${goodToBeModified.num }" name="num" type="text" class="form-control1 ng-invalid ng-invalid-required ng-valid-pattern ng-touched" ng-model="model.number" ng-pattern="/[0-9]/" required="">
	              <!-- <p class="help-block hint-block">Numeric values from 0-***</p> -->
	            </div>
	            <div class="form-group">
	              <label class="control-label">商品缩略图</label>
	              <img style="width: 40px; height: 40px; border-radius: 25px" alt="" src="/upload/image/${goodToBeModified.titleimage }">
	              <input name="titleimage" type="file">
	            </div>
	            <div class="form-group">
	              <label class="control-label">商品描述</label>
	            	<textarea id="description" rows="" cols="" name="description" >${goodToBeModified.description }</textarea>
	            </div>
	            <div class="form-group">
	              <label class="control-label normal">生产日期</label>
	              <input value='<fmt:formatDate value="${goodToBeModified.production_date }" pattern="yyyy-MM-dd"/>' name="production_date" type="date" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">
	            </div>
	            <div class="form-group">
	              <label class="control-label normal">过期时间</label>
	              
	              <input value='<fmt:formatDate value="${goodToBeModified.expiry_date }" pattern="yyyy-MM-dd"/>' name="expiry_date" type="date" class="form-control1 ng-invalid ng-invalid-required" ng-model="model.date" required="">
	            </div>
	            <div class="form-group filled">
	              <label class="control-label">是否上架</label>
	              	<select id="stat" name="stat" >
	              	<option value="1">上架</option>
	              	<option value="0">暂不上架</option>
	              </select>
	            </div>
	            <div class="form-group">
	              <button type="submit" class="btn btn-primary">Submit</button>
	              <button type="reset" class="btn btn-default" onclick="return fengconfirm();">Reset</button>
	            </div>
	          </fieldset>
 			</form>
      </div>
      
    </div>
    <div class="copy_layout">
      <p>Copyright © 2015 Modern. All Rights Reserved | Design by <a href="http://h2design.taobao.com/" target="_blank">氢设计</a> </p>
   </div>
   </div>
      </div>
      </div>
      <!-- /#page-wrapper -->
   </div>
    <!-- /#wrapper -->
<!-- Nav CSS -->
<link href="${root }/static-resources/admin/css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="${root }/static-resources/admin/js/metisMenu.min.js"></script>
<script src="${root }/static-resources/admin/js/custom.js"></script>


<script type="text/javascript">

	var root = location.pathname.split("/")[1];
	var fengcategories = {  };
	// 拿到分类以后，动态存在fengcategories里面
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
					 /*
					 
					 	var fengcategories = { 
								1: {
									type: "蔬菜",
									childrenCate: {
										2: "无公害蔬菜"
									}
								}
						};
					 
					 */
					$.each( result.msg, function( index, thiz ) {
						var childrenCate = {  };
						$.each( thiz.childrenCate, function( childIndex, childThiz ) {
							childrenCate[childThiz.id] = childThiz.type;
						} );
						fengcategories[thiz.id] = {
								"type": thiz.type,
								"childrenCate": childrenCate
						};
					} );
					
					// 所有种类遍历显示到select中
					jiangfengjiang();
				} else {
					var content = "未找到信息";
					$( "#showAllCategories" ).append( content );
				}
			}
		} );
	}
	showAllCategories();
	
	
	function showChildrenCate() {
		// 当province的值改变的时候，遍历city
		// 先清空城市选项
		//$( "#city" ).empty();		
		$( "#category_idZi" ).children( "option:not(:first)" ).remove();
		var childrenCates = fengcategories[$( "#category_idFu" ).val()]["childrenCate"];
		$.each( childrenCates, function( key, thiz ) {
			$( "#category_idZi" ).append( "<option value='"+key+"'>"+thiz+"</option>" );
		} );
		
		// 修改的时候，根据需要修改的内容，先做显示
		var val = $( "#idOfCategory" ).text();
		$( "#category_idZi option[value='"+val+"']" ).attr("selected", "selected");
	}
	
	$( "#category_idFu" ).change( showChildrenCate );
	
	function jiangfengjiang() {
		$.each( fengcategories, function( keyIfObj, thiz ) {
			//alert("keyIfObj: " + keyIfObj + " -> thiz(当前值): " + JSON.stringify(thiz))
			$( "#category_idFu" ).append( "<option value='"+keyIfObj+"'>"+thiz.type+"</option>" );
		} );
		
		// 修改的时候，根据需要修改的内容，先做显示
		var val = $( "#parentidOfCategory" ).text();
		$( "#category_idFu option[value='"+val+"']" ).attr("selected", "selected");
		showChildrenCate();
	}
	
	
</script>


<script type="text/javascript">
	
	$( "span:contains('单个商品添加')" ).click( function() {
		$( "#singleAdd" ).css("display", "block");
		$( "#multiAdd" ).css("display", "none");
	} );
	$( "span:contains('批量商品添加')" ).click( function() {
		$( "#singleAdd" ).css("display", "none");
		$( "#multiAdd" ).css("display", "block");
	} );
	
	
	
	
	function fengconfirm() {
		return confirm("是否操作？");
	}
	
</script>

<script type="text/javascript" src="${root }/static-resources/admin/kindeditor-4.1.10/kindeditor.js"></script>
<script>
KindEditor.ready(function(k){
k.create("#description",{
	uploadJson : "${root }/static-resources/admin/kindeditor-4.1.10/jsp/upload_json.jsp",
	fileManagerJson : "${root }/static-resources/admin/kindeditor-4.1.10/jsp/file_manager_json.jsp",
	allowFileManager : true

	});
})
</script>

</body>
</html>
