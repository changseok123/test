<%@page import="com.sist.dao.DataBoardVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<jsp:useBean id="dao" class="com.sist.dao.DataboardDAO"/>
<%
    String no=request.getParameter("no");
    String pwd=request.getParameter("pwd");
    // DAO연결 
    /*
        1. 어떤 데이터를 보낼까? submit,<a>
        2. 처리 문제 ? 데이터베이스  DAO
        3. 화면 이동?
    */
    DataBoardVO vo=dao.databoardFileInfo(Integer.parseInt(no));
    boolean bCheck=
       dao.databoardDelete(Integer.parseInt(no), pwd);
    if(bCheck==false)
    {
       //@ResponseBody
%>
       <script>
        alert("비밀번호가 틀립니다");
        history.back();
       </script>
<%
    }
    else
    {
       // 1. 파일삭제 , 2. delete , 3. 파일이동
       
       if(vo.getFilecount()!=0)
       {
    	   File f=new File("c:\\download\\"+vo.getFilename());
           f.delete();
       }
       response.sendRedirect("../music/main.jsp?mode=12");
    }
%>










