<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$("#th1 input").click(function() {
			var clickUserId = $(this).parent().parent().attr("id");
			var trname = "div#" + num;
			$(trname).remove();
			return false;
		});
	});


	function check() {
		return confirm("정말 삭제하시겠습니까?");
	}
</script>
<div class="page-head content-top-margin">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-7">
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li class="active">회원관리</li>
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
					<h3 class="title">회원 관리</h3>
					<table class="table cart-table order-details-table">
						<thead>
							<tr>
								<th class="userId" style="width: 15%">아이디</th>
								<th class="userName" style="width: 10%">이름</th>
								<th class="userBrith" style="width: 15%">생년월일</th>
								<th class="userPhone" style="width: 20%">핸드폰</th>
								<th class="userEmail" style="width: 30%">이메일</th>
								<th class="userBtn" style="width: 10%">삭제</th>
							</tr> 
						</thead>
						<tbody> 
							<c:forEach items="${user}" var="userList" varStatus="status">
								<form name="addForm" id="addForm" method="post"
									action="deleteUser.do?id=${userList.id}" onsubmit="return check()">
									<tr id="${userList.id}">
										<c:if test="${userList.name ne 'admin'}">
											<td class="userId" id="userId"><a
												href="userInfoView.do?id=${userList.id}">${userList.id}</a></td>
											<td class="userName">${userList.name}</td>
											<td class="userBrith">${userList.birth}</td>
											<td class="userPhone">${userList.cellphone}</td>
											<td class="userEmail">${userList.email}</td>
											<th class="userBtn" id="th1"><input type="submit"
												id="submit" value="삭제" class="btn btn-primary" />
										</c:if>
									</tr> 
								</form>
							</c:forEach>
						</tbody>

					</table>
					<div class="row" align="center">
						<c:if test="${count > 0}">
							<h5 id="pagingVal">
								<c:set var="pageCount"
									value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}" />
								<c:set var="pageBlock" value="${10}" />
								<fmt:parseNumber var="result" value="${currentPage / 10}"
									integerOnly="true" />
								<c:set var="startPage" value="${result * 10 + 1}" />
								<c:set var="endPage" value="${startPage + pageBlock-1}" />
								<c:if test="${endPage > pageCount}">
									<c:set var="endPage" value="${pageCount}" />
								</c:if>

								<c:if test="${startPage > 10}">
									<a
										href="userManage.do?pageNum=${startPage - 10}&search=${search}&searchn=${searchn}">[이전]</a>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}"
									varStatus="status">
									<a class="pageClass" id="${status.count}"
										href="userManage.do?pageNum=${i}&search=${search}&searchn=${searchn}">[${i}]</a>
								</c:forEach>

								<c:if test="${endPage < pageCount}">
									<a
										href="userManage.do?pageNum=${startPage + 10}&search=${search}&searchn=${searchn}">[다음]</a>
								</c:if>
							</h5>
						</c:if>
					</div>
					<form colspan=2 align="center">
						<select name="searchn">
							<option value="0">아이디</option>
							<option value="1">이름</option>
							<option value="2">생년월일</option>
							<option value="3">핸드폰</option>
							<option value="4">이메일</option>
						</select> <input type="text" name="search" size="15" maxlength="50" /> <input
							type="submit" id="submit" value="검색" class="btn btn-default" />
					</form>
				</div>
				<!-- /.box -->
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
</section>