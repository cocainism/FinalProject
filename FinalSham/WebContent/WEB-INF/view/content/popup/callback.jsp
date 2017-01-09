<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="js/HuskyEZCreator.js"
	charset="utf-8"></script>
	
<title>FileUploader Callback</title>
</head>
<body>
	<script type="text/javascript">
		// alert("callback");
		// document.domain ì¤ì 
		try {
			document.domain = "http://*.naver.com";
		} catch (e) {}
	
		// execute callback script
		var sUrl = document.location.search.substr(1);
		if (sUrl != "blank") {
			var oParameter = {}; // query array
	
			sUrl.replace(/([^=]+)=([^&]*)(&|$)/g, function() {
				oParameter[arguments[1]] = arguments[2];
				return "";
			});
	
			if ((oParameter.errstr || '').length) { // on error
				(parent.jindo.FileUploader._oCallback[oParameter.callback_func + '_error'])(oParameter);
			} else {
				(parent.jindo.FileUploader._oCallback[oParameter.callback_func + '_success'])(oParameter);
			}
		}
	</script>
</body>
</html>