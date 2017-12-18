<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="dao" class="com.sist.dao.FreeboardService"/>
<%
    String strPage=request.getParameter("page");
    if(strPage==null)
    	strPage="1";
    // board.jsp => page=null ,board.jsp?page= , page=""
    int curpage=Integer.parseInt(strPage);
    // window,web => 모든 데이터형은 String이다 Wrapper
    /*
         int a=10;
         Integer i=a;
         
         Integer i=new Integer(10);
         int a=i;
    */
    
    List<FreeBoardVO> list=dao.freeboardListData(curpage);
    
    for(FreeBoardVO vo : list) {
    	vo.setCount(dao.replyCount(vo.getNo()));
    }
    
    int totalpage = dao.freeboardTotalPage();
%>
<c:set var="list" value="<%=list %>"/>
<c:set var="curpage" value="<%=curpage%>"/>
<c:set var="totalpage" value="<%=totalpage%>"/>
<%--
    request.setAttribute("var",value);
 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.qnarow{
  margin: 0px auto;
  width: 600px;
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
    <h3>자유게시판</h3>
    <table class="table table-hover">
     <tr class="success">
       <th width=10% class="text-center qna-th">번호</th>
       <th width=45% class="text-center qna-th">제목</th>
       <th width=15% class="text-center qna-th">이름</th>
       <th width=20% class="text-center qna-th">작성일</th>
       <th width=10% class="text-center qna-th">조회수</th>
     </tr>
     <%--
          for(FreeBoardVO vo:list)
      --%>
     <c:forEach var="vo" items="${list }">
       <tr>
        <td width=10% class="text-center qna-td">${vo.no }</td>
        <td width=45% class="text-left qna-td">	
        	<a href="main.jsp?mode=18&no=${vo.no}">${vo.subject }</a>
        	&nbsp;
        	<c:if test="${vo.count != 0}">
        		(${vo.count})
        	</c:if>
        </td>
        <td width=15% class="text-center qna-td">${vo.name }</td>
        <td width=20% class="text-center qna-td">${vo.regdate }</td>
        <td width=10% class="text-center qna-td">${vo.hit }</td>
       </tr>
     </c:forEach>
    </table>
    <table class="table">
      <tr>
       <td class="text-right">
        <a href="#" class="btn btn-sm btn-info">이전</a>&nbsp;
        <a href="#" class="btn btn-sm btn-success">다음</a>&nbsp;&nbsp;
        ${curpage } page / ${totalpage } pages
       </td>
      </tr>
    </table>
   </div>
  </div>
</body>

</html>





