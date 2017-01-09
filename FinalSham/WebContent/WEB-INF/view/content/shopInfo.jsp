<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/HuskyEZCreator.js"
	charset="utf-8"></script>
<div class="page-head content-top-margin">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-7">
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li class="active">매장소개</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
</div>
<%-- 
<section class="section" id="page-about">
	<div class="container">
		<div class="row">
			<c:forEach items="${shopInfoList}" var="shopInfoList"
				varStatus="status">
				<p>${shopInfoList.shopInfo}</p>
			</c:forEach>
		</div>
	</div>
	<c:if test="${myId eq 'admin'}">
		<div class="row" style="margin: auto; width: 80px">
			<input type="button" value="수정" class="btn btn-primary"
				onclick="javascript:location.href='shopInfoUpdate.do'" />
		</div>
	</c:if>

	<!-- /.container -->
</section>
 --%>
<section class="section" id="page-about">
	<div class="container">
		<div class="row">

			<div class="block clearfix">
				<div class="col-sm-4">
					<h2 class="title">We create products by today's standards.</h2>
					<p class="subtitle description">Lorem Ipsum is simply dummy
						text of the printing and typesetting industry. Lorem Ipsum has
						been the standard dummy text. Lorem Ipsum is simply dummy text of
						the printing and typesetting industry.</p>
				</div> 
				<div class="col-sm-8">
					<div class="image">
						<img src="build/img/logo.png" class="img-responsive">
					</div> 
				</div>
			</div>
			<div class="block clearfix">
				<div class="col-sm-8">
					<div class="image">
						<img src="build/img/shop3.jpg" class="img-responsive">
						<div class="caption">
							<span>Mission</span>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<h2 class="title">Make it blend in or stand out.</h2>
					<p class="subtitle description">Lorem Ipsum is simply dummy
						text of the printing and typesetting industry. Lorem Ipsum has
						been the standard dummy text. Lorem Ipsum is simply dummy text of
						the printing and typesetting industry.</p>
					<p class="subtitle description">Lorem Ipsum is simply dummy
						text of the printing and typesetting industry. Lorem Ipsum has
						been the standard dummy text. Lorem Ipsum is simply dummy text of
						the printing and typesetting industry.</p>
				</div>
			</div>

			<div class="block clearfix">
				<div class="col-sm-4">
					<h2 class="title">We create products by today's standards.</h2>
					<p class="subtitle description">Lorem Ipsum is simply dummy
						text of the printing and typesetting industry. Lorem Ipsum has
						been the standard dummy text. Lorem Ipsum is simply dummy text of
						the printing and typesetting industry.</p>
					<p class="subtitle description">Lorem Ipsum is simply dummy
						text of the printing and typesetting industry. Lorem Ipsum has
						been the standard dummy text. Lorem Ipsum is simply dummy text of
						the printing and typesetting industry.</p>
				</div>
				<div class="col-sm-8">
					<div class="image">
						<img src="build/img/shop.jpg" class="img-responsive">
						<div class="caption">
							<span>Our</span> <span>Office</span>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div> 
</section>