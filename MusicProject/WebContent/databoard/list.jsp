<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--
       Model(Bean)-V 
       MVC
       MVVC 
       DOMAIN (Spring 5)
 --%>
<jsp:useBean id="model" class="com.sist.model.DataBoardModel"/>
<%
   model.databoardListData(request); 
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
    <h3>�ڷ��</h3>
    <table class="table">
      <tr>
       <td class="text-left">
        <a href="main.jsp?mode=13" class="btn btn-success btn-sm">����</a>
       </td>
      </tr>
    </table>
    <table class="table table-hover">
     <tr class="danger">
       <th width=10% class="text-center qna-th">��ȣ</th>
       <th width=45% class="text-center qna-th">����</th>
       <th width=15% class="text-center qna-th">�̸�</th>
       <th width=20% class="text-center qna-th">�ۼ���</th>
       <th width=10% class="text-center qna-th">��ȸ��</th>
     </tr>
     <c:forEach var="vo" items="${list }">
       <tr>
        <td width=10% class="text-center qna-td">${vo.no }</td>
        <td width=45% class="text-left qna-td">
         <a href="main.jsp?mode=14&no=${vo.no }">${vo.subject }</a>
        </td>
        <td width=15% class="text-center qna-td">${vo.name }</td>
        <td width=20% class="text-center qna-td">${vo.dbday }</td>
        <td width=10% class="text-center qna-td">${vo.hit }</td>
       </tr>
     </c:forEach>
    </table>
   </div>
  </div>
</body>
</html>






