<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>�������</title>
<%-- ������ڽ� --%>
<!-- <link rel="stylesheet" href="../member/shadow/css/shadowbox.css">
<script type="text/javascript" src="../member/shadow/js/shadowbox.js"></script> -->
<style type="text/css">
	.cbInsertrow{
		margin: 0px auto;
		width: 50%;
	}
	.cbInsert_div{
		height: 90px;
	}
	.cbInsert_input{
		height: 70px; 
		padding-left: 20px;
		padding-right: 20px;
		font-size: medium;
	}
	#phone_btn{
		background-color: rgb(162,0,0);
		color: white;
		height: 70px;
	}
	#gender, #gender2{
		height: 50px;
		background-color: white;
		border: 1px solid gray;
	}
	.cbInsert_btn{
		background-color: rgb(162,0,0);
		color: white;
		height: 50px;
		width: 150px;
		font-size: 20px;
	}
	.checkbox-wrap { cursor: pointer; margin-right: 30px;}
	.checkbox-wrap .check-icon  { display: inline-block; width: 50px; height: 50px; background: url(../hot3/image/hot3check.png) left center no-repeat; vertical-align: middle; transition-duration: .3s; }
	.checkbox-wrap input[type=radio] { display: none; }
	.checkbox-wrap input[type=radio]:checked + .check-icon { background-image: url(../hot3/image/hot3uncheck.png); }
	
	
	@media screen and (max-width: 750px) {
		.cbInsertrow{
			margin: 0px auto;
			width: 100%;
		}
		.cbInsert_div{
			margin: 0px auto;
			text-align: center;
		}
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row cbInsertrow">
			<div style="height: 50px"></div>
			<div style="height: 120px">
				<h1>�������</h1>
			</div>
			<form>
				<div class="text-left">
					<label>email</label>
				</div>
				<div class="cbInsert_div">
					<input type="email" id="hot3email" name="hot3email" value="${sessionScope.id}" size="50px" class="cbInsert_input form-control" readonly="readonly"/>
				</div>
				<div class="text-left">
					<label>���Ը�</label>
				</div>
				<div class="cbInsert_div">
					<input type="password" id="hot3name" name="hot3name" placeholder="���Ը��� �Է��ϼ���." size="50px" class="cbInsert_input form-control"/>
				</div>
				<div class="text-left">
					<label>����ڵ�Ϲ�ȣ</label>
				</div>
				<div class="cbInsert_div">
					<input type="text" id="hot3crn" name="hot3crn" placeholder="'��' ���� �Է��ϼ���." class="cbInsert_input form-control" size="50px"/>		
				</div>
				<div class="text-left">
					<label>��ȭ��ȣ</label>
				</div>
				<div class="cbInsert_div">
					<input type="text" id="hot3phone" name="hot3phone" placeholder="'��' ���� �Է��ϼ���." class="cbInsert_input form-control" size="50px"/>		
				</div>
				<div class="text-left">
					<label>�̹���</label>
				</div>
				<div class="cbInsert_div">
					<input type="file" id="hot3img" name="hot3img" class="cbInsert_input form-control" size="50px"/>		
				</div>
				
				
				<div class="text-left">
					<label>����</label>
				</div>
				<div class="cbInsert_div text-center">
					<label class="checkbox-wrap"><input type="radio" name="hot3grade" value="Ŭ��" checked>Ŭ��<i class="check-icon"></i></label>
					<label class="checkbox-wrap"><input type="radio" name="hot3grade" value="��������">��������<i class="check-icon"></i></label>
					<label class="checkbox-wrap"><input type="radio" name="hot3grade" value="���ü���">���ü���<i class="check-icon"></i></label>
					<label class="checkbox-wrap"><input type="radio" name="hot3grade" value="����Ʈ">����Ʈ<i class="check-icon"></i></label>
				</div>
				<!-- <div class="cbInsert_div text-center btn-group btn-group-lg" style="width: 360px">
					<input type="button" id="gender" name="gender" value="����" class="btn col-xs-6">
					<input type="button" id="gender2" name="gender" value="����" class="btn col-xs-6">
				</div> -->
				<div class="cbInsert_div text-center">
					<input type="submit" value="����" class="btn cbInsert_btn" >&nbsp;
					<input type="button" value="���" class="btn cbInsert_btn" onclick="javascript:history.back()">
				</div>
			</form>
		</div>
	</div>
	<div style="height: 50px"></div>
</body>
</html>