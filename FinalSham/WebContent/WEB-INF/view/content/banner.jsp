<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">

	$(document).ready(function() {

		$("#btnTd button").click(function() {
			var sliderCount = document.forms[0].sliderVar.length;
			var num = $(this).attr("id");
			var trname = "tr#" + num;

			if (sliderCount == undefined) {
				alert("최소 한 개의 배너가 존재해야 합니다.");
				return false;
			} else {
				$(trname).remove();
				return false;
			}
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#UploadedImg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
		return false;
	}
	function fncProductFile() {
		document.addForm.photo.click();
		document.addForm.photo.onchange();
	}

	function fn_addBanner() {
		var str = "<p><input type='file' style='display: none' name='photo' id='photo' onchange='readURL(this)'><img src=build/img/slider/sliderAdd.jpg class=img-responsive style='width: 500px; height: 300px; cursor: hand;' onclick='fncProductFile()' id='UploadedImg'></p>";
		$("#fileDiv").append(str);

	}

	$(function onchange() {
		$("#photo add").on('change', function() {
			readURL(this);
		});
	});

	$(function onclick() {
		$("#add ").click('change', function() {
			readURL(this);
		});
	});
</script>

<div class="page-head content-top-margin">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-7">
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li class="active">베너관리</li>
				</ol>
			</div>
		</div>
	</div>
</div>


<section class="section" id="page-wishlist">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="table-responsive">
					<form name="addForm" id="addForm" method="post" enctype="multipart/form-data" runat="server" action="bannerSubmit.do">
						<table class="table cart-table wishlist-table" id="example"
							cellspacing="0">
							<!-- <input type='file' style='display: none' name='photo1' > -->
							<tbody id="add">
								<c:forEach items="${sliderList}" var="sliderList"
									varStatus="status">
									<div class="banners">
										<tr class="banner" id="${status.count}">
											<input type="hidden" name="sliderVar" id="sliderVar"
												value="${sliderList.sliderImage}">
											<td class="bannerImage"><img
												src="${sliderList.sliderImage}" alt="" width="500px"
												height="300px"></td>
											<td id="btnTd"><button class="btn btn-primary"
													id="${status.count}">베너 삭제</button></td>
										</tr>
									</div>
								</c:forEach>
								<tr id="fileDiv">

								</tr> 
							</tbody>
						</table>
						<div class="row" style="margin: auto; width: 300px;" id="fileDiv">

						</div>

						<div class="row" style="margin: auto; width: 400px">
							<input type="button" value="베너추가" class="btn btn-primary"
								onclick="fn_addBanner()"> <input type="submit"
								id="submit" value="확인" class="btn btn-default" /> <input
								type="button" value="취소" class="btn btn-primary"
								onclick="javascript:location.href='banner.do'">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>