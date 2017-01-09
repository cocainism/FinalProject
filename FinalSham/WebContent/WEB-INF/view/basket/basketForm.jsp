<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath(); //첫번째 경로를 가져온다// 컨텍스트경로
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>

<script>
function deleteReload(itemName,myId) {
		var url="<%=cp%>/basketDeleteReload.do";
		var params = "itemName=" + itemName + "&id=" + myId;
		$.ajax({
			type : "post",
			url : url,
			data : params,
			dataType : "json",
			success : function(args) {	
				$("#basketList tbody").empty();		
					for(var idx=0; idx<args.basketList.length; idx++) {		
						$("#basketList tbody").append(
								"<tr align=center><td class=product-thumbnail><a href=product.html>"+
								"<img src=fileList/"+args.basketList[idx].itemPhoto+" style='width: 150px; height: 150px' class=img-responsive>"+"</a></td>"+
								"<td class='product-name'><a href='product.html'>"+ args.basketList[idx].itemName +"</a></td>"+
								"<td class=product-price><span class='amount'>"+args.basketList[idx].itemPrice+ "</span>"+
								"</td><td class=product-stock-stauts><input type='text' value="+args.basketList[idx].itemCount+" style='width:20px; height:20px; padding-left:4px'></td>"+
								"<td class='product-add-to-cart'><button class='btn btn-default' type='button'>APPROVAL</button>&nbsp;"+
								"<button class='btn btn-default' type='button' onClick=deleteReload("+"'"+encodeURIComponent(args.basketList[idx].itemName)+"'"+","+ "'"+myId+"'"+")"+">DELETE</button>"+
								"</td></tr>");					
					} 
			$("#badgee").empty();
			$("#badgee").append(args.count)
			}
			,error:function(e) {
		    	alert(e.responseText); 
		    }
		});
	}
</script>
<div class="content-top-margin">

	<div class="nav-container navbar-fixed-top nav-sticky">

		<nav class="sub-navbar">
			<ul class="pull-right list-inline">
				<c:if test="${myId!=null}">
					<li><p style="margin-top: 7px;">${myId}님환영합니다.</p></li>
					<li><a href="logout.do">LOGOUT</a></li>
					<li><a href="myPageForm.do">MyPage</a></li>
				</c:if>
				<c:if test="${myId==null}">
					<li><a href="loginForm.do">LOGIN</a></li>
					<li><a href="joinForm.do">JOIN US</a></li>
				</c:if>
			</ul>
			<div class="clearfix"></div>
		</nav>
		<!-- /.sub-navbar -->
		<nav class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="main.do"> <img
						src="build/img/logo.svg" alt="Sham Theme">
					</a>
				</div>
				<ul class="navbar-nav navbar-icons">
					<li class="shopping-cart"><a href="basketForm.do?id=${myId }"
						class="li-icon" aria-haspopup="false" aria-expanded="false"> <i
							class="lil-shopping_cart"></i><div id="badgee" class="badge">${count}</div>
					</a>
						<li><a href="basketForm.do" class="li-icon"
						id="trigger-overlay"><i class="lil-search"></i></a></li>
			</ul>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-left">
					<li class="active"><a href="index.html" aria-haspopup="false"
							aria-expanded="false">예약하기 </a></li>
					<li><a href="#!" data-toggle="dropdown" aria-haspopup="false"
							aria-expanded="false">매장 <i class="caret"></i></a>
						<ul class="dropdown-menu">
							<li><a href="products.html">매장정보</a></li>
							<li><a href="products-with-filter.html">공지사항</a></li>
							<li><a href="products-sidebar-left.html">디자이너 정보</a></li>
							<li><a href="products-sidebar-right.html">가격표</a></li>
							<li><a href="product.html">오시는 길</a></li>
						</ul></li>
					<li><a href="#!" data-toggle="dropdown" aria-haspopup="false"
						aria-expanded="false">여성스타일 <i class="caret"></i></a>
						<ul class="dropdown-menu">
							<li><a href="wTotalList.do">전체</a></li>
							<li><a href="wLongList.do">롱기장</a></li>
							<li><a href="wMediumList.do">미디움</a></li>
							<li><a href="wShortList.do">쇼트</a></li>
						</ul></li>
					<li><a href="#!" data-toggle="dropdown" aria-haspopup="false"
						aria-expanded="false">남성스타일 <i class="caret"></i></a>
						<ul class="dropdown-menu">
							<li><a href="mTotalList.do">전체</a></li>
							<li><a href="mCutList.do">컷</a></li>
							<li><a href="mPermList.do">펌</a></li>
							<li><a href="mColorList.do">염색</a></li>
						</ul></li>
					<li><a href="itemForm.do">제품소개</a></li>
					<li><a href="contact.html">후기게시판</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
		<!--/.container -->
	</nav>
</div>
<!-- /.nav-container -->


<section class="section collections no-padding-bottom"
	id="home-collections">

	<section class="section" id="page-wishlist">
	<form name="inform">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="table-responsive">
						<div id="basketList" >
						<table class="table cart-table wishlist-table">							
							<thead>
								<tr align="center">
									<td class="product-thumbnail">&nbsp;</td>
									<td class="product-name">ITEM</td>
									<td class="product-price">ITEM PRICE</td>
									<td class="product-stock-stauts">COUNT</td>
									<td class="product-add-to-cart">&nbsp;</td>
								</tr>
							</thead>							
							<tbody>
							
								<c:forEach var="list" items="${basketList}">
									<tr class="item" align="center">
										<td class="product-thumbnail"><a href="product.html">
												<img src="fileList/${list.itemPhoto}" style="width: 150px; height: 150px" class="img-responsive">
										</a></td>
										<td class="product-name"><a href="product.html">${list.itemName }</a></td>
										<td class="product-price"><span class="amount">${list.itemPrice }</span>
									 	</td>
										<td class="product-stock-stauts"><input type="text" value=${list.itemCount } style="width:20px; height:20px; padding-left:4px;"></td> 
										<td>
										<td class="product-add-to-cart">
											<button class="btn btn-default" type="button">APPROVAL</button>
											<button class="btn btn-default" type="button" onClick="deleteReload('${list.itemName}','${myId }')">DELETE</button>
										</td>
									</tr>
								</c:forEach>
								
							</tbody>							
						</table>
						</div>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.row -->
		</div>
		</form>
		<!-- /.container -->
	</section>
</section>