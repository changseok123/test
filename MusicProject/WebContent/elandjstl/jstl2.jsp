<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*"%>
<%--
���̺귯�� �ε�
 --%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>for(�ڹ�)</h3>
	<%
		for(int i = 1; i <= 10; i++ ) {
		%>
			<%= i %>&nbsp;
		<%	
		}
	%>
	<br>
	<h3>JSTL(for)</h3>
	<c:forEach var="i" begin="1" end="10" step="1"> <%-- step ���� ���� --%>
		${i}&nbsp;
	</c:forEach><br>
	<%--
		for(BoardVO vo : list)
	 --%>
	 <%
	 	List<String> list = new ArrayList<String>();
	 	list.add("ȫ�浿");
	 	list.add("��û��");
	 	list.add("������");
	 	request.setAttribute("list", list);
	 %>
	 <h3>�ڹ�(for)</h3>
	 <%
	 	for(String name : list) {
	 %>
	 		<%= name %><br>
	 <%
	 	}
	 %><br>
	 <h3>JSTL</h3>
	 <c:forEach var="name" items="${list}">
	 	${name}<br>
	 </c:forEach><br>
	 <h3>�ڹ�(if)</h3>
	 <%
	 	// <c:forEach var="i" begin="1" end="10" step="1">
	 	// end ==> i<10(X) i<=10(O)
	 	for(int i=1; i<=10; i++) {
	 		if(i%2==0) {
	 %>
	 			<%= i %>
	 <%
	 		}
	 	}
	 %><br>
	 <h3>jstl</h3>
	 <c:forEach var="i" begin="1" end="10">
	 	<c:if test="${i%2==0 }">
	 		${ i } &nbsp;
	 	</c:if>
	 </c:forEach><br>
	 
	 
	 
</body>
</html>