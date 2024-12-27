<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<input type="button" id="btn" value="show">
	<script type="text/javascript">
		
		$( function() {
			
			$( "#btn" ).click( function() {
				
				$.ajax( {
					type: "post",
					url: "${pageContext.request.contextPath}/userjson2",
					data: {"username": "bayern", "password": "123"},
					contentType: "application/json;charset=utf-8",
					success: function(data) {
						alert(data)
					}
				} );
				
			} );
			
		} );
	
	</script>

</body>
</html>