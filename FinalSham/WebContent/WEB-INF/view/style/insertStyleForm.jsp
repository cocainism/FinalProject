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
			document.addForm.photo.click();
			document.addForm.photo.onchange();
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
			var userinput = eval("document.addForm");

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

			if (!(userinput.styleType.value == "cut" || userinput.styleType.value == "perm" || userinput.styleType.value == "color" || userinput.styleType.value == "long" || userinput.styleType.value == "medium" || userinput.styleType.value == "short")) {
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
							<h2>STYLE ADD</h2>
							<br>
							<form name="addForm" action="insertStylePro.do"
								onsubmit="return check()"
								class="register-form inputs-border inputs-bg" method="post"
								enctype="multipart/form-data">
								<table>
									<tr>
										<td rowspan="5"><img
											style="cursor: hand; margin-right: 40px;" align="absMiddle"
											border="0" width="150" height="180"
											onclick="fncProductFile()" id="UploadedImg"></td>

										<td style="padding-bottom: 10px"><label
											style="width: 60px;">성별</label></td>
										<td style="padding-left: 10px; padding-bottom: 10px"><select
											name="styleGender" class="form-control"
											style="padding-right: 80px;">
												<option>성별을 선택하세요.</option>
												<option value="man">man</option>
												<option value="woman">woman</option>
										</select></td>
									</tr>
									<tr>
										<td style="padding-bottom: 10px"><label
											style="width: 60px;">타입</label></td>
										<td style="padding-left: 10px; padding-bottom: 10px"><select
											name="styleType" class="form-control">
												<option>타입을 선택하세요.</option>
												<option value="cut">cut</option>
												<option value="perm">perm</option>
												<option value="color">color</option>
												<option value="long">long</option>
												<option value="medium">medium</option>
												<option value="short">short</option>
										</select></td>
									</tr>
									<tr>
										<td style="padding-bottom: 10px"><label
											style="width: 60px;">스타일</label></td>
										<td style="padding-left: 10px; padding-bottom: 10px"><input
											type="text" name="styleName" class="form-control"
											placeholder="style"></td>
									</tr>
									<tr>
										<td style="padding-bottom: 10px"><label
											style="width: 60px;">디자이너</label></td>
										<td style="padding-left: 10px; padding-bottom: 10px"><select
											name="designer" class="form-control">
											<option>디자이너를 선택하세요.</option>
											<c:forEach var="designerList" items="${designerList }">
												<option value="${designerList }">${designerList }</option>
											</c:forEach>
											</select></td>
									</tr>
									<tr>
										<td style="padding-bottom: 10px"><label
											style="width: 60px;">가격</label></td>
										<td style="padding-left: 10px; padding-bottom: 10px"><input
											type="text" name="price" class="form-control"
											placeholder="price"></td>
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