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




   <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
       <div class="navbar-header">
           <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
               <span class="sr-only">Toggle navigation</span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
               <span class="icon-bar"></span>
           </button>
           <a class="navbar-brand" href="${root }/admin/index.html">Modern</a>
       </div>
       <!-- /.navbar-header -->
        <ul class="nav navbar-nav navbar-right">
<li class="dropdown">
     		<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-comments-o"></i><span class="badge">4</span></a>
     		<ul class="dropdown-menu">
		<li class="dropdown-menu-header">
			<strong>Messages</strong>
			<div class="progress thin">
			  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
		    <span class="sr-only">40% Complete (success)</span>
		  </div>
		</div>
	</li>
	<li class="avatar">
		<a href="#">
			<img src="${root }/static-resources/admin/images/1.png" alt=""/>
			<div>New message</div>
			<small>1 minute ago</small>
			<span class="label label-info">NEW</span>
		</a>
	</li>
	<li class="avatar">
		<a href="#">
			<img src="${root }/static-resources/admin/images/2.png" alt=""/>
			<div>New message</div>
			<small>1 minute ago</small>
			<span class="label label-info">NEW</span>
		</a>
	</li>
	<li class="avatar">
		<a href="#">
			<img src="${root }/static-resources/admin/images/3.png" alt=""/>
			<div>New message</div>
			<small>1 minute ago</small>
		</a>
	</li>
	<li class="avatar">
		<a href="#">
			<img src="${root }/static-resources/admin/images/4.png" alt=""/>
			<div>New message</div>
			<small>1 minute ago</small>
		</a>
	</li>
	<li class="avatar">
		<a href="#">
			<img src="${root }/static-resources/admin/images/5.png" alt=""/>
			<div>New message</div>
			<small>1 minute ago</small>
		</a>
	</li>
	<li class="avatar">
		<a href="#">
			<img src="${root }/static-resources/admin/images/pic1.png" alt=""/>
			<div>New message</div>
			<small>1 minute ago</small>
		</a>
	</li>
	<li class="dropdown-menu-footer text-center">
		<a href="#">View all messages</a>
	</li>	
    		</ul>
  		</li>
  <li class="dropdown">
    		<a href="#" class="dropdown-toggle avatar" data-toggle="dropdown"><img src="${root }/static-resources/admin/images/1.png"><span class="badge">9</span></a>
      		<ul class="dropdown-menu">
			<li class="dropdown-menu-header text-center">
				<strong>Account</strong>
			</li>
			<li class="m_2"><a href="#"><i class="fa fa-bell-o"></i> Updates <span class="label label-info">42</span></a></li>
			<li class="m_2"><a href="#"><i class="fa fa-envelope-o"></i> Messages <span class="label label-success">42</span></a></li>
			<li class="m_2"><a href="#"><i class="fa fa-tasks"></i> Tasks <span class="label label-danger">42</span></a></li>
			<li><a href="#"><i class="fa fa-comments"></i> Comments <span class="label label-warning">42</span></a></li>
			<li class="dropdown-menu-header text-center">
				<strong>Settings</strong>
			</li>
			<li class="m_2"><a href="#"><i class="fa fa-user"></i> Profile</a></li>
			<li class="m_2"><a href="#"><i class="fa fa-wrench"></i> Settings</a></li>
			<li class="m_2"><a href="#"><i class="fa fa-usd"></i> Payments <span class="label label-default">42</span></a></li>
			<li class="m_2"><a href="#"><i class="fa fa-file"></i> Projects <span class="label label-primary">42</span></a></li>
			<li class="divider"></li>
			<li class="m_2"><a href="#"><i class="fa fa-shield"></i> Lock Profile</a></li>
			<li class="m_2"><a href="#"><i class="fa fa-lock"></i> Logout</a></li>	
      		</ul>
    		</li>
</ul>
<form class="navbar-form navbar-right">
           <input type="text" class="form-control" value="Search..." onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search...';}">
       </form>
       <div class="navbar-default sidebar" role="navigation">
           <div class="sidebar-nav navbar-collapse">
               <ul class="nav" id="side-menu">
                   <li>
                       <a href="${root }/admin/index.html"><i class="fa fa-dashboard fa-fw nav_icon"></i>首页</a>
                   </li>
                   <li>
                       <a href="#"><i class="fa fa-laptop nav_icon"></i>后台管理<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                           <%-- <li>
                               <a href="${root }/admin/userAdd.html">添加用户</a>
                           </li>
                           <li>
                               <a href="${root }/admin/roleManage.html">角色管理</a>
                           </li>
                           <li>
                               <a href="${root }/admin/authorizationManage.html">权限管理</a>
                           </li> --%>
                           <c:forEach items="${sessionScope.adminAuthorizations }" var="auth">
                             <c:if test="${auth.parentid eq 1 }">
                             	<li>
	                               <a href="${root }${auth.url }">${auth.menu }</a>
	                           </li>
                             </c:if>
                           </c:forEach>
                       </ul>
                       <!-- /.nav-second-level -->
                   </li>
                   <li>
                       <a href="#"><i class="fa fa-indent nav_icon"></i>商品管理<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                           <%-- <li>
                               <a href="${root }/admin/productPublish.html">发布商品</a>
                           </li>
                           <li>
                               <a href="${root }/admin/productManage.html">商品操作</a>
                           </li>
                           <li>
                               <a href="${root }/admin/productOffshelf.html">已下架商品</a>
                           </li> --%>
                           <c:forEach items="${sessionScope.adminAuthorizations }" var="auth">
                             <c:if test="${auth.parentid eq 5 }">
                             	<li>
	                               <a href="${root }${auth.url }">${auth.menu }</a>
	                           </li>
                             </c:if>
                           </c:forEach>
                       </ul>
                       <!-- /.nav-second-level -->
                   </li>
                   <li>
                       <a href="#"><i class="fa fa-envelope nav_icon"></i>订单管理<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                           <%-- <li>
                               <a href="${root }/admin/orderToBePaid.html">待支付订单</a>
                           </li>
                           <li>
                               <a href="${root }/admin/orderBeenPaid.html">已支付订单</a>
                           </li>
                           <li>
                               <a href="${root }/admin/orderShipped.html">已发货订单</a>
                           </li>
                           <li>
                               <a href="${root }/admin/orderAccomplished.html">已完成订单</a>
                           </li>
                           <li>
                               <a href="${root }/admin/orderCancelled.html">已取消订单</a>
                           </li> --%>
                           <c:forEach items="${sessionScope.adminAuthorizations }" var="auth">
                             <c:if test="${auth.parentid eq 9 }">
                             	<li>
	                               <a href="${root }${auth.url }">${auth.menu }</a>
	                           </li>
                             </c:if>
                           </c:forEach>
                       </ul>
                       <!-- /.nav-second-level -->
                   </li>
                   <li>
                    	<a href="#"><i class="fa fa-sitemap fa-fw nav_icon"></i>账号<span class="fa arrow"></span></a>
                       <ul class="nav nav-second-level">
                           <li>
                               <a href="${root }/admin/login.html">登录</a>
                           </li>
                           <li>
                               <a href="${root }/admin/logout.html">登出</a>
                           </li>
                           <li>
                               <a href="${root }">商城</a>
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

<input id="user_id" type="hidden" value="${sessionScope.user.id }">
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
				url: "${root}/admin/data/getOrdersByStatAndPage.do/"+stat+"/1",
				type: "post",
				dataType: "json",
				data: { "stat": stat },
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
