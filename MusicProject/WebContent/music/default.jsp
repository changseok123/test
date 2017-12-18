<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  import="java.util.*, com.sist.*"%>
<%@page import="com.sist.vo.MusicVo"%>
<%@page import="com.sist.news.*" %>
<jsp:useBean id="dao" class="com.sist.dao.MusicDAO"></jsp:useBean>
<jsp:useBean id="mgr" class="com.sist.news.NewsManager"></jsp:useBean>
<%
	List<MusicVo> list = dao.musicAllData10();
	List<Item> nList = mgr.naverNewsAllData();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	$('.news').popover();
})
</script>
</head>
<body>

	<div class="container">
		<div class="jumbotron">
			<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
			<script src="https://www.amcharts.com/lib/3/serial.js"></script>
			<div id="chartdiv"></div>

			<script src="js/index.js"></script>

		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<%
				for(int i=0; i<3; i++){
					MusicVo vo = list.get(i);
			%>
						<div class="col-lg-4">
							<embed src="http://www.youtube.com/embed/<%= vo.getKey() %>" height=200/>
						</div>
			<%
				}
			%>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-5">
				<h3>뮤직 Top50</h3>
				<table class="table table-hover">
					<tr>
						<th>순위</th>
						<th></th>
						<th></th>
						<th>노래명</th>
						<th>아티스트</th>
					</tr>
					<%
						for(MusicVo vo:list) {
							%>
							
							<tr>
								<td><%= vo.getRank() %></td>
								<td><%
									String s = "";
									if(vo.getState().equals("유지"))
										s="-";
									else if(vo.getState().equals("상승"))
										s="<font color=red>▲</font>";
									else
										s="<font color=blue>▼</font>";
								%>
								<%= s %>&nbsp;<%=vo.getIdincrement() !=0 ? vo.getIdincrement() : "" %></td>
								<td><img src="<%=vo.getPoster()%>" width=30 heigth=20></td>
								<td><%=vo.getTitle() %></td>
								<td><%=vo.getSinger().replace("^", "&") %></td>
								
							</tr>
							
							<%
						}
					%>
				</table>
			</div>
			<div class="col-lg-5">
				<h3>뮤직 뉴스</h3>
				<table class="table">
					<%
						String color="";
						for(int i=0; i < 10; i++) {
							if(i%5==0) {
								color="info";
							} else if(i%5==1) {
								color="success";
							} else if(i%5==2) {
								color="warning";
							} else if(i%5==3) {
								color="danger";
							} else if(i%5==4) {
								color="primary";
							}
							Item item = nList.get(i);
					%>
						<tr class="<%= color %>">
							<td class="text-left">
								<span class="news btn btn-sm" 
								data-original-title="<%= item.getTitle() %>"
								data-toggle="popover"
								data-content="<%= item.getDescription() %>"
								data-placemnet="bottom">
								<%= item.getTitle() %>
								</span>
							</td>
						</tr>
					<%
						}
					%>
				</table>
			</div>
			<div class="col-lg-2">
				
			</div>
		</div>
	</div>
</body>
</html>