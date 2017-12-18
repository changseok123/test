<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
	#board_pro{
		background-image: url('../image/pro.png');
		background-size: 100%;
		border-radius: 50%;
		width: 80px;
		height: 80px;
		float:left;
	}
	#board_user{
		width: 200px;
		height: 80px;
		margin-left: 100px;
		padding-top: 8px;
	}
	#board_user p{
		margin: 0;
	}
	#board_name{
		font-size: 18px;
		font-weight: bold;
		padding-bottom: 5px;
	}
	#board_subject{
		height: 40px;
		border-bottom: 2px solid #bbb;
	}
	#board_subject p{
		/* line-height: 40px; */
		font-size: 17px;
		font-weight: bold;
	}
	#board_content {
		
	}
	#board_content p{
		font-size: 17px;
	}
	.board_reviewPro img{
		background-image: url('../image/pro.png');
		background-size: 100%;
		border-radius: 50%;
		width: 60px;
		height: 60px;
		float:left;
	}
	.board_reviewPro span{
		line-height: 60px;
	}
	#board_cotentBtn{
		margin-top: 30px;
		height: 40px;
		width:100%;
		text-align: right;
	}
	.board_cotentBtn{
		/* float:right; */
		width: 50px;
		font-size: 15px;
	}

	
	
	/* 리뷰 */
	.review_wrap {
	   margin-top: 70px;
	}
	.review h2 {
	   font-weight: bold;
	   border-bottom: 2px solid #bbb;
	}
	.review_insert {
	   width:100%;
	   height:150px;
	}
	#board_reviewPro {
	    background-image: url('../image/pro.png');
	    background-size: 100%;
	    border-radius: 50%;
	    width: 70px;
	    height: 70px;
	    margin:0px auto;
	}
	.pro_name {
	    margin-top: 13px;
	}
	.profile {
	    line-height: 100px;
	}
	
	.review_btn {
	   height:118px;
	   width:100%;
	}
	.review_insert table {
	   width:100%;
	   height:150px;
	}
	.review_insert table textarea {
	   resize: none;
	}
</style>
<body>
	<div class="content_wrap">
		<div style="height: 20px"></div>
		<div id="board_pro"></div>
		<div id="board_user">
			<p id="board_name">배주현</p>
			<p id="board_regdate">2017-12-13</p>
			<p id="board_hit">조회수 50</p>
		</div>
		<div style="height: 30px"></div>
		<div id="board_subject">
			<p>저는 집에 가고 싶어요~</p>
		</div>
		<div style="height: 20px"></div>
		<div id="board_content">
			<p>저는 오늘 칼퇴를 할 것이에요<br>
			여러분들 생각은 어때요?<br>
			좋아요?<br>
			저도 좋아요~~~~<br>
			</p>
		</div>
		<div id="board_cotentBtn">
			<input id="board_updateBtn" class="btn board_btn board_cotentBtn" type="button" value="수정">
			<input class="btn board_btn board_cotentBtn" type="button" value="삭제">
			<input class="btn board_btn board_cotentBtn" type="button" value="목록">
		</div>
	</div>
	<!-- 리뷰 -->
	<div class="review_wrap">
		<div class="review">
			<h2>Review</h2>
			<div class="review_insert">
				<!-- <div class="profile">
                     <div id="board_pro"></div>
                     <div class="pro_name">사용자 닉네임USER</div>
                  </div>
                  <div id="board_pro"></div>
                  <div class="review_input">
                     <textarea rows="7" cols="140"></textarea>
                     <input type="button" class="btn" value="등록"/>
                  </div> -->
				<table>
					<tr>
						<td width="10%" class="text-center">
							<div id="board_reviewPro"></div>
							<div class="pro_name">
								<!-- 사용자 닉네임 -->
								USER
							</div>
						</td>
						<td width="80%"><textarea class="form-control" rows="5"
								cols="100%"></textarea></td>
						<td width="10%"><input type="button" class="btn review_btn"
							value="등  록" /></td>
					</tr>
				</table>

			</div>
<!-- 			<c:forEach var="i" begin="1" end="5">
				<table>
					<tr>
						<td width="10%" class="text-center">
							<div id="board_pro"></div>
							<div class="pro_name">
								사용자 닉네임
								USER
							</div>
						</td>
						<td width="80%">
							<div class="review_content"></div>
						</td>
						<td width="10%"><input type="button" class="btn review_btn"
							value="등  록" /></td>
					</tr>
				</table>
			</c:forEach> -->
		</div>
	</div>
</body>
</html>