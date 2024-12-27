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
        <div class="graphs">
        
        <div class="grid_3 grid_4">
        <form id="searchForm" action="${root }/good/data/showGoodsByFuzzySearchAndPage2.do/${keyWords }/${pageNo }" method="post">
                <div class="input-group">
                	<input type="hidden" name="pageSize" value="5">
                    <input id="searchInput" value="${sessionScope.keyWords }" type="text" name="id" class="form-control1 input-search" placeholder="搜索订单">
                    <span class="input-group-btn">
                        <button id="searchButton" class="btn btn-success" type="button"><i class="fa fa-search"></i></button>
                    </span>
                </div><!-- Input Group -->
            </form>
     </div>
        
        <br>
        
    
    
    <!-- 订单的div -->
    <div id="fengOrders">
    
    	<c:forEach items="${orders }" var="order">
    		<div class="grid_3 grid_4">
    		${order.statName }<br>
	    	收&nbsp;货&nbsp;人&nbsp;：${order.receivename }<br>
	    	联系电话：${order.phone }<br>
	    	收货地址：${order.address }<br>
	    	总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价：${order.totalprice }元<br>
	    	订单日期：<fmt:formatDate value="${order.createtime }" pattern="yyyy-MM-dd hh:mm:ss"/><br>
	    	订单编号：${order.id }
			  <div class="bs-example4" data-example-id="contextual-table">
			    <table class="table">
			      <thead>
			        <tr>
			          <th>缩略图</th>
			          <th>商品名称</th>
			          <th>商品单价</th>
			          <th>交易价格</th>
			          <th>购买数量</th>
			        </tr>
			      </thead>
			      <tbody>
			      	<c:forEach items="${order.listOfGood }" var="good">
			      		<tr class="active">
				          <td><img  src="/upload/image/${good.titleimage }" style="width: 40px; height: 40px; border-radius: 25px; cursor: pointer;"></td>
				          <td>${good.name }</td>
				          <td>${good.estoreprice }</td>
				          <td>${good.priceWithBuynum }</td>
				          <td>${good.buynum }</td>
				        </tr>
			      	</c:forEach>
			        <!-- <tr class="active">
			          <td><img  src="/upload/image/8e8d3d4144.jpg" style="width: 40px; height: 40px; border-radius: 25px; cursor: pointer;"></td>
			          <td>拜仁慕尼黑</td>
			          <td>120</td>
			          <td>2</td>
			        </tr> -->
			      </tbody>
			    </table>
			   </div>
		  </div>
    	</c:forEach>
    	<c:if test="${orders eq null }">
    		<div style="color: red;" align="center" class="grid_3 grid_4">
    			暂时还没有订单信息
    		</div>
    	</c:if>
    
<!--     	<div class="grid_3 grid_4">
    	收&nbsp;货&nbsp;人&nbsp;：姜峰<br>
    	联系电话：18297318405<br>
    	收货地址：安徽 蚌埠 龙子湖区 治淮路怀伟东大院三单元<br>
    	总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价：120元<br>
    	订单日期：2020-11-20<br>
    	订单编号：2020
		  <div class="bs-example4" data-example-id="contextual-table">
		    <table class="table">
		      <thead>
		        <tr>
		          <th>缩略图</th>
		          <th>商品名称</th>
		          <th>交易价格</th>
		          <th>购买数量</th>
		        </tr>
		      </thead>
		      <tbody>
		        <tr class="active">
		          <td><img  src="/upload/image/8e8d3d4144.jpg" style="width: 40px; height: 40px; border-radius: 25px; cursor: pointer;"></td>
		          <td>拜仁慕尼黑</td>
		          <td>120</td>
		          <td>2</td>
		        </tr>
		      </tbody>
		    </table>
		   </div>
	  </div>
 -->
    <!-- 订单的div -->
    </div>
        
         <div class="copy_layout">
         	<p>Copyright © 2015 Modern. All Rights Reserved | Design by <a href="http://h2design.taobao.com/" target="_blank">氢设计</a> </p>
        	<a href="${root }/admin/login.html">后台管理</a>
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

//*****************************工具函数*****************************
var setCookie2 = function( cname, cvalue, exdays ) {
  	var d = new Date();
  	d.setTime(d.getTime()+(exdays*24*60*60*1000));
  	var expires = "expires="+d.toGMTString();
  	document.cookie = cname + "=" + cvalue + "; " + expires + "; path=/";
}

var getCookie2 = function( cname ) {
  	var name = cname + "=";
  	var ca = document.cookie.split(';');
  	for(var i=0; i<ca.length; i++) {
    	var c = ca[i].trim();
    	if (c.indexOf(name)==0) return c.substring(name.length,c.length);
  	}
  	return "";
}

	//cookie的值不要有“;”
	// 中文还需要特殊处理
	// escape(str)和unescape(str)
	// *****************************工具函数*****************************
	var setCookie = function( cname, cvalue, exdays ) {
	  var d = new Date();
	  d.setTime(d.getTime()+(exdays*24*60*60*1000));
	  var expires = "expires="+d.toGMTString();
	  document.cookie = cname + "=" + escape(cvalue) + "; " + expires + "; path=/";
	}
	
	var getCookie = function( cname ) {
	  var name = cname + "=";
	  var ca = document.cookie.split(';');
	  for(var i=0; i<ca.length; i++) {
	    var c = ca[i].trim();
	    if (c.indexOf(name)==0) return unescape(c.substring(name.length,c.length));
	  }
	  return "";
	}
	
	function uuid() {
	     var s = [];
	     var hexDigits =  "0123456789abcdef" ;
	     for ( var  i = 0; i < 36; i++) {
	     	s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
	     }
	     s[14] =  "4" ;   // bits 12-15 of the time_hi_and_version field to 0010
	     s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1);   // bits 6-7 of the clock_seq_hi_and_reserved to 01
	     s[8] = s[13] = s[18] = s[23] =  "-" ;
	 
	     var  uuid = s.join( "" );
	     return  uuid;
	}
	// *****************************工具函数*****************************
	var userAddr = sessionStorage.getItem("username") + "Addr";
	var username = sessionStorage["username"];
	var ordersOfUserName = sessionStorage["username"] + "ordersOfUser";

	
	
	
	
	
	
	
	
	//alert(getCookie2(ordersOfUserName))
	
</script>

</body>
</html>
