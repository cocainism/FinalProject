<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<section class="section collections no-padding-bottom"
	id="home-collections">

	<script type="text/javascript">
		function deleteCheck() {
			check = confirm("정말 삭제하시겠습니까?");
			if (check == true) {
				alert("삭제합니다.");

				location.href = "deleteStyleForm.do?styleNum=" + $
				{
					style.styleNum
				}
				+"&styleType=" + '${style.styleType}';
			} else {
				alert("취소합니다.");
			}
		}
	</script>
	<div class="page-head content-top-margin">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-sm-7">
					<ol class="breadcrumb">
						<li><a href="main.do">Home</a></li>

						<c:if test="${style.styleType eq 'cut' }">
							<li><a href="mCutList.do">Man Cut Styles</a></li>
						</c:if>
						<c:if test="${style.styleType eq 'perm' }">
							<li><a href="mPermList.do">Man Perm Styles</a></li>
						</c:if>
						<c:if test="${style.styleType eq 'color' }">
							<li><a href="mColorList.do">Man Color Styles</a></li>
						</c:if>
						<c:if test="${style.styleType eq 'long' }">
							<li><a href="wLongList.do">Woman Long Styles</a></li>
						</c:if>
						<c:if test="${style.styleType eq 'medium' }">
							<li><a href="wMediumList.do">Woman Medium Styles</a></li>
						</c:if>
						<c:if test="${style.styleType eq 'short' }">
							<li><a href="wShortList.do">Woman Short Styles</a></li>
						</c:if>


						<li class="active">${style.styleName }</li>
					</ol>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.page-head -->

	<section class="section single-product-wrapper">
		<div class="container">

			<div class="row">
				<div class="col-sm-5">
					<div class="product-images">
						<div class="product-thumbnail">
							<img src="styleImages/${style.stylePhoto }"
								class="img-responsive"
								style="width: 320px; height: 450px; margin-left: 230px;">

						</div>
					</div>
					<!-- /.product-images -->
				</div>
				<div class="col-sm-6 col-sm-offset-1"
					style="margin-left: 180px; width: 380px; height: 450px;">
					<div class="product-details">
						<div class="rating">
							<span class="rating-text" style="margin-left: 0px;">조회수 :
								${style.viewCount }</span>
							<!-- <span class="pull-right">게시글 번호 <span>2</span></span> -->
						</div>
						<p>
						<div class="product-title">
							<h3 class="product-name">스타일 : ${style.styleName }</h3>
							<hr>
						</div>
						<div class="product-title">
							<h3 class="product-name">담당 디자이너 : ${style.designer }</h3>
							<hr>
						</div>

						<p class="price">
							가격 :
							<!-- <del>
								<span class="amount">15,000원</span>
							</del> -->
							<ins>
								<span class="amount">${style.price }원</span>
							</ins>
						</p>
						<c:if test="${myId eq 'admin' }">
							<input type="button" value="update" class="btn btn-default"
								style="margin-top: 100px;"
								Onclick="window.location='updateStyleForm.do?styleNum=${style.styleNum}'" />
							<input type="button" value="delete" class="btn btn-default"
								style="margin-top: 100px;" Onclick="deleteCheck()" />
						</c:if>
					</div>
					<!-- /.product-details -->
				</div>

			</div>
			<!-- /.row -->
			<p>
			<div class="section-title text-center">
				<h3>
					<i class="line"></i>Related Information<i class="line"></i>
				</h3>
			</div>
			<p>
				<c:if test="${videoList != null }">
					<c:forEach var="video" items="${videoList }">
						<p>
							<iframe src="${video }" frameborder="0" allowfullscreen
								style="width: 700px; height: 500px; margin-left: 230px;"></iframe>
						</p>
					</c:forEach>
				</c:if>
			<p>
				<c:forEach var="photo" items="${photoList }">
					<div class="col-sm-12">
						<div class="product-thumbnail">
							<img src="styleImages/${photo }" class="img-responsive" alt=""
								style="width: 700px; height: 500px; margin-left: 215px;">
						</div>
					</div>
				</c:forEach>
			</p>

		</div>
		<!-- /.container -->
	</section>
	<!-- /.products -->
</section>