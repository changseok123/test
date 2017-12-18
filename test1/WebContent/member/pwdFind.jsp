<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>PWDFIND</title>
<style type="text/css">
	.pwdfindrow{	
		margin: 0px auto;
		width: 300px;
	}
	a:link {
		text-decoration:none;
	}
	.find_input{
		height: 60px; 
		padding-left: 20px;
		padding-right: 20px;
		font-size: medium;
	}
	.find_btn{
		background-color: rgb(162,0,0);
		color: white;
		width: 80px;
		height: 40px;
	}
</style>
</head>
<body>
	<div>
		<div class="row pwdfindrow">
			<div style="height: 30px"></div>
			<form>
    			<div>
      				<input id="name" type="email" class="form-control find_input" name="email" placeholder="�̸����� �Է��ϼ���" required>
    			</div>
    			<div>
      				<input id="phone" type="text" class="form-control find_input" name="phone" placeholder="�ڵ��� ��ȣ�� �Է��ϼ���." maxlength="11" required>
   				</div>
    			<br>
    			<div class="text-center"><br>
    				<button type="button" class="btn find_btn">ã��</button>
    				<button type="button" class="btn find_btn closebtn">���</button>
    			</div>
  			</form>
		</div>
	</div>
</body>
</html>