<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<!DOCTYPE html>
<section class="section collections no-padding-bottom" id="home-collections">
	<%
	
	%>
<div class="page-wrapper">
	<section class="section" id="page-login">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="box">
						<h2>FIND ID</h2>
						<br>
						<form action="findId.do" method="POST"
							class="login-form inputs-border inputs-bg">
							<div class="form-group">
								<div class="required">
									<input type="text" name="name" class="form-control" placeholder="UserName">
								</div>
							</div>
							<div class="form-group">
								<div class="required">
									<input type="email" name="email" class="form-control"
										placeholder="UserEmail">
								</div>
							</div>
							<div>
							<br><br><br>
							</div>
							<div class="form-group text-right">
								<input type="submit" value="SEND" class="btn btn-default">
							</div>							
						</form>
					</div>
					<!-- /.box -->
				</div>

				<div class="col-sm-6">
					<div class="box">
						<h2>FIND PASSWORD</h2>
						<br>
						<form action="findPwd.do" method="POST"
							class="register-form inputs-border inputs-bg">
							<div class="form-group">
								<div class="required">
									<input type="text" name="name" class="form-control" placeholder="UserName">
								</div>
							</div>
							<div class="form-group">
								<div class="required">
									<input type="text" name="id" class="form-control" placeholder="UserId">
								</div>
							</div>
							<div class="form-group">
								<div class="required">
									<input type="email" name="email" class="form-control"
										placeholder="UserEmail">
								</div>
							</div>						
							<div class="form-group text-right">
								<input type="submit" value="SEND" class="btn btn-default">
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
