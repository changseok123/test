<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%--
 	EL (Expression Language)
	<%= %>, out.println(), out.wirte() : 브라우저에 출력 용도 => 표현식
	1) <%= %> ==> 변경 (EL)
	2) HTML ==> 루프(제어문) ==> 변경(JSTL)
	if() ==> <c:if>
	for() ==> <c:forEach>
 --%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
/* 			1) request => request.setAttribute("name",name);
				${name}
				${requestScope.name}
			2) session => session.setAttribute("name","admin");
				${sessionScope.name}
				sessionScope는 생략이 불가능
			3) param => request.getParameter("id");
				${param.id(key)}
				
				class A {
					public void display() {
						
					}
				}
				A a = new A(); 
*/ %>

<%
	String id = "admin";
	request.setAttribute("id", id);
	session.setAttribute("id", id);
%>
${id }<br>
${sessionScope.id }<br>
${param.pwd}
</body>
</html>