<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath }" var="root"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Modern an Admin Panel Category Flat Bootstarp Resposive Website Template | Grids :: w3layouts</title>
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
</head>
<body>
<div id="wrapper">
     <!-- Navigation -->
        
        <jsp:include page="nav.jsp"/>
        
        <div id="page-wrapper">
        <div class="graphs">
        
          <h2 class="form-heading">添加用户：</h2>
		  <form class="form-signin app-cam" action="${root }/admin/data/addUser.do" method="post">
			  <p> 添加用户信息 </p>
		      <input type="text" name="username" class="form-control1" placeholder="userame" autofocus="">
		      <input type="text" name="password" class="form-control1" placeholder="password">
		      <input type="text" name="phone" class="form-control1" placeholder="phone">
		      	角色：<select name="role_id">
		      		<option value="-1">---请选择---</option>
					<c:forEach items="${requestScope.roles }" var="role">
						<option value="${role.id }">${role.name }</option>
					</c:forEach>
		      	</select><br><br>
		      <button class="btn btn-lg btn-success1 btn-block" type="submit">添加</button>
		  </form>
        
        
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
<!-- Bootstrap Core JavaScript -->
<script src="${root }/static-resources/admin/js/bootstrap.min.js"></script>
</body>
</html>
