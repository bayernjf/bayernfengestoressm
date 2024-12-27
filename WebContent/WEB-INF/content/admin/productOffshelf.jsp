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
        <form id="searchForm" action="${root }/good/data/showGoodsByFuzzySearchAndPageOnlyOffshelf.do/${keyWords }/${pageNo }" method="post">
                <div class="input-group">
                	<input type="hidden" name="pageSize" value="5">
                    <input id="searchInput" type="text" value="${sessionScope.keyWords }" name="id" class="form-control1 input-search" placeholder="根据商品ID或名称/详情搜索已下架商品并进行修改">
                    <span class="input-group-btn">
                        <button id="searchButton" class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                    </span>
                </div><!-- Input Group -->
            </form>
     </div>
        
        <br>
        
  <div class="grid_3 grid_4">
  
  <br>
  
  <div class="bs-example">
  
  				<div class="form-group filled">
	              <label class="control-label">按照商品种类查找已下架</label>
	              	父类：<select id="category_idFu" name="category_idFu" >
	              	<option value="feng">所有</option>
	              </select>
	              	子类：<select id="category_idZi" name="category_idZi" >
	              	<option value="feng"></option>
	              </select>
	            </div>
  
  			<span>已选中<font color="red" id="numOfSelected"></font></span>
  
<form class="form-floating ng-pristine ng-invalid ng-invalid-required ng-valid-email ng-valid-url ng-valid-pattern" novalidate="novalidate" ng-submit="submit()">
          <fieldset>
          <table id="jiangfengkx" class="table">
                    <tr>
                    	<th><input id="AllChecks" type="checkbox" class="checkbox"></th>
                    	<th>商品名称</th>
                    	<th>市场价</th>
                    	<th>网站价格</th>
                    	<th>商品种类</th>
                    	<th>库存</th>
                    	<th>商品缩略图</th>
                    	<th>商品描述</th>
                    	<th>生产日期</th>
                    	<th>过期时间</th>
                    	<th>是否上架</th>
                    	<th>删除</th>
                    </tr>
                    <tbody>
                    	<c:if test="${sessionScope.goodsWhichOffshelf ne null }">
                    		<c:forEach items="${sessionScope.goodsWhichOffshelf }" var="good" varStatus="vs">
                    			<tr id="tr${good.id }" class="unread checked">
		                            <td class="hidden-xs">
		                                <input id="fengcheck${good.id }" name="fengcheck" type="checkbox" class="checkbox">
		                            </td>
		                            <td class="hidden-xs">
		                                <a href="${root }/admin/data/productModify.html/${good.id}">${good.name }</a>
		                            </td>
		                            <td class="hidden-xs">
		                                ${good.marketprice }
		                            </td>
		                            <td>
		                               ${good.estoreprice }
		                            </td>
		                            <td>
		                               ${good.category.type }
		                            </td>
		                            <td>
		                               ${good.num }
		                            </td>
		                            <td>
		                               <img style="width: 40px; height: 40px; border-radius: 25px" alt="" src="/upload/image/${good.titleimage }">
		                            </td>
		                            <td>
		                               ${good.description.length() gt 5 ? good.description.substring(0, 5) : good.description }
		                            </td>
		                            <td>
		                            	<fmt:formatDate value="${good.production_date }" pattern="yyyy-MM-dd"/>
		                            </td>
		                            <td>
		                            	<fmt:formatDate value="${good.expiry_date }" pattern="yyyy-MM-dd"/>
		                               
		                            </td>
		                            <td>
		                            	<span id="spanModifyStatOfGood${good.id }">${good.stat eq 0 ? "已<font color='red'>下</font>架" : "已<font color='blue'>上</font>架" }</span>
		                            	<select name="stat" id="modifyStatOfGood${good.id }">
		                            		<option value="-1">修改</option>
		                            		<option value="1">上架</option>
		                            		<option value="0">下架</option>
		                            	</select>
		                            </td>
		                            <td>
		                               <button id="deleteId${good.id }" class="btn btn-primary">删除</button>
		                            </td>
		                        </tr>
                    		</c:forEach>
                    	</c:if>
                    	<c:if test="${sessionScope.goodsWhichOffshelf eq null }">
                    		<tr><td colspan="12" align="center" style="color: red">还没有商品</td></tr>
                    	</c:if>
                    </tbody>
                </table>
                
                <%-- <jsp:include page="moduleForSerchByPage.jsp"/> --%>
                <div>
					当前第<font color="Chocolate">${mapOfPageInfo.pageNo }</font>页，共<font color="Blue">${sessionScope.mapOfPageInfo.totalPages }</font>页，共<font color="CadetBlue">${mapOfPageInfo.count }</font>条记录
				</div>
				<nav>
		<ul class="pagination">
			<c:if test="${mapOfPageInfo.pageNo == 1 }">
				<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
				<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true"><</span></a></li>
			</c:if>
			<c:if test="${mapOfPageInfo.pageNo != 1 }">
				<li><a href='${sessionScope.urlForPaginationWithoutPageNo }/1' aria-label="Previous"><span aria-hidden="true">«</span></a></li>
				<li><a href='${sessionScope.urlForPaginationWithoutPageNo }/${mapOfPageInfo.pageNo - 1 }' aria-label="Previous"><span aria-hidden="true"><</span></a></li>
