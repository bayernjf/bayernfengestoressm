<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath }" var="root"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

	<!-- <nav>
      <ul class="pagination">
      {pageNo=1, showPageNum=5, listOfPageNo=[1, 2], count=6, totalPages=2, pageSize=5}
        <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
        <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true"><</span></a></li>
        <li class="active"><a href="#">1<span class="sr-only">(current)</span></a></li>
        <li><a href="#">2</a></li>
        <li><a href="#">3</a></li>
        <li><a href="#">4</a></li>
        <li><a href="#">5</a></li>
        <li><a href="#" aria-label="Next"><span aria-hidden="true">></span></a></li>
        <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
     </ul>
   </nav> -->


	<div>
		当前第<font color="Chocolate">${mapOfPageInfo.pageNo }</font>页，共<font color="Blue">${sessionScope.mapOfPageInfo.totalPages }</font>页，共<font color="CadetBlue">${mapOfPageInfo.count }</font>条记录
	</div>
	<nav>
		<ul class="pagination">
			<c:if test="${mapOfPageInfo.pageNo == 1 }">
				<li class="disabled"><a class="fengPagination" href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
				<li class="disabled"><a class="fengPagination" href="#" aria-label="Previous"><span aria-hidden="true"><</span></a></li>
			</c:if>
			<c:if test="${mapOfPageInfo.pageNo != 1 }">
				<li><a class="fengPagination" href='${sessionScope.urlForPaginationWithoutPageNo }/1' aria-label="Previous"><span aria-hidden="true">«</span></a></li>
				<li><a class="fengPagination" href='${sessionScope.urlForPaginationWithoutPageNo }/${mapOfPageInfo.pageNo - 1 }' aria-label="Previous"><span aria-hidden="true"><</span></a></li>
<%-- 				<li><a href='${root }/good/data/showGoodsByFuzzySearchAndPage2.do/${sessionScope.keyWords }/1' aria-label="Previous"><span aria-hidden="true">«</span></a></li>
				<li><a href='${root }/good/data/showGoodsByFuzzySearchAndPage2.do/${sessionScope.keyWords }/${mapOfPageInfo.pageNo - 1 }' aria-label="Previous"><span aria-hidden="true"><</span></a></li> --%>
			</c:if>
			
			<c:forEach items="${mapOfPageInfo.listOfPageNo }" var="NoOfPage">
				<c:if test="${mapOfPageInfo.pageNo == NoOfPage }">
					<li class="active"><a class="fengPagination" href='${sessionScope.urlForPaginationWithoutPageNo }/${NoOfPage }'>${NoOfPage }<span class="sr-only">(current)</span></a></li>
				</c:if>
				<c:if test="${mapOfPageInfo.pageNo != NoOfPage }">
					<li><a class="fengPagination" href='${sessionScope.urlForPaginationWithoutPageNo }/${NoOfPage }'>${NoOfPage }</a></li>
				</c:if>
			</c:forEach>
			
			<c:if test="${mapOfPageInfo.pageNo != mapOfPageInfo.totalPages }">
				<li><a class="fengPagination" href='${sessionScope.urlForPaginationWithoutPageNo }/${mapOfPageInfo.pageNo + 1 }' aria-label="Next"><span aria-hidden="true">></span></a></li>
        		<li><a class="fengPagination" href='${sessionScope.urlForPaginationWithoutPageNo }/${mapOfPageInfo.totalPages }' aria-label="Next"><span aria-hidden="true">»</span></a></li>
			</c:if>
			<c:if test="${mapOfPageInfo.pageNo == mapOfPageInfo.totalPages }">
				<li class="disabled"><a class="fengPagination" href="#" aria-label="Next"><span aria-hidden="true">></span></a></li>
        		<li class="disabled"><a class="fengPagination" href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
			</c:if>
		</ul>
	</nav>


</body>
</html>