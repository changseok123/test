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
    String pno=request.getParameter("pno");// root
    String strPage=request.getParameter("page");
    //DB���� 
    dao.boardReply(Integer.parseInt(pno), vo);
    //ȭ�� �̵�
    response.sendRedirect("../music/main.jsp?mode=6&page="+strPage);
%>