function writeSave(){

if(document.writeform.writer.value==""){
  alert("작성자를 입력하십시요.");
  document.writeform.writer.focus();
  return false;
}
if(document.writeform.QnATitle.value==""){
  alert("제목을 입력하십시요.");
  document.writeform.QnATitle.focus();
  return false;
}

if(document.writeform.QnAContent.value==""){
  alert("내용을 입력하십시요.");
  document.writeform.QnAContent.focus();
  return false;
}
       
if(document.writeform.passwd.value==""){
  alert(" 비밀번호를 입력하십시요.");
  document.writeform.passwd.focus();
  return false;
}
}