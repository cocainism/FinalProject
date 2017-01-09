<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">

</script>
<div class="page-head content-top-margin">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-7">
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li><a href="userManage.do">회원관리</a></li>
					<li class="active">회원상세정보</li>
				</ol>
			</div>
		</div>
	</div>
</div>

<section class="section" id="page-order-received">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="box table-responsive">
					<h3 class="title">${id}님</h3>
					<table class="table cart-table order-details-table">
						<thead>
							<tr>
								<th class="userName" style="width: 10%">이름</th>
								<th class="userBrith" style="width: 15%">생년월일</th>
								<th class="userPhone" style="width: 20%">핸드폰</th>
								<th class="userEmail" style="width: 30%">이메일</th>
								<th class="userVisit" style="width: 15%">방문횟수</th>
								<th class="VisitAdd" style="width: 10%">방문추가</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userInfo}" var="userInfo" varStatus="status">
								<tr>
									<td class="userName">${userInfo.name}</td>
									<td class="userBrith">${userInfo.birth}</td>
									<td class="userPhone">${userInfo.cellphone}</td>
									<td class="userEmail">${userInfo.email}</td>
									<td class="userVisit">${visitCount}</td>
									<th class="VisitAdd"><button type="button"
											class="btn btn-primary">추가</button></th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- /.box -->
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
</section>