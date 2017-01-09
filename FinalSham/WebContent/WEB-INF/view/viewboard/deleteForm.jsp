<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./view/color.jspf"%>

<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>     
    
  function deleteSave(){
if(document.delForm.passwd.value==''){
alert("비밀번호를 입력하십시요.");
document.delForm.passwd.focus();
return false;
}
}        
</script>
</head>

<body>
<br><br><br><br><br><br><br><br>
<div class="container">


<form method="POST" name="delForm"  action="deletePro.do?pageNum=${pageNum}"
   onsubmit="return deleteSave()">
<table class="table table-bordered">
  <tr>
     <td>
       <b>비밀번호를 입력해 주세요.</b></td>
  </tr>
  <tr>
     <td>비밀번호 :  
       <input type="password" name="passwd" size="8" maxlength="12">
   <input type="hidden" name="qnANo" value="${qnANo}"></td>
</tr>
<tr>
    <td>
      <input type="submit" value="글삭제" >
      <input type="button" value="글목록"
       onclick="document.location.href='list.do?pageNum=${pageNum}'">    
   </td>
</tr> 
</table>
</form></div>
</body>
</html>