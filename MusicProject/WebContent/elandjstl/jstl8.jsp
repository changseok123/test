<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
	Date date = new Date();
	request.setAttribute("date", date);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%= date %><br>
	<%--
		SELECT TO_CHAR(regdate, 'YYYY-MM-DD')
	 --%>
	<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/>
</body>
</html>