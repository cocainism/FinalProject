<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./view/color.jspf"%>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>

  
<body> 
<center><b>글쓰기</b>
<br><br><br><br><br><br><br><br>
<form method="post" name="writeform" action="writePro.do" onsubmit="return writeSave()">
<input type="hidden" name="qnANo" value="${board.qnANo}">
<input type="hidden" name="ref" value="${board.ref}">
<input type="hidden" name="re_step" value="${board.re_step}">
<input type="hidden" name="re_level" value="${board.re_level}">
<input type="hidden" name="writer" value="${myId}">
<table class="table-bordered">
   <tr>
  <!--   <td>
    <a href="list.do" class="btn"> 글목록</a>
   </td> -->
   </tr>
   <tr>
    <td>이 름</td>
    <td>
       ${myId}
       
       </td>
  </tr>
  <tr>
    <td>제 목</td>
    
<c:if test="${board.qnANo == 0}">
     <td><input type="text" size="130" maxlength="50" name="QnATitle"></td>
</c:if>

<c:if test="${board.qnANo != 0}">
 <td>  <input type="text" size="130" maxlength="50" name="QnATitle" value="[답변]"></td>
</c:if>
  </tr>
  <tr>
    <td>내 용</td>
    <td>
     <textarea name="QnAContent" rows="13" cols="130"></textarea> </td>
  </tr>
  <tr>
<%--   <c:if test="${myId}">
    <td>비밀번호</td>
    <td>
     <input type="password" size="8" maxlength="12" name="passwd">
</td></c:if> --%>

    <td>비밀번호</td>
    <td>
     <input type="password" size="8" maxlength="12" name="passwd">
	</td>

  </tr>
<tr>     
<td colspan=2 bgcolor="${value_c}" align="center">
  <input type="submit" value="글쓰기"> 
  <input type="reset" value="다시작성">
  <input type="button" value="목록보기" OnClick="window.location='list.do'">
</td></tr></table>   
</form>     
</body>
</html> 