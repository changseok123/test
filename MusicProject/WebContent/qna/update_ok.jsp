<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*"%>
<%
    request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="dao" class="com.sist.dao.QnABoardDAO"/>
<jsp:useBean id="vo" class="com.sist.dao.QnABoardVO">
 <jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
	// db����
	String strPage = request.getParameter("page");
	// �̵�
	boolean bCheck = dao.boardUpdate(vo);
	if(bCheck == false) {
%>
		<script>
			alert("��й�ȣ�� Ʋ���ϴ�.");
			history.back();
		</script>
<%
	} else {
		response.sendRedirect("../music/main.jsp?mode=8&no="+vo.getNo()+"&page="+strPage);
	}
%>
