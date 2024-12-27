<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<div class="graphs">
 		<h4>发布商品</h4>
 		<div class="bs-example1">
 			
 		</div>
 		
</div>
<script type="text/javascript" src="${root }/static-resources/admin/kindeditor-4.1.10/kindeditor.js"></script>
<script>
KindEditor.ready(function(k){
k.create("#description",{
	uploadJson : "${root }/static-resources/admin/kindeditor-4.1.10/jsp/upload_json.jsp",
	fileManagerJson : "${root }/static-resources/admin/kindeditor-4.1.10/jsp/file_manager_json.jsp",
	allowFileManager : true

	});
})
</script>
  