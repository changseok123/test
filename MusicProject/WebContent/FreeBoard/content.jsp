<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*" import="com.sist.dao.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dao" class="com.sist.dao.FreeboardService"></jsp:useBean>
<%
	String no = request.getParameter("no");
	FreeBoardVO vo = dao.freeboardDetailData(Integer.parseInt(no));
%>
<c:set var="vo" value="<%= vo %>"/>
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
		<div style="height=70px"></div>
			<h3>내용보기</h3>
			<table class="table table-hover">
				<tr>
					<td width=20% class="success qna-td text-center">번호</td>
					<td width=30% class="qna-td text-center">${vo.no}</td>
					<td width=20% class="success qna-td text-center">작성일</td>
					<td width=30% class="qna-td text-center">${vo.regdate}</td>
				</tr>
				<tr>
					<td width=20% class="success qna-td text-center">이름</td>
					<td width=30% class="qna-td text-center">${vo.name}</td>
					<td width=20% class="success qna-td text-center">조회수</td>
					<td width=30% class="qna-td text-center">${vo.hit}</td>
				</tr>
				<tr>
					<td width=20% class="success qna-td text-center">제목</td>
					<td colspan="3" class="qna-td text-left">${vo.subject}</td>
				</tr>
				<tr>
					<td colspan="4" valign="top" class="text-left" height="100">
						${vo.content}
					</td>
				</tr>
				<tr>
					<td colspan="4" class="text-right">
						<a href="#">수정</a>
						<a href="#">삭제</a>
						<a href="main.jsp?mode=17">목록</a>
					</td>
				</tr>
			</table>
			<!-- 댓글 -->
		</div>
	</div>
</body>