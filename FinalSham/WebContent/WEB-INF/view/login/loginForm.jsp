<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<!DOCTYPE html>

<section class="section collections no-padding-bottom"
	id="home-collections">


	<div class="page-wrapper">
		<section class="section" id="page-login">
			<div class="container">
				<div class="row">
					<div class="col-sm-6" style="margin-left: 300px;">
						<div class="box">
							<h2>Login</h2>
							<br>
							<form action="login.do" method="POST"
								class="login-form inputs-border inputs-bg">
								<div class="form-group">
									<div class="required">
										<input type="text" name="id" class="form-control"
											placeholder="UserId">
									</div>
								</div>
								<div class="form-group">
									<div class="required">
										<input type="password" name="password" class="form-control"
											placeholder="UserPassword">
									</div>
								</div>
								<div class="form-group">
									<input type="checkbox" id="rememberme"> <label
										for="rememberme" class="checkbox">Remember me</label> <a
										href="findForm.do" class="effect pull-right">Forgot your
										ID/password?</a>
								</div>
								<div class="form-group text-right">
									<input type="submit" value="Login" class="btn btn-default">
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