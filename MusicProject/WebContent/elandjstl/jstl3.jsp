<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
	<%-- 	<h3>JAVA(구구단)</h3>
		<table border=1 width=560>
			<tr bgcolor="#999">
				<%
					for(int i=2; i<=9; i++) {
				%>
						<th><%= i+"단" %></th>		
				<%
					}
				%>
			</tr>
			<%
				for(int i=1; i<=9; i++) {
			%>
					<tr>
			<%
					for(int j=2; j<=9; j++) {
			%>	
						<td><%= i+"*"+j+"="+(i*j) %></td>
			<%		
					}
			%>
					</tr>
			<%
				}
			%>
		</table> --%>
		
		<h3>JSTL(구구단)</h3>
		<table border=1 width=560>
			<tr bgcolor="#999">
				<c:forEach var="i" begin="2" end="9">
					<th>${i}단</th>
				</c:forEach>
			</tr>
			<c:forEach var="i" begin="1" end="9">
				<tr>
				<c:forEach var="j" begin="2" end="9">
					<td>${ j }*${ i }=${ j*i }</td>
				</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</center>
</body>
</html>