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
        <h4>已<font color="red">取消</font>订单</h4>
        <div class="col-md-3 inbox_center">
        	<form id="searchForm" action="${root }/good/data/showGoodsByFuzzySearchAndPage2.do/${keyWords }/${pageNo }" method="post">
                <div class="input-group">
                	<input type="hidden" name="pageSize" value="5">
                    <input id="searchInput" value="${sessionScope.keyWords }" type="text" name="id" class="form-control1 input-search" placeholder="根据订单编号">
                    <span class="input-group-btn">
                        <button id="searchButton" class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                    </span>
                </div><!-- Input Group -->
            </form>
     	</div>
        <div class="col-md-3 inbox_center">
        	<form id="searchForm" action="${root }/good/data/showGoodsByFuzzySearchAndPage2.do/${keyWords }/${pageNo }" method="post">
                <div class="input-group">
                	<input type="hidden" name="pageSize" value="5">
                    <input id="searchInput" value="${sessionScope.keyWords }" type="text" name="id" class="form-control1 input-search" placeholder="根据订单收货人">
                    <span class="input-group-btn">
                        <button id="searchButton" class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                    </span>
                </div><!-- Input Group -->
            </form>
     	</div>
        <div class="col-md-3 inbox_center">
        	<form id="searchForm" action="${root }/good/data/showGoodsByFuzzySearchAndPage2.do/${keyWords }/${pageNo }" method="post">
                <div class="input-group">
                	<input type="hidden" name="pageSize" value="5">
                    <input id="searchInput" value="${sessionScope.keyWords }" type="text" name="id" class="form-control1 input-search" placeholder="根据订单所属人">
                    <span class="input-group-btn">
                        <button id="searchButton" class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                    </span>
                </div><!-- Input Group -->
            </form>
     	</div>
        <div class="col-md-3 inbox_center">
        	<form id="searchForm" action="${root }/good/data/showGoodsByFuzzySearchAndPage2.do/${keyWords }/${pageNo }" method="post">
                <div class="input-group">
                	<input type="hidden" name="pageSize" value="5">
                    <input id="searchInput" value="${sessionScope.keyWords }" type="text" name="id" class="form-control1 input-search" placeholder="根据订单目的地">
                    <span class="input-group-btn">
                        <button id="searchButton" class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                    </span>
                </div><!-- Input Group -->
            </form>
     	</div>
        </div>
        <br>
        
  <!-- 订单的div -->
    <div id="fengOrders">
    
    	<c:forEach items="${orders }" var="order">
    		<div class="grid_3 grid_4">
    		<%-- 修改状态：<select id="${order.id }" name="stat">
    			<option value="-1"></option>
    			<option value="1">待支付订单</option>
    			<option value="2">已支付订单</option>
    			<option value="3">已发货订单</option>
    			<option value="4">已完成订单</option>
    			<option value="5">已取消订单</option>
    		</select><br> --%>
    		<span id="spanModifyStat${order.id }">${order.statName }</span><br>
	    	收&nbsp;货&nbsp;人&nbsp;：${order.receivename }<br>
	    	联系电话：${order.phone }<br>
	    	收货地址：${order.address }<br>
	    	总&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价：${order.totalprice }元<br>
	    	订单日期：<fmt:formatDate value="${order.createtime }" pattern="yyyy-MM-dd hh:mm:ss"/><br>
	    	订单编号：${order.id }
			  <%-- <div class="bs-example4" data-example-id="contextual-table">
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
			      </tbody>
			    </table>
			   </div> --%>
		  </div>
    	</c:forEach>
    	<c:if test="${orders eq null }">
    		<div style="color: red;" align="center" class="grid_3 grid_4">
    			暂时还没有订单信息
    		</div>
    	</c:if>
    
    <!-- 订单的div -->
    </div>
                
                
                <jsp:include page="moduleForSerchByPage.jsp"/>
                
                
                
          <div class="form-group">
              <button onclick="return deleteSelectedGoods();" type="button" class="btn btn-primary">deleteSelected</button>
              <button type="submit" class="btn btn-primary">提交选中</button>
              <button onclick="return turnONStatOfSelectedGoods();" type="button" class="btn btn-primary">上架已选中</button>
              <button onclick="return turnOFFStatOfSelectedGoods();" type="button" class="btn btn-primary">下架已选中</button>
              <button type="reset" class="btn btn-default">Reset</button>
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
      <!-- /#page-wrapper -->
   </div>
    <!-- /#wrapper -->
<!-- Nav CSS -->
<link href="${root }/static-resources/admin/css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="${root }/static-resources/admin/js/metisMenu.min.js"></script>
<script src="${root }/static-resources/admin/js/custom.js"></script>

<script type="text/javascript">

	// 修改订单状态
	$( "select[name=stat]" ).change( function() {
		var id = this.id;
		var spanId = "spanModifyStat" + id;
		var stat = this.value;
		var statName = $( this ).children(":selected").text();
		//alert(statName)
		if ( stat != -1 ) {
			
			$.ajax( {
				url: "${root}/admin/data/modifyStatOfOrder.do",
				type: "post",
				dataType: "json",
				data: { "orderId": id, "stat": stat },
				success: function( result ) {
					if ( result.code == 1 ) {
						alert(result.msg);
						$( "#"+spanId ).html( "<font color='blue'>"+statName+"</font>" );
					} else {
						alert(result.msg);
					}
				}
			} );
		}
	} );
	
	
</script>

<!-- <script type="text/javascript">

	$( ".fengPagination" ).click( function() {
		var url = this.href;
		// "${root}/admin/data/getOrdersByStatAndPage.do/"+stat+"/1",
		$.ajax( {
			"url": url,
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
	} );

</script> -->

</body>
</html>