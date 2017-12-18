<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*"%>
<%
    request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="dao" class="com.sist.dao.QnABoardDAO"/>
<jsp:useBean id="vo" class="com.sist.dao.QnABoardVO">
 <jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
   // db¿¬µ¿
   dao.boardInsert(vo);
   response.sendRedirect("../music/main.jsp?mode=6");
%>
