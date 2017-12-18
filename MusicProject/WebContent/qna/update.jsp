<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.QnABoardDAO"/>
<%
	String no = request.getParameter("no");
	String strPage = request.getParameter("page");
	QnABoardVO vo = dao.boardContentData("update", Integer.parseInt(no));
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
    <h3>�����ϱ�</h3>
    <form method="post" action="../qna/update_ok.jsp">
    <table class="table table-hover">
     <tr>
      <td width=20% class="text-right qna-td">�̸�</td>
      <td width=80% class="text-left qna-td">
       <input type=text name=name size=13 id="name" value="<%=vo.getName()%>">
       <input type=hidden name=no value="<%=no%>">
       <input type=hidden name=page value="<%=strPage%>">
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td">����</td>
      <td width=80% class="text-left qna-td">
       <input type=text name=subject size=50 id="subject" value="<%=vo.getSubject()%>">
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td" valign="top">����</td>
      <td width=80% class="text-left qna-td">
       <textarea rows="10" cols="55" name=content id="content"><%=vo.getContent() %></textarea>
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td">��й�ȣ</td>
      <td width=80% class="text-left qna-td">
       <input type=password name=pwd size=10 id="pwd">
      </td>
     </tr>
     <tr>
      <td colspan="2" class="text-center qna-td">
       <input type=submit class="btn btn-info btn-sm"
        value="����">
       <input type=button class="btn btn-danger btn-sm"
        value="���" onclick="javascript:history.back()">
      </td>
     </tr>
    </table>
    </form>
   </div>
  </div>
</body>

</html>




