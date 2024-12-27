<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	
	username: <input type="text" name="username" value="${qu.userList[0].username }"><br>
	password: <input type="text" name="password" value="${qu.userList.get(1).password }"><br>
	<hr>
	<table border="1">
		<tr>
			<th>username</th>
			<th>password</th>
		</tr>
		<c:forEach items="${qu.userList }" var="user" varStatus="vs">
			<tr>
				<td><input type="text" name="userList[${vs.index }].username" value="${user.username }"></td>
				<td><input type="text" name="userList[${vs.index }].password" value="${user.password }"></td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 很重要就，所以可以用forEach来显示多条数据，然后批量操作！ -->
	<form action="test4" method="post">
		username: <input type="text" name="userList[0].username" value="${qu.userList[0].username }"><br>
		password: <input type="text" name="userList.get(0).password" value="${qu.userList.get(0).password }"><br>
		<input type="submit" value="Add">
	</form>
	
</body>
</html>