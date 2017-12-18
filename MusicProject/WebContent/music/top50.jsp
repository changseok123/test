<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*, java.util.*, com.sist.vo.*"%>
<jsp:useBean id="dao" class="com.sist.dao.MusicDAO"></jsp:useBean>
<%
	List<MusicVo> list = dao.musicAllData50();
%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.qnarow {
	margin: 0px auto;
	width: 600px;
}
.qna-th, .qna-th {
	font-family: 맑은 고딕;
	font-size: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row qnarow">
		<div style="height:70px"></div>
		<h3>Top 50</h3>
			<table class="table table-hover">
				<tr class="danger">
					<th>순위</th>
					<th></th>
					<th></th>
					<th>노래명</th>
					<th>가수명</th>
					<th></th>
				</tr>
				<%
					for(MusicVo vo:list) {
				%>
					<tr>
						<td><%= vo.getRank() %></td>
						<td>
							<%
								String str = "";
								if(vo.getState().equals("상승"))
									str = "▲";
								else if(vo.getState().equals("하강"))
									str = "▼";
								else if(vo.getState().equals("유지"))
									str = "-";
							%>
							<%= str %>&nbsp;<%= vo.getIdincrement()==0?"":vo.getIdincrement() %>
						</td>
						<td>
							<img src="<%=vo.getPoster() %>" width=30 height=20>
						</td>
						<td><%= vo.getTitle() %></td>
						<td><%= vo.getSinger() %></td>
						<td>
							<a href="#" class="btn btn-sm btn-primary">◑</a>
						</td>
					</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
</body>
</html>