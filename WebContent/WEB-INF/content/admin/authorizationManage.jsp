<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="graphs">



		<div class="grid_3 grid_5">
	       <h3>权限管理设置</h3>
	     	<br>
	       <h5>请选择需要设置的角色:</h5>
	       <select name="role_id">
	     		<option value="-1">---选择角色---</option>
			<c:forEach items="${requestScope.roles }" var="role">
				<option value="${role.id }">${role.name }</option>
			</c:forEach>
			</select>
	     <form>
	     <div class="but_list">
	       <div class="alert alert-success" role="alert">
	        <strong>后台管理</strong><br>
	         	添加用户：<input id="auth_2" type="checkbox">&nbsp;&nbsp;|
	         	角色管理：<input id="auth_3" type="checkbox">&nbsp;&nbsp;|
	         	权限管理：<input id="auth_4" type="checkbox">
	       </div>
	       <div class="alert alert-info" role="alert">
	        <strong>商品管理里</strong><br>
	        	发布商品：<input id="auth_6" type="checkbox">&nbsp;&nbsp;|
	         	商品操作：<input id="auth_7" type="checkbox">&nbsp;&nbsp;|
	         	已下架商品：<input id="auth_8" type="checkbox">
	       </div>
	       <div class="alert alert-warning" role="alert">
	        <strong>订单管理</strong><br>
	         	待支付订单：<input id="auth_10" type="checkbox">&nbsp;&nbsp;|
	         	已支付订单：<input id="auth_11" type="checkbox">&nbsp;&nbsp;|
	         	已发货订单：<input id="auth_12" type="checkbox">&nbsp;&nbsp;|
	         	已完成订单：<input id="auth_13" type="checkbox">&nbsp;&nbsp;|
	         	已取消订单：<input id="auth_14" type="checkbox">
	       </div>
	       <!-- <div class="alert alert-danger" role="alert">
	        <strong>Oh snap!</strong>
	         Change a few things up and try submitting again.
	       </div> -->
	     </div>
	     	<input type="button" value="提交修改">
	     </form>
	   </div>

   
         <div class="copy_layout">
         <p>Copyright © 2015 Modern. All Rights Reserved | Design by <a href="http://h2design.taobao.com/" target="_blank">氢设计</a> </p>
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

	$( "select[name='role_id']" ).change( function() {
		var role_id = $(this).val();
		if ( role_id != -1 ) {
			// 根据role_id在表admin_role_authorization中找多个authorization_id
			var sendData = {
					"role_id": role_id
			};
			$.ajax( {
				url: "${root}/admin/data/findAuthorizationsByRole_Id.do",
				type: "post",
				dataType: "json",
				data: sendData,
				success: function( result ) {
					if ( result.code == "1" ) {
						//alert( result.msg );
						//alert( result.authorizations );
						$.each( $( ":checkbox" ), function( index, thiz ) {
							$(thiz).removeAttr("checked");
						} );
						$.each( result.authorizations, function( index, thiz ) {
							//alert(index+" -> " + thiz.authorization_id)
							var checkbookId = "auth_" + thiz.authorization_id;
							$( "#"+checkbookId ).prop("checked", true);
						} );
					} else {
						//alert("操作失败");
						$.each( $( ":checkbox" ), function( index, thiz ) {
							$(thiz).removeAttr("checked");
						} );
					}
				}
			} );
		}
	} );
	
	
	// 提交修改
	$( ":button[value='提交修改']" ).click( function() {
		var ids = {};
		$.each( $( ":checkbox" ), function( index, thiz ) {
			if ( $(thiz).prop("checked") ) {
				//alert(thiz.id.substring("auth_".length))
				ids[thiz.id.substring("auth_".length)] = thiz.id.substring("auth_".length);
			}
		} );
		//alert(JSON.stringify(ids));
		//alert($( "option:selected" ).val())
		if ( $( "option:selected" ).val() != "-1" ) {
			var sendData = {
					role_id: $( "option:selected" ).val(),
					"ids": JSON.stringify(ids)
			};
			$.ajax( {
				url: "${root}/admin/data/updateAuthorizationsForRole_Id.do",
				type: "post",
				dataType: "json",
				data: sendData,
				success: function( result ) {
					if ( result.code == "1" ) {
						alert( result.msg );
					}
				}
			} );
		}
		
	} );
	
</script>


</body>
</html>
