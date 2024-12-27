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

<input id="user_id" type="hidden" value="${sessionScope.user.id }">


   <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
       <!-- /.navbar-header -->
       <div class="navbar-default sidebar" role="navigation">
           <div class="sidebar-nav navbar-collapse">
               <ul class="nav" id="side-menu">
                   <li>
                       <a href="${root }/user/userHome.html"><i class="fa fa-dashboard fa-fw nav_icon"></i>个人中心</a>
                   </li>
                   <li>
                       <a href="#"><i class="fa fa-envelope nav_icon"></i>订单管理<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                           <li>
                               <a href="">待支付订单</a>
                           </li>
                           <li>
                               <a href="">已支付订单</a>
                           </li>
                           <li>
                               <a href="">已发货订单</a>
                           </li>
                           <li>
                               <a href="">已完成订单</a>
                           </li>
                           <li>
                               <a href="">已取消订单</a>
                           </li>
                       </ul>
                       <!-- /.nav-second-level -->
                   </li>
               </ul>
           </div>
           <!-- /.sidebar-collapse -->
       </div>
       <!-- /.navbar-static-side -->
   </nav>

<!-- Nav CSS -->
<link href="${root }/static-resources/admin/css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="${root }/static-resources/admin/js/metisMenu.min.js"></script>
<script src="${root }/static-resources/admin/js/custom.js"></script>

<script type="text/javascript">

	$( "a" ).click( function() {
		var user_id = $( "#user_id" ).val();
		var text = $( this ).text();
		var stat = -1;
		switch (text) {
		case "待支付订单":
			stat = 1;
			break;
		case "已支付订单":
			stat = 2;
			break;
		case "已发货订单":
			stat = 3;
			break;
		case "已完成订单":
			stat = 4;
			break;
		case "已取消订单":
			stat = 5;
			break;
		default:
			stat = -1;
			break;
		}
		if ( stat != -1 ) {
			//alert("user_id : " + user_id + " stat : " + stat)
			$.ajax( {
				url: "${root}/order/data/getOrdersOfUserByStat.do",
				type: "post",
				dataType: "json",
				data: { "user_id": user_id, "stat": stat },
				success: function( result ) {
					/* if ( result.code == 1 ) {
						location.href = location.href;
					} else {

					} */
				}
			} );
		}
	} );

</script>

</body>
</html>
