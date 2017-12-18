<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>

<style type="text/css">
.tContainer{
	width:100%;
	height:auto;
}
.container {
	width:90%;
	
}

#ePic{
	width:100%;
	height 100%;
}

/* .navbar-default:hover {
	color:white;
	background-color: blue;
} */

.nav-link {
	color:black;
	font-size: 20px;
}
.modal-content {
	background-color:#646464;
	color:white;
}

.thumbnail {
	background-color:black;
}
.thumbnail:hover {
	cursor:Pointer;
	opacity:0.6;
}

#interest:hover {
	cursor:Pointer;
	opacity: 0.8;
}

#board_page {
   width: 500px;
   margin: 0 auto;
   font-size:20px;
}
</style>
</head>
<body>
	<div class="tContainer">
	<div class="container">
		<div class="row">
		<div style="height:130px"></div>
			<h1>�̺�Ʈ</h1>
			<%--���� --%>
			<ul class="nav nav-tabs nav-justified">
			<li class="nav-item">
			<a class="nav-link active" href="#">��ü</a>
			</li>
			<li class="nav-item">
			<a class="nav-link active" href="#">������</a>
			</li>
			<li class="nav-item">
			<a class="nav-link active" href="#">����</a>
			</li>
			</ul>
		</div>
		
		<%--�̺�Ʈ ��� --%>
		<div style="height:30px;"></div>
			
		<div class="row">
		
		<c:forEach var="i" begin="1" end="15">
		  <div class="col-sm-6 col-md-4" >
		    <div class="thumbnail" data-toggle="modal" data-target="#myModal" >
		      <img src="../event/image/event_poster.jpg" alt="�̺�Ʈ">
		      <div class="caption">
		        <h2 style="color:white; margin-left:10px;">�̺�Ʈ ����</h2>
		      </div>
		    </div>
		 </div>
		
		<!-- Modal -->
		  <!-- ��� �˾� ������ --> 
		  <div class="modal fade" id="myModal" tabindex="-1" 
		   role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" > 
		    <div class="modal-dialog modal-lg"> 
		     <div class="modal-content"> 
		       <div class="modal-header">
		       <button type="button" class="close" data-dismiss="modal">
		       	<img alt="������" src="../event/image/exit.png">
		       </button>
		  	   <h4 class="modal-title" id="myModalLabel">��������</h4> 
		  	   </div> 
		  	   
		       <!--��� �� <div class="modal-body">  -->
		       
		       	<div id="content1" style="float:left; width: 52%; padding:10px;">
					<img id="ePic" src="../event/image/event_poster.jpg" alt="�̺�Ʈ">
				</div>
				<div id="content2" style="float: left; width: 47%; padding:10px;">
					<table class="table">
							<div style="float:left; width: 70%; padding:10px;">
							<h4>�̺�Ʈ �̸�</h4>
							</div>
							<div class="text-right" style="float:left; width: 30%; padding:10px;">
								<img id="interest" alt="����" src="../event/image/interest.png" style="width:35px; height:auto;">
							</div>
		      				<tr>
		      					<th class="text-center" width="20%">�����̸�</th>
		      					<td width="80%">��Ÿ��</td>
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">�ּ�</th>
		      					<td width="80%">���� ������ ���̷� ���̷� �����</td>
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">�Ͻ�</th>
		      					<td width="80%">2017-10-10~2017-10-10</td>
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">����</th>
		      					<td width="80%">�� ���������̾� ������ ������ ���ѿ��� ��ī�� ������������ ���� 
		      					��ģ���� �Բ��ϱ� ��ī��ī ���������� ���� ��ģ�� ��ī�� �츮�� �Բ����
		      					�츰 �ְ�� �������� ������ ������ �������� �������� ������ �׳��� ����
		      					��ī��</td>
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">������Ȳ</th>
		      					<td width="80%">
		      						<div class="col-sm-6">
		      						<img alt="����������" src="../event/image/men.png" 
		      							style="width:40px; height:auto">
		      							&nbsp;&nbsp;����:10��
		      							</div>
		      						<div class="col-sm-6">
		      						<img alt="����������" src="../event/image/women.png">
		      							&nbsp;����:10��
		      						</div>
		      					</td>
		      					
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">����</th>
		      					<td width="80%">���� : 200��</td>
		      				</tr>
		      			</table>	
				</div>
		   		<!-- </div> -->
		   		<div class="modal-footer">
		   			<div class="text-center"> 
		   				<button type="button" class="btn btn-lg" style="background-color:#AF4848">����</button>
		   			</div> 
		   		 </div>
		  	   
		  	  </div>
		   	 </div>
		   </div>
		   </c:forEach>
		   
	     </div>
	  </div>
	  <%--������ ��ȣ --%>
	  
	  <div id="board_page" style="float:left; width: 75%; margin-top:10px;">
            <center>
               <a href="#"><</a>&nbsp;&nbsp;&nbsp;
               <c:forEach var="i" begin="1" end="10">
                  <a href="#">${i }</a>&nbsp;
                     </c:forEach>
               &nbsp;&nbsp;&nbsp;<a href="#">></a>
            </center>
         </div>
         
	  <%-- <div class="text-center" style="float:left; width: 80%; ">
	  <nav>
  		<ul class="pagination">
   		<li>
    	  <a href="#" aria-label="Previous">
        	<span aria-hidden="true">&laquo;</span>
      		</a>
		</li>
			<c:forEach var="i" begin="1" end="10">
	    	<li><a href="#">${i }</a></li>
			</c:forEach>
		<li>
    		<a href="#" aria-label="Next">
	        	<span aria-hidden="true">&raquo;</span>
	    	</a>
    	</li>
		</ul>
		</nav>
	  	</div> --%>
	  	
	  	<%--�̺�Ʈ ��� ��ư --%>
		<div class="text-center" style="float:left; width: 20%; 
				 margin-bottom:40px;"> 
		   	<button type="button" class="btn btn-lg btn-info" 
		   			style="background-color:rgb(162,0,0); border:1px solid rgb(162,0,0);">
		   		<a href="../event/eventRegist.jsp" style="text-decoration:none;
		   				 color:white;">�̺�Ʈ ���</a>
			</button>
		</div> 
	  </div>
	  
		  
		  
		 
	

</body>
</html>