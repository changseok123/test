<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*" %>
<jsp:useBean id="dao" class="com.sist.dao.QnABoardDAO"/>
<%
	String no = request.getParameter("no");
	String strPage = request.getParameter("page");
	String pwd = request.getParameter("pwd");
	boolean bCheck = dao.boardDelete(Integer.parseInt(no), pwd);
	if(bCheck == false) {
%>
	<script>
	alert("비밀번호가 틀립니다.");
	history.back();
	</script>
<%
	} else {
		response.sendRedirect("../music/main.jsp?mode=6&page="+strPage);
	}
%>