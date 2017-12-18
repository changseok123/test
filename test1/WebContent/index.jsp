<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<!-- css, js ���� -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="shadow/css/shadowbox.css" /> -->
<!-- <script type="text/javascript" src="shadow/js/shadowbox.js"></script> -->
</head>
<style>
.bg {
	background-image: url('image/bg.jpg');
	background-size: 100% 100%;
}

#logo {
	width: 20%;
}

#bg_black {
	background: #111;
	opacity: 0.3;
}

.container_fluid {
	height: 100%;
	width: 100%;
	position: absolute;
}

#content {
	padding-top: 20%;
}

#enterBtn {
	background-image: url('image/enterBtn.png');
	background-size: 100% 100%;
	width: 20%;
	height: 80px;
	margin-top: 20px;
	cursor: pointer;
	opacity: 0.8;
}
#enterBtn p{
	font-size: 35px;
	color: white;
	line-height: 80px;
}

#enterBtn:hover {
	opacity: 1;
}

#intro {
	margin-top: 10px;
}

#intro span {
	text-decoration: none;
	color: white;
	font-size: 16px;
	cursor: pointer;
}


.modal-body span{
	font-size: 18px;
	color: white;
}
.modal-content{
	background-color: #262626;
}
#myModalLabel{
	color: white;
}

/* �̵������ */
@media ( max-width : 992px) {
	#logo {
		width: 198px;
	}
	.bg {
		background-img: url('image/bg.jpg');
		background-size: inherit;
	}
	#content {
		padding-top: 40%;
	}
	#enterBtn {
		width: 198px;
		height: 60px;
	}
	#enterBtn p{
		font-size: 25px;
		color: white;
		line-height: 60px;
	}
	.modal-body span{
		font-size: 14px;
	}
	.modal-body img{
		width: 60px;
	}
	 #myModalLabel {
	 	font-size: 18px;
	 }
}


</style>

<script type="text/javascript">
	$(function() {
		$('#intro span').click(function() {
			$('#myModal').modal("show");
			// ���â ����
		});
	});
</script>

<body>
	<div class="container_fluid bg" id="bg"></div>
	<div class="container_fluid bg" id="bg_black"></div>
	<div class="container_fluid">
		<div id="content">
			<center>
				<div>
					<img id="logo" src="image/logo.png">
				</div>
				<div id="enterBtn" onclick="location.href='main/main.jsp;'">
					<p>�����ϱ�</p>
				</div>
				<div id="intro">
					<span>�������� �Ұ�</span>
				</div>
				<!-- ��� �˾� -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true" style="color:white">X</span><span class="sr-only">Close</span>
								</button>
								<h3 class="modal-title" id="myModalLabel">�������� �Ұ�</h3>
							</div>
							<div class="modal-body">
								<img src="image/couple.png">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="image/add.png">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="image/beer.png">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="image/equal.png">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="image/heart.png"> <br><br><br>
								<span>
								���÷��̽��� �����ϰ� ���ϰ� ����!<br>
								ȫ�� ���¿� ���� <br>
								��� ��ƾ����� �𸣰ڴٰ��?<br>
								�������� ������������ �����ϰڽ��ϴ�<br>
								�ϴ� �����ϼ���
								</span>
							</div>
						</div>
					</div>
				</div>

			</center>
		</div>
	</div>
</body>
</html>