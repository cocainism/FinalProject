<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<!DOCTYPE html>
<html>
	<head>
  		<tiles:insertAttribute name="header"/>
  	</head>
  	<body>
		<tiles:insertAttribute name="nav"/>
		<tiles:insertAttribute name="content"/>
		<tiles:insertAttribute name="gotop"/>
		<tiles:insertAttribute name="overlay"/>
	  	<tiles:insertAttribute name="footer"/>

  	</body>
</html>