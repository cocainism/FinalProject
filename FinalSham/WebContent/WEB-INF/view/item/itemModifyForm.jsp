<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%
	String cp = request.getContextPath(); //첫번째 경로를 가져온다// 컨텍스트경로
	request.setCharacterEncoding("UTF-8");
%>
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
	</script>

	<div class="page-wrapper">
		<section class="section" id="page-login">
			<div class="container">
				<div class="row">
					<div class="col-sm-6" style="margin-left: 300px;">
						<div class="box">
							<h2>ITEM MODIFY</h2>
							<br>
							<form name="addForm" action="itemModify.do"
								class="register-form inputs-border inputs-bg" method="post"
								enctype="multipart/form-data">
								<table>
									<tr>
										<td rowspan="6"><input type="file" name='photo'
											onchange="readURL(this);" style='display: none' /> <img
											src="fileList/${item.itemPhoto }" style="cursor: hand; margin-right: 40px;" align="absMiddle"
											border="0" width="150" height="180"
											onclick="fncProductFile()" id="UploadedImg"></td>
										<td style="padding-bottom: 10px"><label>이름</label></td>
										<td style="padding-left: 40px; padding-bottom: 10px">&nbsp;&nbsp;${item.itemName }</td>
										<input name="itemName" type="hidden" value="${item.itemName }">
									</tr>
									<tr>
										<td style="padding-bottom: 10px"><label>제목</label></td>
										<td style="padding-left: 40px; padding-bottom: 10px"><input
											type="text" name="itemTitle" class="form-control" placeholder="제품 제목" value="${item.itemTitle }"></td>
									</tr>
									<tr>
										<td style="padding-bottom: 10px"><label>가격</label></td>
										<td style="padding-left: 40px; padding-bottom: 10px"><input
											type="text" name="itemPrice" class="form-control" placeholder="제품 가격" value="${item.itemPrice }"></td>
									</tr>
									<tr>
										<td style="padding-bottom: 10px"><label>설명</label></td>
										<td style="padding-left: 40px; padding-bottom: 10px"><input
											type="text" name="itemContent" class="form-control" placeholder="제품 설명" value="${item.itemContent }"></td>
									</tr>
									<tr>
										<td style="padding-bottom: 10px"><label>재고</label></td>
										<td style="padding-left: 40px; padding-bottom: 10px"><input
											type="text" name="itemCount" class="form-control" placeholder="제품 재고" value="${item.itemCount }"></td>
									</tr>
									<tr>
										<td style="padding-bottom: 10px"><label>구분</label></td>
										<td style="padding-left: 40px; padding-bottom: 10px">										
										<input type="text" name="itemType" class="form-control" placeholder="제품 구분" value="${item.itemType }"></td>
									</tr>
								</table>
								<input type="hidden" name="id" value="${myId }">
								<input type="hidden" name="itemInCart" value="0">
								<div class="form-group text-right">
									<input type="submit" value="확인" class="btn btn-default">
									<input type="button" value="취소" class="btn btn-default"
										OnClick="window.location='itemForm.do'">
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
