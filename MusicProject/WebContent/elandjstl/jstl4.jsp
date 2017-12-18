<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	int star= 3;
 	request.setAttribute("star", star);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${star==1}">★☆☆☆☆</c:when>
		<c:when test="${star==2}">★★☆☆☆</c:when>
		<c:when test="${star==3}">★★★☆☆</c:when>
		<c:when test="${star==4}">★★★★☆</c:when>
		<c:when test="${star==5}">★★★★★</c:when>
		<c:otherwise>☆☆☆☆☆</c:otherwise>
	</c:choose>
</body>
</html>