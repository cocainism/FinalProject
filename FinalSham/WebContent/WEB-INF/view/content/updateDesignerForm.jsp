<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	String cp = request.getContextPath(); //첫번째 경로를 가져온다// 컨텍스트경로
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>


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
		document.addDesignerForm.photo.click();
		document.addDesignerForm.photo.onchange();
	}
	function submitt(designerPhoto, designer, spec, favorite, position, designerNO) {
		if (document.addDesignerForm.UploadedImg.src.indexOf('designer') != -1) {
			document.addDesignerForm.action = "updateDesigner.do"

		} else {  
			document.addDesignerForm.action = "photoUpdateDesigner.do"

		}
	}
</script>

<div class="page-head content-top-margin">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-7">
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li><a href="designer.do">디자이너 정보</a></li>
					<li class="active">디자이너 수정</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
</div>
<div class="page-wrapper">
	<section class="section" id="page-login">
		<div class="container">
			<div class="row">
				<div class="col-sm-6" style="margin-left: 300px;">
					<div class="box">
						<h2>DESIGNER EDIT</h2>
						<br>
						<form name="addDesignerForm" id="addDesigner"
							action="updateDesignerSubmit.do"
							class="register-form inputs-border inputs-bg" method="post"
							enctype="multipart/form-data"
							onclick="submitt('${designerInfo.designerPhoto}','${designerInfo.designer }','${designerInfo.spec }','${designerInfo.favorite }','${designerInfo.position }','${designerInfo.designerNo }')">

							<table>
								<tr>
									<td rowspan="6"><input type="file" name='photo'
										onchange="readURL(this);" style='display: none' /> <img
										src="${designerInfo.designerPhoto}"
										style="cursor: hand; margin-right: 40px;" align="absMiddle"
										border="0" width="150" height="180" onclick="fncProductFile()"
										id="UploadedImg" name="UploadedImg"></td>

									<td style="padding-bottom: 10px"><label>이름</label></td>
									<td style="padding-left: 40px; padding-bottom: 10px"><input
										type="text" name="designer" class="form-control"
										style="padding-right: 80px;" value="${designerInfo.designer}">
								</tr>
								<tr>
									<td style="padding-bottom: 10px"><label>경력</label></td>
									<td style="padding-left: 40px; padding-bottom: 10px"><input
										type="text" name="spec" class="form-control"
										value="${designerInfo.spec}"></td>
								</tr>
								<tr>
									<td style="padding-bottom: 10px"><label>특기</label></td>
									<td style="padding-left: 40px; padding-bottom: 10px"><input
										type="text" name="favorite" class="form-control"
										value="${designerInfo.favorite}"></td>
								</tr>
								<tr>
									<td style="padding-bottom: 10px"><label>직급</label></td>
									<td style="padding-left: 40px; padding-bottom: 10px"><input
										type="text" name="position" class="form-control"
										value="${designerInfo.position}"></td>
								</tr>
							</table>
							<div class="form-group text-right">
								<input type="submit" value="확인" class="btn btn-default">
								<input type="button" value="취소" class="btn btn-primary"
									OnClick="window.location='designer.do'">
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

