<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath }" var="root"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Modern an Admin Panel Category Flat Bootstarp Resposive Website Template | Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="${root }/static-resources/admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="${root }/static-resources/admin/css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="${root }/static-resources/admin/css/lines.css" rel='stylesheet' type='text/css' />
<link href="${root }/static-resources/admin/css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="${root }/static-resources/admin/js/jquery.min.js"></script>
<!----webfonts--->
<link href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
<!---//webfonts--->  
<!-- Nav CSS -->
<link href="${root }/static-resources/admin/css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="${root }/static-resources/admin/js/metisMenu.min.js"></script>
<script src="${root }/static-resources/admin/js/custom.js"></script>
<!-- Graph JavaScript -->
<script src="${root }/static-resources/admin/js/d3.v3.js"></script>
<script src="${root }/static-resources/admin/js/rickshaw.js"></script>
</head>
<body>
<div id="wrapper">
     <!-- Navigation -->
        
        
        <jsp:include page="nav.jsp"/>
        
        
        <div id="page-wrapper">
        <div class="graphs">
  <div class="grid_3 grid_4">
  <div class="bs-example">
    <table class="table">
      <tbody>
        <tr>
          <td><h1 id="h1">欢迎：<font size="5" color="red">${sessionScope.adminUser.username }</font><a class="anchorjs-link" href="#h1.-bootstrap-heading"><span class="anchorjs-icon"></span></a></h1></td>
          <td class="type-info"></td>
        </tr>
      </tbody>
    </table>
    </div>
  </div>
        
       
       	
       
               
		<div class="clearfix"> </div>
	    </div>
		<div class="copy">
           <p>Copyright &copy; 2015 <a href="http://h2design.taobao.com/" target="_blank">氢设计</a></p>
	    </div>
		</div>
       </div>
      <!-- /#page-wrapper -->
	    <!-- /#wrapper -->
    <!-- Bootstrap Core JavaScript -->
    <script src="${root }/static-resources/admin/js/bootstrap.min.js"></script>
</body>
</html>





















