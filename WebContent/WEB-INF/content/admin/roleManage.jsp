<%@page import="org.feng.admin.bean.AdminUser"%>
<%@page import="org.feng.admin.bean.AdminRole"%>
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
        <form action="${root }/admin/data/findUser.do" method="post">
                <div class="input-group">
                    <input type="text" name="username" class="form-control1 input-search" placeholder="根据登录账号搜索需要管理的用户">
                    <span class="input-group-btn">
                        <button class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                    </span>
                </div><!-- Input Group -->
            </form>
     </div>
        
        <br>
        
  <div class="grid_3 grid_4">
  
  <br>
  
  <div class="bs-example">
    <table class="table">
      <tbody>
      	<tr>
      		<th>用户id</th>
      		<th>用户账号</th>
      		<th>用户创建时间</th>
      		<th>启用/禁用</th>
      		<th>用户头像</th>
      		<th>用户手机号</th>
      		<th>用户角色</th>
      	</tr>
        <tr>
        	<c:if test="${sessionScope.foundUser ne null }">
        		<td id="tdUserId">${sessionScope.foundUser.id }</td>
        		<td>${sessionScope.foundUser.username }</td>
        		<td><fmt:formatDate value="${sessionScope.foundUser.createtime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
        		<td><span id="spanModifyStat">${sessionScope.foundUser.stat eq 1 ? "已启用" : "已禁用" }</span>
        			<span id="spanUserStat" style="display: none;">${sessionScope.foundUser.stat }</span>
        			<select name="adminUserStat">
        				<option value="-1">修改状态</option>
        				<option value="1">启用</option>
        				<option value="0">禁用</option>
        			</select>
        		</td>
        		<td><img style="width: 40px; height: 40px; border-radius: 25px" alt="" src="${sessionScope.foundUser.photo }"></td>
        		<td>${sessionScope.foundUser.phone }</td>
        		<td><span id="spanModifyRoleName">${sessionScope.foundUser.role.name }</span>
        			<span id="spanUserRole_Id" style="display: none;">${sessionScope.foundUser.role_id }</span>
        			<select name="adminUserRole_Id">
        				<option value="-1">修改角色</option>
        				<c:forEach items="${requestScope.roles }" var="role">
							<option value="${role.id }">${role.name }</option>
						</c:forEach>
        			</select>
        		</td>
<%--         		<td>${sessionScope.foundUser.role_id }</td> --%>
        	</c:if>
          	<c:if test="${sessionScope.foundUser eq null }">
          		<td colspan="7" align="center"><font color="green">没有找到用户</font></td>
          	</c:if>
        </tr>
      </tbody>
    </table>
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

	$( "select[name='adminUserStat']" ).change( function() {
		var stat = $(this).val();
		//var statName = $( "option:selected option[value!='-1']" ).text();
		var statName = $( "select[name='adminUserStat'] option:selected" ).text();
		//statName = "已" + statName.substring(0, statName.indexOf("修"))
		statName = "已" + statName;
		//alert( statName );
		var role_id = $( "#spanUserRole_Id" ).text();
		if ( stat != -1 ) {
			// 根据id更新user
			var id = $( "#tdUserId" ).text();
			var sendData = {
					"id": id,
					"stat": stat,
					"role_id": role_id
			};
			$.ajax( {
				url: "${root}/admin/data/roleManageModifyUser.do",
				type: "post",
				dataType: "json",
				data: sendData,
				success: function( result ) {
					if ( result.code == "1" ) {
						alert( result.msg );
						<%-- <%
							AdminUser user = (AdminUser) request.getSession().getAttribute("foundUser");
							request.getSession().setAttribute("whenModify", user);
						%>
						location.href = "${root}/admin/data/findUser.do"; --%>
						
						// 修改成功”伪“修改页面的值
						$( "#spanModifyStat" ).text( statName );
					} else {
						alert("修改失败");
					}
				}
			} );
		}
	} );

	
	
	
	
	
	$( "select[name='adminUserRole_Id']" ).change( function() {
		var role_id = $(this).val();
		//var statName = $( "option:selected option[value!='-1']" ).text();
		var role_idName = $( "select[name='adminUserRole_Id'] option:selected" ).text();
		role_idName = role_idName.substring(role_idName.indexOf("态") + 1)
		//alert( role_idName );
		var stat = $( "#spanUserStat" ).text();
		if ( role_id != -1 ) {
			// 根据id更新user
			var id = $( "#tdUserId" ).text();
			var sendData = {
					"id": id,
					"stat": stat,
					"role_id": role_id
			};
			$.ajax( {
				url: "${root}/admin/data/roleManageModifyUser.do",
				type: "post",
				dataType: "json",
				data: sendData,
				success: function( result ) {
					if ( result.code == "1" ) {
						alert( result.msg );
						// 修改成功”伪“修改页面的值
						$( "#spanModifyRoleName" ).text( role_idName );
					} else {
						alert("修改失败");
					}
				}
			} );
		}
	} );
	
	
</script>


</body>
</html>
