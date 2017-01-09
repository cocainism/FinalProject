<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath(); //첫번째 경로를 가져온다// 컨텍스트경로
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>

<script>	
/* 	function buyItem(itemName,email,myId) {
		alert("2222")
		alert(itemName)
		alert(email)
		alert(myId)
		alert(document.countForm.number.value)
		var num1 = document.countForm.number.value;		
		location.href="buyItem.do?num="+num1+"&email="+email+"&id="+myId+"&itemName="+itemName
		
	} */


	function plusCount(max){
		if( document.countForm.itemCount.value < max ){
			document.countForm.itemCount.value = eval(document.countForm.itemCount.value) + 1
		}
	}
	
	function minusCount(){
		if( document.countForm.itemCount.value > 1 ){
			document.countForm.itemCount.value = eval(document.countForm.itemCount.value) - 1
		}
	}
	
	function addReload(itemName,itemPrice,itemTitle,myId) {
		var url="<%=cp%>/basketAddReload.do";
		var params="itemName="+itemName+"&itemPrice="+itemPrice+"&itemTitle="+itemTitle+"&id="+myId+"&itemCount="+document.countForm.itemCount.value;
		$.ajax({
			type:"post"
			,url:url	
			,data:params
			,dataType:"json"
			,success:function(args){
				if( args.check == 0){
					alert("이미 추가된 상품입니다.")
				}else{
					alert("상품이 추가되었습니다.")
					$("#badgee").empty();
					$("#badgee").append(args.count)
				}
			}
		    ,error:function(e) {
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
	<section class="section collections no-padding-bottom"
		id="home-collections">
		<div class="page-head content-top-margin" style="margin-top: 0px;">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-sm-7">
						<ol class="breadcrumb">
							<li><a href="main.do">Home</a></li>
							<li><a href="itemForm.do">Item</a></li>
							<li class="active">${item.itemName }</li>
						</ol>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.page-head -->


		<section class="section collections no-padding-bottom"
			id="home-collections">

			<section class="section single-product-wrapper">
				<c:if test="${myId eq 'admin'}">
					<table>
						<tr>						
							<td>
							<input type="button" value="수정" class="btn btn-default"
								style="aling: right; margin-left: 1300px; margin-bottom: 20px;"
								onclick="document.location.href='itemModifyForm.do?itemName=${item.itemName}'">
							</td>
							<td>
							<input type="button" value="삭제" class="btn btn-default"
								style="aling: right; margin-left: 10px; margin-bottom: 20px;"
								onclick="document.location.href='itemDelete.do?itemName=${item.itemName}'">
							</td>
						</tr>
					</table>

				</c:if>
				<div class="container">
					<div class="row">
						<div class="col-sm-5">
							<div class="product-images">
								<div class="product-thumbnail">
									<img src="fileList/${item.itemPhoto}"
										style="width: 300px; height: 300px; margin-left: 200px"img-responsive">
									</a>
								</div>
							</div>
							<!-- /.product-images -->
						</div>

						<div class="col-sm-6 col-sm-offset-1">
							<div class="product-details">
								<div class="product-title">
									<h3 class="product-name">${ item.itemName}</h3>
									<hr>
								</div>

								<div class="description">
									<p>${ item.itemContent}</p>

								</div>

								<p class="price">
									<ins>
										<span class="amount">${ item.itemPrice}</span>
									</ins>
								</p>
					
								<form name="countForm" action="buyItem.do" method="POST"
									class="inputs-border">
									<div class="form-group">
										<div class="quantity">
											<input type="button" value="+" class="plus" name="plus" onClick="plusCount(${item.itemCount})"> 
											<input type="number" step="1" max="5" min="1" name="itemCount" value="1" title="Qty" class="qty" size="4"> 
											<input type="button" value="-" class="minus" name="minus" onClick="minusCount()">
										</div>
											<input type="hidden" name="email" value="${myInfo.getEmail()}">
											<input type="hidden" name="itemName" value="${item.itemName }">
											<input type="hidden" name="itemTitle" value="${item.itemTitle }">
											<input type="hidden" name="itemPrice" value="${item.itemPrice }">										
											<input type="hidden" name="id" value="${myId }">
											
											<c:if test="${myId != null }">									
											<input type="submit" class="btn btn-default" value="결제">
											<button type="button" class="btn btn-default"
												onClick="addReload('${item.itemName}','${item.itemPrice }','${item.itemTitle }','${myId }')">
												<i class="lil-add_shopping_cart"></i> Add to cart
											</button>
											</c:if>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</section>
		<!-- /.related-products -->
	</section>
	</body>
	</html>