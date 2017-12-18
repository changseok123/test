<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	MemberDAO dao = new MemberDAO();
	MemberVO vo = dao.isLogin(id, pwd);
	
	if(vo.getCount() == 3) {
		session.setAttribute("id", id);
		session.setAttribute("name", vo.getName());
		session.setAttribute("admin", vo.getAdmin());
	}
%>
<%= vo.getCount() %>