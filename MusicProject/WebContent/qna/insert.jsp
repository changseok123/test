<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
    <h3>�۾���</h3>
    <form method="post" action="../qna/insert_ok.jsp">
    <table class="table table-hover">
     <tr>
      <td width=20% class="text-right qna-td">�̸�</td>
      <td width=80% class="text-left qna-td">
       <input type=text name=name size=13 id="name">
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td">����</td>
      <td width=80% class="text-left qna-td">
       <input type=text name=subject size=50 id="subject">
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td" valign="top">����</td>
      <td width=80% class="text-left qna-td">
       <textarea rows="10" cols="55" name=content id="content"></textarea>
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
        value="�۾���">
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




