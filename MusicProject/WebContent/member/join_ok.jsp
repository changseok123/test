<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*" %>
<jsp:useBean id="dao" class="com.sist.dao.MemberDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="vo" class="com.sist.dao.MemberVO">
	<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
	// DAO ����
	dao.memberJoin(vo);
	// ȭ�� �̵�
	response.sendRedirect("../music/main.jsp?mode=16");
%>