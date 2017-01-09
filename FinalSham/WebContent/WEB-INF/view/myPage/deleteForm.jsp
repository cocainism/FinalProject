<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> %>
<!DOCTYPE html>
<section class="section collections no-padding-bottom"
	id="home-collections">


	<div class="page-wrapper" style="margin: auto">
		<section class="section" id="page-login">
			<div class="container" style="margin-left: 450px;">
				<div class="col-sm-6">
					<div class="box">
						<h2>DELETE ID</h2>
						<br>
						<form action="delete.do"
							class="register-form inputs-border inputs-bg">
							<table>
								<tr>
									<td style="padding-bottom: 10px"><label>ID</label></td>
									<td style="padding-left: 40px; padding-bottom: 10px">${myInfo.getId()}</td>
									<input type="hidden" name="id" class="form-control" value="${myInfo.getId()}">									
								</tr>
								<tr>
									<td style="padding-bottom: 10px"><label>PASSWORD</label></td>
									<td style="padding-left: 40px; padding-bottom: 10px">
									<input type="password" name="password" class="form-control">
									</td>
								</tr>													
							</table>
							<div class="form-group text-right">
								<input type="submit" value="DELETE" class="btn btn-default">
							</div>
						</form>
					</div>
					<!-- /.box -->
				</div>
			</div>
			<!-- /.container -->
		</section>
		<!-- #page-login -->
	</div>
	<!-- /.page-wrapper -->
</section>