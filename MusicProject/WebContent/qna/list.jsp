<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.QnABoardDAO"/>
<%
    String strPage=request.getParameter("page");
    if(strPage==null)
    	strPage="1";
    int curpage=Integer.parseInt(strPage);
    List<QnABoardVO> list=dao.boardListData(curpage);
    int totalpage=dao.boardTotalPage();
    int count=dao.boardRowCount();
    count=count-((curpage*10)-10);
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
    <h3>���� ���ϱ�</h3>
    <table class="table">
      <tr>
       <td class="text-left">
        <a href="main.jsp?mode=7" class="btn btn-success btn-sm">����</a>
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
     <%
        for(QnABoardVO vo:list)
        {
     %>
           <tr>
		     <td width=10% class="text-center qna-td"><%=count-- %></td>
		     <td width=45% class="text-left qna-td">
		     <%
		        if(vo.getGroup_tab()>0)
		        {
		        	for(int i=0;i<vo.getGroup_tab();i++)
		        	{
		        		out.println("&nbsp;&nbsp;");
		        	}
		     %>
		           <img src="../qna/img/qna.png">
		     <%
		        }
		     
		     	String msg = "�����ڰ� ������ �Խù��Դϴ�.";
		     	if(msg.equals(vo.getSubject())) {
		     %>
		     		<span style="color:#999">
		     			<%= vo.getSubject() %>
		     		</span>
		     <%		
		     	} else {
		     %>
		     	<a href="main.jsp?mode=8&no=<%=vo.getNo()%>&page=<%=curpage%>"><%=vo.getSubject() %></a>
		     <%
		     	}
		     	String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		     	String dbday = vo.getRegdate().toString();
		     	
		     	if(today.equals(dbday)) {
		     %>
		     	<sup>
		     		<img src="../qna/img/new.png" width="5.5%">
		     	</sup>
		     <%
		     	}
		     %>
		     </td>
		     <td width=15% class="text-center qna-td"><%=vo.getName() %></td>
		     <td width=20% class="text-center qna-td"><%=vo.getRegdate().toString() %></td>
		     <td width=10% class="text-center qna-td"><%=vo.getHit() %></td>
		   </tr>  
     <%
        }
     %>
    </table>
    <table class="table">
     <tr>
      <td class="text-left qna-td">
       Search:
       <select name="fs">
        <option value="name">�̸�</option>
        <option value="subject">����</option>
        <option value="content">����</option>
       </select>
       <input type=text name="ss" size=13>
       <input type=submit value="ã��" class="btn btn-info btn-xs">
      </td>
      <td class="text-right qna-td">
       <a href="#" class="btn btn-danger btn-xs">��</a>&nbsp;
       <a href="#" class="btn btn-danger btn-xs">����</a>&nbsp;
       <%
          for(int i=1;i<=totalpage;i++)
          {
       %>
            [
               <a href="main.jsp?page=<%=i %>&mode=6"><%=i %></a>
            ]
       <%
          }
       %>
       <a href="#" class="btn btn-warning btn-xs">����</a>&nbsp;
       <a href="#" class="btn btn-warning btn-xs">��</a>
       &nbsp;&nbsp;
       <%=curpage %> page / <%=totalpage %> pages
      </td>
     </tr>
    </table>
   </div>
  </div>
</body>





</html>