<%-- 				<li><a href='${root }/good/data/showGoodsByFuzzySearchAndPage2.do/${sessionScope.keyWords }/1' aria-label="Previous"><span aria-hidden="true">«</span></a></li>
				<li><a href='${root }/good/data/showGoodsByFuzzySearchAndPage2.do/${sessionScope.keyWords }/${mapOfPageInfo.pageNo - 1 }' aria-label="Previous"><span aria-hidden="true"><</span></a></li> --%>
			</c:if>
			
			<c:forEach items="${mapOfPageInfo.listOfPageNo }" var="NoOfPage">
				<c:if test="${mapOfPageInfo.pageNo == NoOfPage }">
					<li class="active"><a href='${sessionScope.urlForPaginationWithoutPageNo }/${NoOfPage }'>${NoOfPage }<span class="sr-only">(current)</span></a></li>
				</c:if>
				<c:if test="${mapOfPageInfo.pageNo != NoOfPage }">
					<li><a href='${sessionScope.urlForPaginationWithoutPageNo }/${NoOfPage }'>${NoOfPage }</a></li>
				</c:if>
			</c:forEach>
			
			<c:if test="${mapOfPageInfo.pageNo != mapOfPageInfo.totalPages }">
				<li><a href='${sessionScope.urlForPaginationWithoutPageNo }/${mapOfPageInfo.pageNo + 1 }' aria-label="Next"><span aria-hidden="true">></span></a></li>
        		<li><a href='${sessionScope.urlForPaginationWithoutPageNo }/${mapOfPageInfo.totalPages }' aria-label="Next"><span aria-hidden="true">»</span></a></li>
			</c:if>
			<c:if test="${mapOfPageInfo.pageNo == mapOfPageInfo.totalPages }">
				<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">></span></a></li>
        		<li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
			</c:if>
		</ul>
	</nav>
                
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

	var root = location.pathname.split("/")[1];
	var fengcategories = {  };
	// 拿到分类以后，动态存在fengcategories里面
	var showAllCategories = function() {
		$.ajax( {
			url: "/"+root+"/category/showAllcategories.do",
			type: "post",
			dataType: "json",
			success: function( result ) {
				if ( result.code == 1 ) {
					/*	result.msg
					 *  {
					 *  	"childrenCate":[{"id":2,"parentid":1,"type":"无公害蔬菜"},{"id":3,"parentid":1,"type":"特菜类"},{"id":4,"parentid":1,"type":"有机蔬菜"}],
					 *  	"id":1,
					 *  	"type":"蔬菜"
					 *  }
					 */
					 /*
					 
					 	var fengcategories = { 
								1: {
									type: "蔬菜",
									childrenCate: {
										2: "无公害蔬菜"
									}
								}
						};
					 
					 */
					$.each( result.msg, function( index, thiz ) {
						var childrenCate = {  };
						$.each( thiz.childrenCate, function( childIndex, childThiz ) {
							childrenCate[childThiz.id] = childThiz.type;
						} );
						fengcategories[thiz.id] = {
								"type": thiz.type,
								"childrenCate": childrenCate
						};
					} );
					
					// 所有种类遍历显示到select中
					jiangfengjiang();
				} else {
					var content = "未找到信息";
					$( "#showAllCategories" ).append( content );
				}
			}
		} );
	}
	showAllCategories();
	
	
	function showChildrenCate() {
		// 当province的值改变的时候，遍历city
		// 先清空城市选项
		//$( "#city" ).empty();		
		$( "#category_idZi" ).children( "option:not(:first)" ).remove();
		var childrenCates = fengcategories[$( "#category_idFu" ).val()]["childrenCate"];
		$.each( childrenCates, function( key, thiz ) {
			$( "#category_idZi" ).append( "<option value='"+key+"'>"+thiz+"</option>" );
		} );
		
		
		$( "#category_idZi option[value='"+sessionStorage.getItem("category_idZi")+"']" ).attr("selected", "selected");
		
	}
	
	$( "#category_idFu" ).change( showChildrenCate );
	
	function jiangfengjiang() {
		$.each( fengcategories, function( keyIfObj, thiz ) {
			//alert("keyIfObj: " + keyIfObj + " -> thiz(当前值): " + JSON.stringify(thiz))
			$( "#category_idFu" ).append( "<option value='"+keyIfObj+"'>"+thiz.type+"</option>" );
		} );
		
		// 修改的时候，根据需要修改的内容，先做显示
		//$( "#province option[value='34']" ).attr("selected", "selected");
		
		$( "#category_idFu option[value='"+sessionStorage.getItem("category_idFu")+"']" ).attr("selected", "selected");
		
		showChildrenCate();
	}
	
	// 当父类改变的时候，查询该类的所有商品，多个子分类id
	$( "#category_idFu" ).change( function() {
		//alert(this.value)
		//alert("${root}/good/data/getGoodsByCategory_Id2.do/"+this.value+"/1")
		var categoryId = this.value;
		sessionStorage.setItem("category_idFu", categoryId);
		sessionStorage.setItem("keyWords", null);
		$.ajax( {
			url: "${root}/good/data/getGoodsByCategory_Id2OnlyOffshelf.do/"+categoryId+"/1",
			type: "post",
			dataType: "json",
			success: function( result ) {
				location.href = location.href;
			}
		} );
	} );
	
	// 当子类改变的时候，查询该类id的所有商品
	$( "#category_idZi" ).change( function() {
		var categoryId = this.value;
		sessionStorage.setItem("category_idZi", categoryId);
		$.ajax( {
			url: "${root}/good/data/getGoodsByCategory_Id2OnlyOffshelf.do/"+categoryId+"/1",
			type: "post",
			dataType: "json",
			success: function( result ) {
				location.href = location.href;
			}
		} );
	} );
	
	
	
	
	
	$( ":button:contains('删除')" ).click( function() {
		
		if ( confirm("确认删除？") ) {
			var id = this.id.substring("delteId".length + 1);
			var trId = "tr" + id;
			$( "#"+trId ).remove();
			// 删除数据库里的数据
			$.ajax( {
				url: "${root}/good/data/deleteGoodById.do",
				type: "post",
				dataType: "json",
				data: { "id": id },
				success: function( result ) {
					if ( result.code == "1" ) {
						alert( result.msg );
					} else {
						alert( result.msg );
					}
				}
			} );
		} else {
			
		}
		
	} );
	
	
	
	$( "#AllChecks" ).click( function() {
		if ( $( "#AllChecks" ).prop( "checked" ) ) {
			$.each( $( "input[name='fengcheck']" ), function( inedex, thiz ) {
				$(thiz).prop("checked", true)
			} );
		} else {
			$.each( $( "input[name='fengcheck']" ), function( inedex, thiz ) {
				$(thiz).prop("checked", false)
			} );
		}
	} );
	// 删除已选中
	function deleteSelectedGoods() {
		var $checks = $( "input[name='fengcheck']:not(#AllChecks):checked" );
		if ( $checks.size() > 0 ) {
			if ( confirm( "确认删除？" ) ) {
				var ids = {};
				$.each( $checks, function( index, thiz ) {
					var id = thiz.id.substring("fengcheck".length);
					var trId = "tr" + id;
					ids[id] = id;
					// 删除当前行
					$( "#"+trId ).remove();
				} );
				
				// 删除多条数据库的
				var sendData = {
						//"ids": JSON.stringify(ids)
						"ids": sessionStorage.getItem("checkboxIds2")
				};
				$.ajax( {
					url: "${root}/good/data/deleteGoodByIdS.do",
					type: "post",
					dataType: "json",
					data: sendData,
					success: function( result ) {
						if ( result.code == "1" ) {
							alert( result.msg );
						}
					}
				} );
			}
		} else {
			alert( "还没选中任何商品" );
		}
		
	}

	// 上架已选中
	function turnONStatOfSelectedGoods() {
		var $checks = $( "input[name='fengcheck']:not(#AllChecks):checked" );
		if ( $checks.size() > 0 ) {
			if ( confirm( "确认修改为上架商品？" ) ) {
				var ids = {};
				$.each( $checks, function( index, thiz ) {
					var id = thiz.id.substring("fengcheck".length);
					var spanId = "spanModifyStatOfGood" + id;
					ids[id] = id;
					$( "#"+spanId ).html( "已<font color='blue'>上</font>架" );
				} );
				
				var sendData = {
						//"ids": JSON.stringify(ids)
						"ids": sessionStorage.getItem("checkboxIds2")
				};
				$.ajax( {
					url: "${root}/good/data/turnONStatOfGoodsByIdS.do",
					type: "post",
					dataType: "json",
					data: sendData,
					success: function( result ) {
						if ( result.code == "1" ) {
							alert( result.msg );
						}
					}
				} );
			}
		} else {
			alert( "还没选中任何商品" );
		}
		
	}
	// 下架已选中
	function turnOFFStatOfSelectedGoods() {
		var $checks = $( "input[name='fengcheck']:not(#AllChecks):checked" );
		if ( $checks.size() > 0 ) {
			if ( confirm( "确认修改为下架商品？" ) ) {
				var ids = {};
				$.each( $checks, function( index, thiz ) {
					var id = thiz.id.substring("fengcheck".length);
					var spanId = "spanModifyStatOfGood" + id;
					ids[id] = id;
					$( "#"+spanId ).html( "已<font color='red'>下</font>架" );
				} );
				
				var sendData = {
						//"ids": JSON.stringify(ids)
						"ids": sessionStorage.getItem("checkboxIds2")
				};
				$.ajax( {
					url: "${root}/good/data/turnOFFStatOfGoodsByIdS.do",
					type: "post",
					dataType: "json",
					data: sendData,
					success: function( result ) {
						if ( result.code == "1" ) {
							alert( result.msg );
						}
					}
				} );
			}
		} else {
			alert( "还没选中任何商品" );
		}
		
	}
	
	
	// 商品是否上架下架
	$( "select[name=stat]" ).change( function() {
		var id = this.id.substring("modifyStatOfGood".length);
		var spanId = "spanModifyStatOfGood" + id;
		var stat = this.value;
		if ( stat == 1) {
			$( "#"+spanId ).html( "已<font color='blue'>上</font>架" );
		} else if ( stat == 0 ) {
			$( "#"+spanId ).html( "已<font color='red'>下</font>架" );
		}
		
		if ( stat != -1 ) {
			$.ajax( {
				url: "${root}/good/data/modifyStatOfGood.do",
				type: "post",
				dataType: "json",
				data: { "id": id, "stat": stat },
				success: function( result ) {
					if ( result.code == 1 ) {
						alert(result.msg);
					} else {
						alert(result.msg);
					}
				}
			} );
		}
		
	} );
	
	$( "#searchButton" ).click( function() {
		var keyWords = $( "#searchInput" ).val();
		if ( keyWords == "" ) {
			keyWords = "-1";
		}
		sessionStorage.setItem("category_idFu", null);
		$( "#searchForm" ).attr( "action", "${root }/good/data/showGoodsByFuzzySearchAndPageOnlyOffshelf.do/"+keyWords+"/1" );
		//alert( $( "#searchForm" ).attr( "action" ) )
	} );
	
	
	var checkboxIds2 = {  };
	if ( sessionStorage.getItem("checkboxIds2") != null ) {
		checkboxIds2 = JSON.parse(sessionStorage.getItem("checkboxIds2"));
	}
	$( "#AllChecks" ).click( function() {
		var $checks = $( "input[name='fengcheck']:not(#AllChecks)" );
		$.each( $checks, function( index, thiz ) {
			var id = thiz.id.substring("fengcheck".length);
			if ( $( thiz ).prop("checked") ) {
				checkboxIds2[id] = id;
			} else {
				checkboxIds2[id] = undefined;
			}
		} );
		//alert(JSON.stringify(ccheckboxIds2)
		sessionStorage.setItem("checkboxIds2", JSON.stringify(checkboxIds2));
		//alert(sessionStorage.getItem("checkboxIds2"))
		
		numOfSelected();
		
	} );
	$( ":checkbox:not(#AllChecks)" ).click( function() {
		//alert(this.id.substring("fengcheck".length))
		//alert($(this).prop("id").substring("fengcheck".length))
		var id = this.id.substring("fengcheck".length);
		if ( $( this ).prop("checked") ) {
			checkboxIds2[id] = id;
		} else {
			checkboxIds2[id] = undefined;
		}
		//alert(JSON.stringify(checkboxIds2))
		sessionStorage.setItem("checkboxIds2", JSON.stringify(checkboxIds2));
		//alert(sessionStorage.getItem("checkboxIds2"))
		
		numOfSelected();
		
	} );
	// 遍历，是否勾选
	$.each( $( ":checkbox:not(#AllChecks)" ), function( index, thiz ) {
		var id = thiz.id.substring("fengcheck".length);
		var flag = false;
		for (key in checkboxIds2) {
			if (id == key) {
				flag = true;
				break;
			}
		}
		if (flag) {
			$(thiz).prop("checked", true);
		}
	} );
	
	function numOfSelected() {
		var num = 0;
		if ( sessionStorage.getItem("checkboxIds2") != null ) {
			checkboxIds2 = JSON.parse(sessionStorage.getItem("checkboxIds2"));
			for (key in checkboxIds2) {
				num += 1;
			}			
		}
		sessionStorage.setItem("num2", num)
		$( "#numOfSelected" ).text( num );
	}
	
	if ( sessionStorage.getItem("num2") == null ) {
		$( "#numOfSelected" ).text( 0 );
	} else {
		$( "#numOfSelected" ).text( sessionStorage.getItem("num2") );
	}
	
	
	if ( $( "td:contains('还没有商品')" ).text() == "还没有商品" ) {
		sessionStorage.setItem("num2", 0);
	}
	
	
	// 地址table的样式
	//$( "table[id=jiangfengkx] tr:even" ).css("background-color", "gray");
		
	$( "table[id=jiangfengkx] tr" ).mouseover( function() {
		$( "#" + this.id ).css("background-color", "#C0C0C0");
	} ).mouseout( function() {
		$( "#" + this.id ).removeAttr("style");
		$( "table[id=index_center] tr:even" ).css("background-color", "gray");
	} );
	
</script>

</body>
</html>
