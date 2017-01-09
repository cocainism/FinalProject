<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./view/color.jspf"%>

<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="style.css" rel="stylesheet" type="text/css">

<title>게시판</title>
<!-- <link href="style.css" rel="stylesheet" type="text/css"> -->
<!-- <style type='text/css'>
<!--
a:link { color:black; text-decoration:none; }
a:visited {  }
a:active { text-decoration:underline; }
a:hover { text-decoration:underline; background-image:url('text_dottdeline.gif'); background-repeat:repeat-x; background-position:50% 100%; }

</style>
<style>
<!--
@font-face {font-family:굴림; src:url();}
body,td,a,div,p,pre,input,textarea {font-family:굴림;font-size:9pt;}

</style> -->
</head>
<body> 
<div class="container">
<br><br><br><br><br><br><br><br>
<form>
<table class="table table-bordered"> 
<colgroup>
            <col width="15%"/>
            <col width="35%"/>
            <col width="15%"/>
            <col width="35%"/>
        </colgroup>
  <tbody>
  <tr>
    <th scope="row">글 번호</th>
    <td>${article.qnANo}</td>
    <th scope="row">조회수</th>
     <td>${article.qnAHits}</td> 
  </tr>
  <tr>
    <th scope="row">작성자</th>
    <td>${article.writer}</td>
   <th scope="row">작성일</th>
    <td>${article.qnADate}</td>
  </tr>
  <tr>
     <th scope="row">제목</th>
    <td colspan="3">${article.qnATitle}</td>
  </tr>
  <tr>
    <td colspan="4"><pre>${article.qnAContent}</pre></td>
  </tr>
  <tr>     
    <td colspan="4"align="center" >
  <input type="button" value="글수정"
       onclick="document.location.href='updateForm.do?qnANo=${article.qnANo}&pageNum=${pageNum}'">
   &nbsp;&nbsp;&nbsp;&nbsp;
  <input type="button" value="글삭제"
       onclick="document.location.href='proqadeleteForm.do?qnANo=${article.qnANo}&pageNum=${pageNum}'">
   &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" value="답글쓰기"
       onclick="document.location.href='writeForm.do?qnANo=${article.qnANo}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'">
   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="글목록"
       onclick="document.location.href='list.do?pageNum=${pageNum}'">
    </td>
  </tr></tbody>
</table>
</form>     </div>
</body>
</html>    