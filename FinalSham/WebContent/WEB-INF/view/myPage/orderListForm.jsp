<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<section class="section collections no-padding-bottom"
	id="home-collections">

<section class="section collections no-padding-bottom"
		id="home-collections">
		<div class="page-head content-top-margin" style="margin-top: 0px;">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-sm-7">
						<ol class="breadcrumb">
							<li><a href="main.do">Home</a></li>
							<li><a href="myPageForm.do">MY PAGE</a></li>&nbsp;
							<li class="active">ORDER LIST</li>&nbsp;
							<li><a href="#!">PROCEDURE LIST</a></li>&nbsp;
							<li><a href="#!">RESERVATION LIST</a></li>
												
						</ol>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
</section>
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
									<td class="product-name">ITEM NAME</td>
									<td class="product-price">ITEM PRICE</td>
									<td class="product-stock-stauts">ITEM DATE</td>
									<td class="product-stock-stauts">ITEM COUNT</td>
									<td class="product-add-to-cart">&nbsp;</td>
								</tr>
							</thead>							
							<tbody>
							
								<c:forEach var="list" items="${buyItemList}">
									<tr class="item" align="center">
										<td class="product-name"><a href="product.html">${list.itemName }</a></td>
										<td class="product-price"><span class="amount">${list.itemPrice }</span></td>
										<td><span class="amount">${list.itemDate }</span></td>
										<td class="product-stock-stauts"><span class="amount">${list.itemCount }</span></td> 
										 
									</tr>
								</c:forEach>
 								
<%-- 								<c:if test="${buyItemCount > 0}">
   									<c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   									<c:set var="pageBlock" value="${10}"/>   									
   									<fmt:parseNumber var="result"  integerOnly="true" />
   									<c:set var="startPage" value="${result * 10 + 1}" />
									<c:set var="endPage" value="${startPage + pageBlock-1}" />
									<c:if test="${endPage > pageCount}">
										<c:set var="endPage" value="${pageCount}" />
									</c:if>
									<c:if test="${startPage > 10}">
										<a href="/MVC_board/MVC/list.do?pageNum=${startPage - 10 }">[이전]</a>
									</c:if>
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<a href="/MVC_board/MVC/list.do?pageNum=${i}">[${i}]</a>
									</c:forEach>
									<c:if test="${endPage < pageCount}">
										<a href="/MVC_board/MVC/list.do?pageNum=${startPage + 10}">[다음]</a>
									</c:if>
								</c:if>  --%>
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