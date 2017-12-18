<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="model" class="com.sist.model.DataBoardModel"/>
<%
    model.databoardListData(request);
    // call by reference (동적바인딩) : 클래스(String(X)),배열
    // A a=new A(); String s="홍길동";
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
    <h3>내용보기</h3>
    <table class="table table-hover">
     <tr>
      <td width="20%" class="text-center danger qna-td">번호</td>
      <td width="30%" class="text-center qna-td">${vo.no }</td>
                   <%-- ${vo.no} == request.getAttribute("vo").getNo() --%>
      <td width="20%" class="text-center danger qna-td">작성일</td>
      <td width="30%" class="text-center qna-td">
       ${vo.regdate }
      </td>
     </tr>
     <tr>
      <td width="20%" class="text-center danger qna-td">이름</td>
      <td width="30%" class="text-center qna-td">${vo.name }</td>
      <td width="20%" class="text-center danger qna-td">조회수</td>
      <td width="30%" class="text-center qna-td">${vo.hit }</td>
     </tr>
     <tr>
      <td width="20%" class="text-center danger qna-td">제목</td>
      <td colspan="3" class="text-left qna-td">${vo.subject }</td>
     </tr>
     <c:if test="${vo.filecount!=0 }">
      <tr>
       <td width="20%" class="text-center danger qna-td">첨부파일</td>
       <td colspan="3" class="text-left qna-td">
        <a href="../databoard/download.jsp?fn=${vo.filename }">${vo.filename }</a>(${vo.filesize }Bytes)
       </td>
      </tr>
     </c:if>
     <tr>
      <td colspan="4" class="text-left qna-td" valign="top" height=200><pre>${vo.content }</pre></td>
     </tr>
    </table>
    <table class="table">
     <tr>
      <td class="text-right qna-td">
       <a href="#" class="btn btn-success">수정</a>
       <a href="main.jsp?mode=15&no=${vo.no }" class="btn btn-success">삭제</a>
       <a href="main.jsp?mode=12" class="btn btn-success">목록</a>
      </td>
     </tr>
    </table>
   </div>
  </div>
</body>
</html>




