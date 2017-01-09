<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
				<li class="shopping-cart"><a href="basketForm.do?id=${myId}"
					class="li-icon" aria-haspopup="false" aria-expanded="false"> <i
						class="lil-shopping_cart"></i><span class="badge">${count}</span>
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
							<li><a href="shopInfo.do">매장정보</a></li>
							<li><a href="products-with-filter.html">공지사항</a></li>
							<li><a href="designer.do">디자이너 정보</a></li>
							<li><a href="products-sidebar-right.html">가격표</a></li>
							<li><a href="location.do">오시는 길</a></li>
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
					<li><a href="list.do">공지사항</a></li>
					<c:if test="${myId eq 'admin'}">
						<li><a href="#!" data-toggle="dropdown" aria-haspopup="false"
							aria-expanded="false">관리<i class="caret"></i></a>
							<ul class="dropdown-menu">
								<li><a href="banner.do">베너관리</a></li>
								<li><a href="userManage.do">회원관리</a></li>
							</ul></li>
					</c:if>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
		<!--/.container -->
	</nav>
</div>
<!-- /.nav-container -->