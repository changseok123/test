<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*"%>
<%
	String no = request.getParameter("no");
	String strPage = request.getParameter("page");
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
  font-family: 맑은 고딕;
  font-size: 10pt;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row qnarow">
		<div style="height:70px"></div>
		<h3>삭제하기</h3>
		<form action="../qna/delete_ok.jsp" method=post>
		<table class="table table-hover">
			<tr>
				<td class="text-center">
				비밀번호 : <input type=password name=pwd size=13>
				       <input type=hidden name=no value="<%=no%>">
				       <input type=hidden name=page value="<%=strPage%>">
				</td>
			</tr>
			<tr>
				<td class="text-center qna-td">
					<input type=submit value=삭제 class="btn btn-success btn-xs">
					<input type=button value=취소 class="btn btn-warning btn-xs" onclick="javascript:history.back()">
				</td>
			</tr>
		</table>
		</form>
		</div>
	</div>
</body>