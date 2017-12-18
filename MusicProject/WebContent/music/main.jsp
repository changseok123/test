<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.change.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String mode=request.getParameter("mode");
    if(mode==null)
    	mode="0";
    String jsp=JspChange.change(Integer.parseInt(mode));
    
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<style type="text/css">
.jumbotron{
  height:350px;
  background: #ededed;
}
td,th{
  font-size: 8px;
}
</style>
<script type="text/javascript">
$(function() {
	$('#loginBtn').click(function() {
		var id = $('#id').val();
		if(id.trim() == "") {
			$('#result').text("아이디를 입력하세요.");
			$('#id').focus();
			return;
		} else {
			$('#result').text("");
		}
		
		var pwd = $('#pwd').val();
		if(pwd.trim() == "") {
			$('#result').text("비밀번호를 입력하세요.");
			$('#pwd').focus();
			return;
		} else {
			$('#result').text("");
		}
		
		$.ajax({
			type:'post',
			url:'../member/login.jsp',
			data:{"id":id, "pwd":pwd},
			success:function(response) {
				var count = response.trim();
				if(count == 1) {
					$('#result').text("아이디 존재하지 않습니다.");
					$('#id').val("");
					$('#pwd').val("");
					$('#id').focus();
				} else if(count == 2) {
					$('#result').text("비밀번호가 틀립니다.");
					$('#pwd').val("");
					$('#pwd').focus();
				} else {
					location.href = "main.jsp";
				}
			}
		});
	});
});
</script>
</head>
<body>
  <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        </button>
                    <a href="main.jsp" class="navbar-brand">쌍용강북교육센터(H강의장)</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                        
                        	<c:if test="${sessionScope.id == null}">
                         		<li><a href="main.jsp?mode=1">회원가입</a></li>
                            </c:if>
                            <c:if test="${sessionScope.id != null }">
                           		<li><a href="main.jsp?mode=3">회원수정</a></li>
                            </c:if>
                            
                            <li><a href="main.jsp?mode=2">뮤직 Top50</a></li>
                            
                            <c:if test="${sessionScope.id != null }">
                            	<li><a href="main.jsp?mode=4">추천 뮤직</a></li>
                            	<li><a href="main.jsp?mode=5">음반 예약</a></li>
                            </c:if>
                            
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">커뮤니티
          <b class="caret"></b>
       </a>
                                <ul class="dropdown-menu">
                                	<c:if test="${sessionScope.id != null}">
                                    	<li><a href="../music/main.jsp?mode=17">자유게시판</a></li>
                                    </c:if>
                                    <li><a href="../music/main.jsp?mode=6">묻고답하기</a></li>
                                    <li><a href="../music/main.jsp?mode=12">자료실</a></li>
                                    
                                    <c:if test="${session.id != null && admin == 'n'}">
                                    	<li><a href="#">마이페이지</a></li>
                                    </c:if>
                                    <c:if test="${session.id != null && admin == 'y'}">
                                    	<li><a href="#">예약현황</a></li>
                                    </c:if>
                                </ul>
                            </li>
                        </ul>
                        <!-- <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">로그인</a></li>
                        </ul> -->
                        
                        <!-- 로그인폼 -->
                        <c:if test="${sessionScope.id == null}">
                        <div class="navbar-collapse collapse" id="navbar-main">
                         <form class="navbar-form navbar-right" role="search" method="post" action="../member/login.jsp">
                           <div class="form-group">
                            <input type=text class="form-control input-xs"
                             name="id" placeholder="ID" size=10 id="id">
                           </div>
                           <div class="form-group">
                            <input type=text class="form-control input-xs"
                             name="pwd" placeholder="Password" size=10 id="pwd">
                           </div>
                           <input type=button class="btn btn-default"
                            value="로그인" id="loginBtn">
                         	<div id="result" style="color:white">
                         		
                         	</div>
                         </form>
                        </div>
                        </c:if>
                        
                        <c:if test="${sessionScope.id != null}">
                        <div class="navbar-collapse collapse" id="navbar-main">
                         <form class="navbar-form navbar-right" role="search" method="post" action="../member/logout.jsp">
                           <div class="form-group">
                           	${sessionScope.name}(${sessionScope.admin == 'y' ? "관리자":"일반" })
                           </div>
                           <div class="form-group">
							로그인중입니다.
                           </div>
                           <input type=submit class="btn btn-default"
                            value="로그아웃" id="logoutBtn">
                         	</div>
                         </form>
                        </div>
                        </c:if>
                        <!-- 로그인폼 끝 -->
                    </div>
                </div>
            </nav>
            <div style="height:70px"></div>
         <jsp:include page="<%=jsp %>"></jsp:include>
</body>
</html>










