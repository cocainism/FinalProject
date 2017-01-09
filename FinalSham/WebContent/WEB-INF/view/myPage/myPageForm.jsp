<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<section class="section collections no-padding-bottom"
	id="home-collections">

<section class="section collections no-padding-bottom"
		id="home-collections">
		<div class="page-head content-top-margin" style="margin-top: 0px;">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-sm-7">
						<ol class="breadcrumb">
							<li><a href="main.do">Home</a></li>
							<li class="active">MY PAGE</li>&nbsp;
							<li><a href="orderListForm.do?id=${myId}">ORDER LIST</a></li>&nbsp;
							<li><a href="#!">PROCEDURE LIST</a></li>&nbsp;
							<li><a href="#!">RESERVATION LIST</a></li>
												
						</ol>
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</div>
	<div class="page-wrapper" style="margin: auto">
		<section class="section" id="page-login">
			<div class="container" style="margin-left: 450px;">
				<div class="col-sm-6" style="margin-left:200px;">
					<div class="box">
						<h2>MY PAGE</h2>
						<br>
						<form action="modifyForm.do"
							class="register-form inputs-border inputs-bg">						
							 <table>
								<tr>
									<td style="padding-bottom:10px"><label>ID</label></td>
									<td style="padding-left:40px;padding-bottom:10px">${myInfo.getId()}</td>
								</tr>
								<tr>
									<td style="padding-bottom:10px"><label>NAME</label></td>
									<td style="padding-left:40px;padding-bottom:10px">${myInfo.getName()}</td>
								</tr>
								<tr>
									<td style="padding-bottom:10px"><label>BIRTH</label></td>
									<td style="padding-left:40px;padding-bottom:10px">${myInfo.getBirth()}</td>
								</tr>
								<tr>
									<td style="padding-bottom:10px"><label>CELLPHONE</label></td>
									<td style="padding-left:40px;padding-bottom:10px">${myInfo.getCellphone()}</td>
								</tr>
								<tr>
									<td style="padding-bottom:10px"><label>EMAIL</label></td>
									<td style="padding-left:40px;padding-bottom:10px">${myInfo.getEmail()}</td>
								</tr>
							</table>
								<div class="form-group text-right">
									<input type="submit" value="MODIFY" class="btn btn-default">
									<input type="button" value="DELETE" class="btn btn-default" OnClick="window.location='deleteForm.do?id=${myInfo.getId()}'">
								</div>
						</form>
					</div>
					<!-- /.box -->
				</div>
			</div>
			<!-- /.container -->
		</section>
		</div>
		</section>	
</section>