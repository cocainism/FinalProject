<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="swiper-slider">
	<!-- Slider main container -->
	<div class="swiper-container fullscreen">
		<!-- Additional required wrapper -->
		<div class="swiper-wrapper text-center">
			<!-- Slides -->
			<c:forEach items="${sliderList}" var="sliderList" varStatus="status">
				<div class="swiper-slide"
					style="width: 20%; height: 100%; background-image: url(${sliderList.sliderImage});">
					<div class="valign-wrapper fullscreen">
						<div class="valign col-xs-offset-8"></div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- If we need pagination -->
		<div class="swiper-pagination"></div>
		<!-- If we need navigation buttons -->
		<div class="swiper-button-prev">
			<i class="lil-chevron_left"></i>
		</div>
		<div class="swiper-button-next">
			<i class="lil-chevron_right"></i>
		</div>
	</div>
</div>
<!-- /.swiper-slider -->


<section class="section collections no-padding-bottom"
	id="home-collections">
	<div class="container">
		<div class="row">
			<div class="col-sm-4 collection">
				<a href="#!"> <img src="build/img/collections/notice.png"
					class="img-responsive" style="width: 360px; height: 114px" alt="">
			</div>
			<!-- /.collection -->
			<div class="col-sm-4 collection"> 
				<a href="#!"> <img src="build/img/collections/Reserve.png"
					class="img-responsive" style="width: 360px; height: 114px" alt="">
				</a>
			</div>
			<!-- /.collection -->
			<div class="col-sm-4 collection"> 
				<a href="#!"> <img src="build/img/collections/location.jpg"
					class="img-responsive" style="width: 360px; height: 114px" alt="">
				</a>
			</div>
			<!-- /.collection -->
		</div>
	</div>
	<!-- /.row -->
	</div>
	<!-- /.container -->
</section>
<!-- /.collections -->

<section class="section products second-style" id="home-products">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 section-title text-center">
				<h3>
					<i class="line"></i>Styling<i class="line"></i>
				</h3>
				<p>여성스타일 & 남성스타일</p>
			</div>
			<div class="col-sm-12">
				<div class="masonry row">
					<c:forEach items="${mainList}" var="mainList" varStatus="status">
						<div class="product col-md-3 col-sm-6 col-xs-12"
							data-product-id="1">
							<div class="inner-product">
								<div class="product-thumbnail">
									<img src="styleImages/${style.stylePhoto}"
										class="img-responsive" alt="">
								</div>
								<div class="product-details text-center">
									<div class="product-btns">
										<span data-toggle="tooltip" data-placement="top"
											title="Add To Cart"> <a href="#!"
											class="li-icon add-to-cart"><i class="lil-shopping_cart"></i></a>
										</span> <span data-toggle="tooltip" data-placement="top"
											title="Add to Favorites"> <a href="#!" class="li-icon"><i
												class="lil-favorite"></i></a>
										</span>
									</div>
								</div>
							</div>
							<h3 class="product-title">
								<a href="#!"><p>${mainList.styleName}</p></a>
							</h3>
							<p class="product-designer">
								<ins>
									디자이너 : <span class="amount">${mainList.designer}</span>
								</ins>
							</p>
							<p class="product-price">
								<ins>
									<span class="amount">${mainList.price}원</span>
								</ins>
							</p>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>

