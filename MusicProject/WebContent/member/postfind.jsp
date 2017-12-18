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
  width:450px;
}
</style>
<script type="text/javascript">
$(function () {
	$('#postBtn').click(function() {
		var dong = $('#dong').val();
		if(dong.trim() == "") {
			$('#dong').focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'postfind_result.jsp',
			data:{"dong":dong},
			success:function(response) {
				/* alert(response); */
				$('#post_result').html(response);
			}
		});
	});
});
</script>
</head>
<body>
	<div class="container">
		<div class="row postrow">
			<table class="table table-hover">
				<tr>
					<td class="text-left">
						입력 <input type=text id="dong" size=15>
						<input type=button value="검색" class="btn btn-sm btn-primary" id="postBtn">
					</td>
				</tr>
			</table>
			<div id="post_result">
				
			</div>
		</div>
	</div>
</body>
</html>