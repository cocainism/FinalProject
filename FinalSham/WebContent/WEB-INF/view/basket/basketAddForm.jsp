<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
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
			document.infoForm.txtProductFile.click();
			document.infoForm.txtProductFile.onchange();
		}
	</script>

	<form name="infoForm" action="basketAdd.do" method="post" enctype="multipart/form-data">
			<table>
				<td>
				<input type="file" name='txtProductFile' onchange="readURL(this);" style='display: none' /> 
				<img style='cursor: hand' align="absMiddle" border="0" width="150" height="180" onclick="fncProductFile()" id="UploadedImg"></td>
				<tr>
					<th>제목</th>
					<td><input type="text" name="itemTitle" required="required" placeholder="제목"></td>
				</tr>

				<tr>
					<th>제품이름</th>
					<td><input type="text" name="itemName" required="required"
						placeholder="제품이름"></td>
				</tr>
				<tr>
					<th>제품가격</th>
					<td><input type="text" name="itemPrice" placeholder="제품가격" required="required"></td>
				</tr>
				<tr>
					<th>설명</th>
					<td><input type="text" name=itemCount" required="required" placeholder="제목"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="저장"></td>
				</tr>
			</table>

	</form>

</section>