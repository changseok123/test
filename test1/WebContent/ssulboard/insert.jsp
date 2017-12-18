<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

	(function($) {
		var $fileBox = null;
		$(function() {
			init();
		})
		function init() {
			$fileBox = $('.input-file');
			fileLoad();
		}
		function fileLoad() {
			$.each($fileBox, function(idx) {
				var $this = $fileBox.eq(idx), $btnUpload = $this
						.find('[type="file"]'), $label = $this
						.find('.file-label');
				$btnUpload
						.on('change',
								function() {
									var $target = $(this), fileName = $target
											.val(), $fileText = $target
											.siblings('.file-name');
									$fileText.val(fileName);
								})
				$btnUpload.on('focusin focusout', function(e) {
					e.type == 'focusin' ? $label.addClass('file-focus')
							: $label.removeClass('file-focus');
				})
			})
		}
	})(jQuery);
</script>
</head>
<style>
#board_pro {
	background-image: url('../image/pro.png');
	background-size: 100%;
	border-radius: 50%;
	width: 80px;
	height: 80px;
	float: left;
}

#board_user {
	width: 200px;
	height: 80px;
	margin-left: 100px;
}

#board_user p {
	margin: 0;
}

#board_name {
	font-size: 18px;
	font-weight: bold;
	line-height: 80px;
}

#board_subject {
	/* width:100%; */
	height: 50px;
	border-bottom: 4px solid rgb(162, 0, 0);
}
#board_subTxt {
	text-align: center;	
}
#board_subTxt span {
	/* line-height: 40px; */
	font-size: 17px;
	font-weight: bold;
}

#board_subInput {
	width: 100%;
	height: 45px;
	font-size: 18px;
}

#board_content {
	width: 100%;
}
.form-control{
	resize: none;
}
#board_content p {
	font-size: 17px;
}

#board_insertBtn {
	background-color: rgb(162, 0, 0);
	color: white;
}

/* ���Ͼ��ε� */
.input-file {
	/* display: inline-block; */
	width: 100%;
}

.input-file [type="file"] {
	position: absolute;
	width: 100%;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0 none;
}

.input-file .file-label {
	/* display: inline-block; */
	/* min-width: 53px; */
	height: 40px;
	line-height: 40px;
	padding: 0 0px;
	border-radius: 2px;
	font-size: 13px;
	/* background-color: #333; */
	/* color: #fff; */
	text-align: center;
	width: 80px;
}

.input-file .file-name {
	width: 50%;
	background: #f5f5f5;
	height: 40px;
	line-height: 26px;
	text-indent: 5px;
	border: 1px solid #bbb;
} /* ���ټ� �� ��Ŀ�� ��Ÿ�� */
.file-focus {
	outline: 1px dotted #d2310e;
	/* float:left; */
}

/* �̵������ */
@media ( max-width : 993px) {
	#board_subTxt {
		width: 10%;
	}
}

@media ( max-width : 511px) {
	#board_subTxt {
		width: 15%;
	}
}

@media ( max-width : 358px) {
	#board_subTxt {
		width: 30%;
	}
}
</style>
<body>
	<div>
		<div style="height: 20px"></div>
		<div id="board_pro"></div>
		<div id="board_user">
			<p id="board_name">������</p>
		</div>
		<div style="height: 30px"></div>
		<table id="board_content">
			<tr id="board_subject">
				<td id="board_subTxt" width="7%">
					<span>������</span>
				</td>
				<td width="93%"><input id="board_subInput"/></td>
			</tr>
			<tr>
				<td height=20px></td>
			</tr>
			<tr>
				<td width=100% colspan="2"><textarea class="form-control" rows="15" cols="100%"></textarea></td>
			</tr>
			<!-- ÷������ -->
			<tr>
				<td class="input-file" width=100% colspan="2" height=50px>
					<!-- <input type="file" class="upload"> -->
					<input type="text" readonly="readonly" class="file-name" /> 
					<label for="upload01" class="file-label board_btn">���� ���ε�</label> 
					<input type="file" name="" id="upload01" class="file-upload" />
				</td>

			</tr>
			<tr>
				<td colspan="2" class="text-right" height=30px>
					<input id="board_insertBtn" class="btn board_btn" type="button" value="���">
				</td>
			</tr>
		</table>
			
	</div>
	<div>
		
	</div>
</body>
</html>