<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<div class="page-head content-top-margin">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-7">
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li><a href="userManage.do">회원관리</a></li>
					<li><a href="userInfoView.do">회원상세정보</a></li>
					<li class="active">방문추가</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<section class="section collections no-padding-bottom"
	id="home-collections">
	<div class="container">
		<div class="row">
			<div class="col-sm-6" style="margin-left: 300px;">
				<div class="box" style="width: 484px;"> 
					<h2>VISIT ADD</h2>
					<br>
					<form name="visitAddForm" id="visitAddForm"
						action="visitAdd.do?id=${id}"
						class="register-form inputs-border inputs-bg" method="post">
						<table align="center">
							<tr>
								<td style="padding-bottom: 10px"><label>회원 ID</label></td>
								<td style="padding-left: 40px; padding-bottom: 10px">${id}</td>
							</tr>

							<tr>
								<td style="padding-bottom: 10px"><label>스타일</label></td>
								<td style="padding-left: 40px; padding-bottom: 10px">
									<input type="text" name="style" id="style" class="form-control" placeholder="스타일">
								</td>
							</tr>							

							<tr>
								<td style="padding-bottom: 10px"><label>가격</label></td>
								<td class="product-quantity"
									style="padding-left: 40px; padding-bottom: 10px">
									<div class="quantity">
										<input type="button" value="+" class="plus"> <input
											type="number" step="5000" max="1000000" min="10000"
											value="10000" title="Qty" class="qty" size="10" name="price"
											class="form-control"> <input type="button" value="-"
											class="minus">
									</div>
								</td>

							</tr>

							<tr>
								<td style="padding-bottom: 10px"><label>디자이너</label></td>
								<td style="padding-left: 40px; padding-bottom: 10px"><select
									class="form-control" type="text" name="designer"
									placeholder="디자이너 선택">
										<option>디자이너 선택</option>
										<c:forEach items="${designerList}" var="designerList"
											varStatus="status">
											<option value="${designerList.designer}">${designerList.designer}</option>
										</c:forEach>
								</select></td>
							</tr>
						</table>
						<div class="form-group text-right">
							<input type="submit" value="확인" class="btn btn-default">
							<input type="button" value="취소" class="btn btn-default"
								OnClick="window.location='userInfoView.do?id=${id}'">
						</div>
					</form>
				</div>
				<!-- /.box -->
			</div>
		</div>
		<!-- /.row -->
	</div>
</section>
