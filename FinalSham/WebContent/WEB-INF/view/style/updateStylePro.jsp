<%@ page contentType = "text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${type eq 'cut'}">
	<meta http-equiv="Refresh" content="0;url=mCutList.do" >
</c:if>

<c:if test="${type eq 'perm'}">
	<meta http-equiv="Refresh" content="0;url=mPermList.do" >
</c:if>

<c:if test="${type eq 'color'}">
	<meta http-equiv="Refresh" content="0;url=mColorList.do" >
</c:if>

<c:if test="${type eq 'long'}">
	<meta http-equiv="Refresh" content="0;url=wLongList.do" >
</c:if>

<c:if test="${type eq 'medium'}">
	<meta http-equiv="Refresh" content="0;url=wMediumList.do" >
</c:if>

<c:if test="${type eq 'short'}">
	<meta http-equiv="Refresh" content="0;url=wShortList.do" >
</c:if>