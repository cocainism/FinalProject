<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<section class="section collections no-padding-bottom"
	id="home-collections">
	<div class="page-head content-top-margin">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-sm-7">
					<ol class="breadcrumb">
						<li><a href="main.do">Home</a></li>
						<li class="active">Styles</li>
					</ol>
				</div>
			</div><!-- /.row -->
		</div><!-- /.container -->
	</div><!-- /.page-head -->
<section class="section products-grid second-style">

<div align="center">
	<h1>Woman Medium Style</h1>
</div>
<c:if test="${myId eq 'admin' }">
<div align="center">
<input type="button" value="add" class="btn btn-default" style="margin-left: 1060px;margin-bottom: 20px;" Onclick="window.location='insertStyleForm.do'"/>
</div>
</c:if>
	<div class="container">
		<div class="row masonry">
			<!-- 스타일 시작 -->
			<c:forEach var="style" items="${style }">
			<c:if test="${style.styleGender eq 'woman' && style.styleType eq 'medium'}">
			<div class="product col-md-3 col-sm-6 col-xs-12" data-product-id="1">
				<div class="inner-product">
				
					<c:if test="${style.viewCount >= 30 }">
					<!-- <span class="onsale">Sale!</span> -->
					<!-- <span class="onsale new">New!</span> -->
					<span class="onsale hot" style="margin-right: 30px;">Hot!</span>
					</c:if>
					
					<div class="product-thumbnail">
						<img src="styleImages/${style.stylePhoto }" class="img-responsive" alt="" style="width: 210px;height: 300px;margin-left: 20px;">
					</div>
					<div class="product-details text-center">
						<div class="product-btns">
							<span data-toggle="tooltip" data-placement="top" title="View" style="margin-right: 10px;">
								<a href="styleInfo.do?styleNum=${style.styleNum}" class="li-icon view-details"><i class="lil-search"></i></a>
							</span>
						</div>
					</div>
				</div>
				<h3 class="product-title">${style.styleName }</h3>
				<h5 class="product-title">${style.designer }</h5>
				<p class="product-price">
					<ins>
						<span class="amount">${style.price }원</span>
					</ins>
				</p>
			</div>
			</c:if>
			</c:forEach>
		</div>
	</div>
</section>
</section>