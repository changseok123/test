<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.QnABoardDAO"/>
<%
    String no=request.getParameter("no");
    String strPage=request.getParameter("page");
    QnABoardVO vo=dao.boardContentData("content", Integer.parseInt(no));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.qnarow{
  margin: 0px auto;
  width: 650px;
}
.qna-th,.qna-td{
  font-family: ���� ���;
  font-size: 10pt;
}
</style>
</head>
<body>
  <div class="container">
   <div class="row qnarow">
    <div style="height:70px"></div>
    <h3>���뺸��</h3>
    <table class="table table-hover">
     <tr>
      <td width="20%" class="text-center danger qna-td">��ȣ</td>
      <td width="30%" class="text-center qna-td"><%=vo.getNo() %></td>
      <td width="20%" class="text-center danger qna-td">�ۼ���</td>
      <td width="30%" class="text-center qna-td"><%=vo.getRegdate().toString() %></td>
     </tr>
     <tr>
      <td width="20%" class="text-center danger qna-td">�̸�</td>
      <td width="30%" class="text-center qna-td"><%=vo.getName() %></td>
      <td width="20%" class="text-center danger qna-td">��ȸ��</td>
      <td width="30%" class="text-center qna-td"><%=vo.getHit() %></td>
     </tr>
     <tr>
      <td width="20%" class="text-center danger qna-td">����</td>
      <td colspan="3" class="text-left qna-td"><%=vo.getSubject() %></td>
     </tr>
     <tr>
      <td colspan="4" class="text-left qna-td" valign="top" height=200><pre><%=vo.getContent() %></pre></td>
     </tr>
    </table>
    <table class="table">
     <tr>
      <td class="text-right qna-td">
       <a href="main.jsp?mode=9&pno=<%=vo.getNo() %>&page=<%=strPage%>" class="btn btn-success">�亯</a>
       <a href="main.jsp?mode=10&no=<%=vo.getNo() %>&page=<%=strPage%>" class="btn btn-warning">����</a>
       <a href="main.jsp?mode=11&no=<%=vo.getNo() %>&page=<%=strPage%>" class="btn btn-primary">����</a>
       <a href="main.jsp?mode=6&page=<%=strPage %>" class="btn btn-info">���</a>
      </td>
     </tr>
    </table>
   </div>
  </div>
</body>
</html>




