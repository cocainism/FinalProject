<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%
	String cp = request.getContextPath(); //첫번째 경로를 가져온다// 컨텍스트경로
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<section class="section collections no-padding-bottom"
	id="home-collections">

<script>
	
	function check(){			
		
        var userinput = eval("document.inform");
                
		if(!userinput.id.value ){
			alert("id를 입력해주세요")
			return false;
		}
        if(userinput.duplicated.value == "0"){
            alert("아이디 중복체크하세요!!");
            return false;
        }
	    if(!userinput.password.value ) {
	        alert("비밀번호를 입력하세요");
	        return false;
	    }
		if(document.inform.password.value != document.inform.password2.value){
			alert("비밀번호가 일치하지 않습니다.")
			return false
		}
        if(!userinput.name.value) {
            alert("사용자 이름을 입력하세요");
            return false;
        }
        if(!userinput.birth.value){
            alert("생년월일을 입력하세요");
            return false;
        }
        if(!userinput.cellphone.value){
            alert("핸드폰 번호를 입력하세요!!");
            return false;
        }
        if(!userinput.email.value){
            alert("이메일을 입력하세요!!");
            return false;
        }
		return true;

	}
	
	function duplicatedId() {
		if(document.inform.id.value != ""){
			
			var url="<%=cp%>/duplicatedId.do";				
			var params="id="+document.inform.id.value
			$.ajax({
				type:"get"
				,url:url	
				,data:params
				,dataType:"json"
				,success:function(args){
					if( args.check == 0){
						document.inform.duplicated.value = "0";
						alert("이미 사용중인 아이디입니다.")
					}else{
						document.inform.duplicated.value = "1";
						alert("아이디를 사용할 수 있습니다.")					
					}
				}
		    	,error:function(e) {
			    	alert("에러발생");
			    }
			});
	   }else{
		   alert("아이디 입력해주세요")
	   }
	}
	
</script>


	<div class="page-wrapper" style="margin: auto">
		<section class="section" id="page-login">
				<div class="container" style="margin-left: 650px;">
					<div class="col-sm-6">
						<div class="box">
							<h2>Register</h2>
							<br>
							<form action="join.do?" class="register-form inputs-border inputs-bg" name="inform">
								<div class="form-group">
								<table>
								<tr>
									<td>
										<input type="text" id="id" name="id" class="form-control" placeholder="UserId" style="width:370px;" required>																						
									</td>
									<td>
										<button name="duplicated" class="btn btn-default" style="width:120px; margin-left:20px;" value="0" onclick="duplicatedId()">중복확인</button>
									</td>
								</tr>
								</table>
	
								</div>
								<div class="form-group">
									<div class="required" id="pwd" name="pwd">
										<input type="password" id="password" name="password" class="form-control"
											placeholder="UserPassword" required>
									</div>
								</div>
								<div class="form-group">
									<div class="required" name="pwd2">
										<input type="password" id="password2" name="password2" class="form-control"
											placeholder="UserPassword Check" required>
									</div>
								</div>
								<div class="form-group">
									<div class="required">
										<input type="text" id="name" name="name" class="form-control"
											placeholder="UserName" required>
									</div>
								</div>
								<div class="form-group">
									<div class="required">
										<input type="date" id="birth" name="birth" class="form-control"
											placeholder="UserBirth" required>
									</div>
								</div>
								<div class="form-group">
									<div class="required">
										<input type="text" id="cellphone" name="cellphone" class="form-control"
											placeholder="UserCellphone" required>
									</div>
								</div>

								<div class="form-group">
									<div class="required">
										<input type="email" id="email" name="email" class="form-control"
											placeholder="UserEamil" required>
									</div>
								</div>

								<div class="form-group text-right">
									<input type="submit" class="btn btn-default" value="Register" onClick="check()">									
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