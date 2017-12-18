<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.temp.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="mgr" class="com.sist.temp.EmpManager"></jsp:useBean>
<%
	mgr.jspSendData(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<table border=1 width=500>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>직위</th>
				<th>급여</th>
				<th>부서</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.empno}</td><%-- vo.getEmpno() --%>
					<td>${vo.ename}</td>
					<td>${vo.job}</td>
					<td>${vo.sal}</td>
					<td>${vo.deptno}</td>
				</tr>
			</c:forEach>
		</table>
	</center>
</body>
</html>