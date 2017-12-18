<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<style type="text/css">
.idrow{
  margin: 0px auto;
  width:300px;
}
</style>
<script type="text/javascript">
$(function(){
	$('#checkBtn').click(function(){
		var id=$('#id').val();
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		$.ajax({
			type:'POST',
			url:'idcheck_result.jsp',
			data:{"id":id},
			success:function(response)
			{
				var result=response.trim();
				if(result==0)
				{
					$('#res').html("<font color=blue>"
					  +id+"은(는) 사용 가능한 아이디입니다</font>");
					$('#res_ok').html(
					  "<input type=button value=확인 onclick=ok('"+id+"')>"
					 );
				}
				else
				{
					$('#res').html("<font color=red>"
					  +id+"은(는) 이미 사용중인 아이디입니다</font>");
					$('#id').val("");
					$('#id').focus();
					$('#res_ok').html("");
				}
			}
		});
	});
});

function ok(id) {
	parent.frm.id.value = id;
	parent.Shadowbox.close();
}
</script>
</head>
<%--
       function createRequest()
       {
          if(window.ActiveXObject) // MS
          {
             return new ActiveXObject("MSXML2.HTTPXML")
          }
          else if(window.XmlRequest) // 크롬,ff
          {
             
          }
       }
       ==> $.ajax()
       function sendMessage()
       {
          var httpRequest=createRequest();
          httpRequest.open(method,url,true);연결 
          true(비동기)/false(동기)
          httpRequest.onreadystatechange=callback;
          => success:function()
          httpRequest.send(data)
       }
       function success()
       {
          0 : open준비 
          1 : open중 
          2 : open완료
          3 : send전송전
          4 : send완료
          if(httpRequest.readyState==4)
          {
             404,500... 200
             if(httpRequest.status==200)
             {
                success:function()
             }
          }
       }
 --%>
<body>
 <div class="container">
  <div class="row idrow">
   <table class="table table-hover" id="res_table">
    <tr>
     <td class="text-left">
      ID:<input type="text" name="id" size=12 id="id">
      <input type=button value="중복체크"
       class="btn btn-info btn-sm" id="checkBtn">
     </td> 
    </tr>
    <tr>
      <td class="text-center" id="res">
        
      </td>
    </tr>
    <tr>
    	<td class="text-center" id="res_ok">
    	
    	</td>
    </tr>
   </table>
  </div>
 </div>
</body>
</html>















