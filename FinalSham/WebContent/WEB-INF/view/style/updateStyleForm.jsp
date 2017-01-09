<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<section class="section collections no-padding-bottom"
	id="home-collections">

	<script type="text/javascript" src="../common/js/jquery-1.9.1.min.js"
		charset="UTF-8"></script>
	<script type="text/javascript">
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
			document.updateForm.photo.click();
			document.updateForm.photo.onchange();
		}

		function fn_addFile() {
			var str = "<tr><td><input type='file' name='photo2' class='form-control' style='margin-left:70px; width:260px'></td><td><input type='button' class='btn btn-default' style='margin-left: 20px;' value='삭제' onclick='fn_deleteFile(this)'></td>	</tr>";
			$("#fileDiv").append(str);
		}

		function fn_addVideo() {
			var str = "<tr><td><input type='text' name='video' class='form-control' style='width:300px' placeholder='add video'></td><td><input type='button' class='btn btn-default' style='margin-left: 20px;' value='삭제' onclick='fn_deleteFile(this)'>	</td></tr>";
			$("#videoDiv").append(str);
		}

		function fn_deleteFile(obj) {
			obj.parentNode.parentNode.remove();
		}

		function check() {
			var userinput = eval("document.updateForm");

			if (!userinput.styleGender.value) {
				alert("성별을 입력해 주시기 바랍니다.");
				return false;
			}

			if (!(userinput.styleGender.value == "man" || userinput.styleGender.value == "woman")) {
				alert("성별을 알맞게 입력해 주시기 바랍니다.")
				return false;
			}

			if (!userinput.styleType.value) {
				alert("타입을 입력해 주시기 바랍니다.");
				return false;
			}

			if (!(userinput.styleType.value == "cut"
					|| userinput.styleType.value == "perm" || userinput.styleType.value == "color")) {
				alert("타입을 알맞게 입력해 주시기 바랍니다.")
				return false;
			}

			if (!userinput.styleName.value) {
				alert("스타일을 입력해 주시기 바랍니다.");
				return false;
			}

			if (!userinput.designer.value) {
				alert("디자이너를 입력해 주시기 바랍니다.");
				return false;
			}

			if (!userinput.price.value) {
				alert("가격을 입력해 주시기 바랍니다.");
				return false;
			}

			if (!userinput.photo.value) {
				alert("사진을 추가해 주시기 바랍니다.");
				return false;
			}

			/* if (!userinput.photo2.value) {
				alert("사진을 추가해 주시기 바랍니다.");
				return false;
			} */

			if (!userinput.video.value) {
				alert("영상을 추가해 주시기 바랍니다.");
				return false;
			}
		}
	</script>

	<div class="page-wrapper">
		<section class="section" id="page-login">
			<div class="container">
				<div class="row">
					<div class="col-sm-6" style="margin-left: 300px;">
						<div class="box">
							<h2>STYLE UPDATE</h2>
							<br>
							<form name="updateForm" action="updateStylePro.do"
								onsubmit="return check()"
								class="register-form inputs-border inputs-bg" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="styleNum" value="${style.styleNum }">
								<table>
								<input type="hidden" name="styleGender" value="${style.styleGender }">
								<input type="hidden" name="styleType" value="${style.styleType }">
								<input type="hidden" name="designer" value="${style.designer }">
									<tr>
										<td rowspan="5"><img
											src="styleImages/${style.stylePhoto }"
											style="cursor: hand; margin-right: 40px;" align="absMiddle"
											border="0" width="150" height="180"
											onclick="fncProductFile()" id="UploadedImg"></td>

										<td style="padding-bottom: 10px"><label
											style="width: 60px;">성별</label></td>
										<td style="padding-left: 40px; padding-bottom: 10px"><label
											style="width: 60px; font-size: 20px; margin-bottom: 8px" >${style.styleGender }</label></td>
									</tr>
									<tr>
										<td style="padding-bottom: 10px"><label
											style="width: 60px;">타입</label></td>
										<td style="padding-left: 40px; padding-bottom: 10px"><label
											style="width: 60px; font-size: 20px; margin-bottom: 8px">${style.styleType }</label></td>
									</tr>
									<tr>
										<td style="padding-bottom: 10px"><label
											style="width: 60px;">스타일</label></td>
										<td style="padding-left: 40px; padding-bottom: 10px"><input
											type="text" name="styleName" class="form-control"
											placeholder="style" value="${style.styleName }"></td>
									</tr>
									<tr>
										<td style="padding-bottom: 10px"><label
											style="width: 60px;">디자이너</label></td>
										<td style="padding-left: 40px; padding-bottom: 10px"><label
											style="width: 60px; font-size: 20px; margin-bottom: 8px">${style.designer }</label></td>
									</tr>
									<tr>
										<td style="padding-bottom: 10px"><label
											style="width: 60px;">가격</label></td>
										<td style="padding-left: 40px; padding-bottom: 10px"><input
											type="text" name="price" class="form-control"
											placeholder="price" value="${style.price }"></td>
									</tr>
								</table>

								<!-- <input type="hidden" name="id" value="${myId }"> -->
								<div id="fileDiv">
									<label style="width: 100px;">사진</label>
									<table>
										<tr>
											<td>대표사진 :</td>
											<td><input type="file" name="photo" class="form-control"
												onchange="readURL(this);"
												style="margin-bottom: 10px; width: 260px"></td>
										</tr>
									</table>
								</div>
								<div>
									<input type="hidden" name="strphoto" value="strphoto">
									<c:forEach var="strphoto" items="${photoList }">
										<table>
											<tr>
												<td><input type="hidden" name="strphoto"
													class="form-control" value="${strphoto }"> <img
													src="styleImages/${strphoto }" style="cursor: hand;"
													align="absMiddle" border="0" width="150" height="80">
												</td>
												<td><input type="button" class="btn btn-default"
													value="삭제" style="margin-left: 20px;"
													onclick="fn_deleteFile(this)"></td>
											</tr>
										</table>
									</c:forEach>
								</div>

								<div id="videoDiv">
									<label style="width: 100px;">동영상</label>
									<table>
										<tr>
											<td><input type="text" name="video" class="form-control"
												style="width: 300px" placeholder="add video"></td>
										</tr>
									</table>
								</div>

								<p>
								<p>
								<p>
								<div class="form-group text-right">
									<input type="button" value="파일추가" class="btn btn-default"
										onclick="fn_addFile()"> <input type="button"
										value="동영상추가" class="btn btn-default" onclick="fn_addVideo()">
									<input type="submit" value="확인" class="btn btn-default">
									<input type="button" value="취소" class="btn btn-default"
										OnClick="history.go(-1)">
								</div>
							</form>
						</div>
						<!-- /.box -->
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</section>
		<!-- #page-login -->
	</div>
	<!-- /.page-wrapper -->

</section>