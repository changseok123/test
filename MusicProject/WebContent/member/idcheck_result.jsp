<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*"%>
<%
    MemberDAO dao=new MemberDAO();
    String id=request.getParameter("id");
    int count=dao.memberIdcheck(id);
    request.setAttribute("count", count);
%>
${count }

