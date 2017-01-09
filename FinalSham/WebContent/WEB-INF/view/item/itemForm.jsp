<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath(); //첫번째 경로를 가져온다// 컨텍스트경로
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<!-- jquery사용 -->
<script>
	function addReload(itemName, itemPrice, itemTitle, myId) {
		var url = "<%=cp%>/basketAddReload.do";
		var params = "itemName=" + itemName + "&itemPrice=" + itemPrice + "&itemTitle=" + itemTitle + "&id=" + myId;
		$.ajax({
			type : "post",
			url : url,
			data : params,
			dataType : "json",
			success : function(args) {
				if (args.check == 0) {
					alert("이미 추가된 상품입니다.")
				} else {
					alert("상품이 추가되었습니다.")
					$("#badgee").empty();
					$("#badgee").append(args.count)
				}
			},
			error : function(e) {
				alert("에러발생");
			}
		});
	}

	function addList() {
		var url = "<%=cp%>/itemListAdd.do";
		var params = "itemType=" + document.inform.itemType.value + "&itemName=" + 1

		$.ajax({
			type : "post",
			url : url,
			data : params,
			dataType : "json",
			success : function(args) {
				$("#liItem").empty();
				$("#liItem").append("<li class='active'><a href='#!' data-filter='*'>모든 제품</a></li>")
				for (var idx = 0; idx < args.itemList.length; idx++) {
					$("#liItem").append("<li><a href='#!' data-filter=." + args.itemList[idx].itemType + ">" + args.itemList[idx].itemType + "</a></li>")
				}
			},
			error : function(e) {
				alert("에러발생");
			}
		});
	}

	function deleteList() {
		var url = "<%=cp%>/itemListDelete.do";
		var params = "itemType=" + document.inform.itemType.value

		$.ajax({
			type : "post",
			url : url,
			data : params,
			dataType : "json",
			success : function(args) {
				$("#liItem").empty();
				$("#liItem").append("<li class='active'><a href='#!' data-filter='*'>모든 제품</a></li>")
				for (var idx = 0; idx < args.itemList.length; idx++) {
					$("#liItem").append("<li><a href='#!' data-filter=." + args.itemList[idx].itemType + ">" + args.itemList[idx].itemType + "</a></li>")
				}
			},
			error : function(e) {
				alert("에러발생");
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
							class="lil-shopping_cart"></i>
							<div id="badgee" class="badge">${count}</div>
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
		<div class="page-head content-top-margin" style="margin-top: 0px;">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-sm-7">
						<ol class="breadcrumb">
							<li><a href="main.do">Home</a></li>
							<li class="active">Item</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.page-head -->
		<section class="section products-grid second-style">
			<form name="inform">
				<div class="container" id="itemList">
					<div class="row">
						<div class="col-sm-12">
							<ul class="products-filter">
								<div id="liItem">
									<li class="active"><a href="#!" data-filter="*">모든 제품</a></li>
									<c:forEach var="item" items="${itemList }">
										<li><a href="#!" data-filter=".${item.itemType }">${item.itemType }</a></li>
									</c:forEach>
								</div>
								<li><c:if test="${myId eq 'admin'}">
										<input type="text" id="itemType" name="itemType"
											style="width: 50px;">
										<input type="button" value="+" class="plus" name="plus"
											onClick="addList()">
										<input type="button" value="-" class="minus" name="minus"
											onClick="deleteList()">
									</c:if></li>
							</ul>

							<!-- /.products-filter -->
						</div>
						<c:if test="${myId eq 'admin'}">
							<input type="button" value="추가" class="btn btn-default"
								style="aling: right; margin-left: 1100px; margin-bottom: 20px;"
								onclick="document.location.href='itemAddForm.do'">
						</c:if>
						<div class="col-sm-12">
							<div class="clearfix"></div>
							<div class="row masonry">
								<c:forEach var="item" items="${itemCommand}">
									<div
										class="product col-md-3 col-sm-6 col-xs-12 ${item.itemType }"
										data-product-id="1">
										<div class="inner-product">
											<div class="product-thumbnail"
												style="width: 300px; height: 300px; overflow: hidden"
												id="imgDiv">
												<img src="fileList/${item.itemPhoto}"
													style="width: 300px; height: 300px; margin-left: -30px;"
													class="img-responsive">
											</div>
											<div class="product-details text-center">
												<div class="product-btns">
													<span data-toggle="tooltip" data-placement="top"
														title="Add To Cart" class="li-icon"
														onClick="addReload('${item.itemName}','${item.itemPrice }','${item.itemTitle }','${myId }')">
														<i class="lil-shopping_cart"></i>
													</span><span data-toggle="tooltip" data-placement="top"
														title="View"> <a
														href="itemInfoForm.do?itemName=${item.itemName }"
														class="li-icon view-details"><i class="lil-search"></i></a>
													</span>
												</div>
											</div>
										</div>
										<h3 class="product-title">
											<a href="#!">${ item.itemName}</a>
										</h3>
										<p class="product-price">
											<ins>
												<span class="amount">${ item.itemPrice}</span>
											</ins>
										</p>
									</div>
									<!-- /.product -->
								</c:forEach>
							</div>
						</div>
					</div>
					<!-- /.masonry -->
				</div>
			</form>
		</section>
	</section>
</div>
<!-- /.row -->
</div>
<!-- /.container -->
</section>

<!-- /.products-grid -->


<!-- open/close -->
<div class="overlay overlay-simplegenie">
	<i class="overlay-close lil-close"></i>
	<div class="container">
		<div class="row text-center pos-r">
			<div
				class="col-md-7 col-xs-11 col-center col-height-center search-form">
				<form action="#!" method="POST" class="inputs-bg" id="searchform">
					<strong>Type a sentence or word you want to search for,
						And press Enter.</strong> <input type="text" name="q" class="form-control"
						placeholder="Search..">
				</form>
			</div>
		</div>
	</div>
</div>

<a href="#top" class="go-to-top"> <i class="lil-angle-double-down"></i>
</a>

<script type="text/javascript" src="build/js/min.js"></script>
</body>
</html>
</section>