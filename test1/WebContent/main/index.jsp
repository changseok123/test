<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<!-- css, js 연결 -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="shadow/css/shadowbox.css" />
<script type="text/javascript" src="shadow/js/shadowbox.js"></script>
</head>
<style>
.bg {
	background-image: url('img/bg.jpg');
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
	margin-top: 20%;
}

#btn_enter {
	background-image: url('img/enter.png');
	background-size: 100% 100%;
	width: 20%;
	height: 80px;
	margin-top: 20px;
	cursor: pointer;
	opacity: 0.8;
}

#btn_enter:hover {
	opacity: 0.9;
}

#intro {
	margin-top: 10px;
	cursor: pointer;
}

#intro span {
	text-decoration: none;
	color: white;
	font-size: 16px;
}

@media ( max-width : 767px) {
	#logo {
		width: 154px;
	}
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


@media ( max-width : 993px) {
	#logo {
		width: 198px;
	}
	.bg {
		background-image: url('img/bg.jpg');
		background-size: inherit;
	}
	#btn_enter {
		background-image: url('img/enter_mobile.png');
		width: 198px;
		height: 60px;
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
		$('#intro').click(function() {
			$('#myModal').modal("show");
			// 모달창 열기
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
				<a href="main/main.jsp"> <img id="btn_enter" />
				</a>
				<div id="intro">
					<span>끼리끼리 소개</span>
				</div>
				<!-- 모달 팝업 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true" style="color:white">X</span><span class="sr-only">Close</span>
								</button>
								<h3 class="modal-title" id="myModalLabel">로그인</h3>
							</div>
							<div class="modal-body">
								<jsp:include page="login.jsp"/>
							</div>
						</div>
					</div>
				</div>

			</center>
		</div>
	</div>
</body>
</html>