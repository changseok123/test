<%@page import="com.sist.dao.DataBoardVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<jsp:useBean id="dao" class="com.sist.dao.DataboardDAO"/>
<%
    String no=request.getParameter("no");
    String pwd=request.getParameter("pwd");
    // DAO���� 
    /*
        1. � �����͸� ������? submit,<a>
        2. ó�� ���� ? �����ͺ��̽�  DAO
        3. ȭ�� �̵�?
    */
    DataBoardVO vo=dao.databoardFileInfo(Integer.parseInt(no));
    boolean bCheck=
       dao.databoardDelete(Integer.parseInt(no), pwd);
    if(bCheck==false)
    {
       //@ResponseBody
%>
       <script>
        alert("��й�ȣ�� Ʋ���ϴ�");
        history.back();
       </script>
<%
    }
    else
    {
       // 1. ���ϻ��� , 2. delete , 3. �����̵�
       
       if(vo.getFilecount()!=0)
       {
    	   File f=new File("c:\\download\\"+vo.getFilename());
           f.delete();
       }
       response.sendRedirect("../music/main.jsp?mode=12");
    }
%>










