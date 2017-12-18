<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>
.reply_btn, .reply_insert_btn {
	color: #262626;
	background: #fff;
	border: 1px solid #999;
}

.review_btn {
	float: right;
	margin-top: 4px;
}

.reviewlist {
	border-top: 1px solid #ccc;
}

.user_info .board_pro {
	margin-top: 20px;
}

.list_star img {
	width: 110px;
	float: left;
}

.review_insert {
	margin-bottom: 10px;
}

#reply_pro {
	background-image: url('../cb_Detail/image/pro.png');
	background-size: 100%;
	border-radius: 50%;
	width: 40px;
	height: 40px;
	margin: 10px auto;
}

.reply_list {
	border-top: 1px solid #ddd;
	width: 100%;
	background: rgb(247, 247, 247);
}

.reply_content {
	margin-top: 10px;
}

.reply_insert {
	width: 100%;
	border-top: 1px solid #ddd;
	background: rgb(247, 247, 247);
}

.reply_insert tr td textarea {
	resize: none;
}

.reply_btn, .reply_insert_btn {
	margin: 4px 0px;
}
.review {
	margin-bottom: 50px;
}

@media ( max-width : 570px) {
	.reply_list td:first-child, .reply_insert td:first-child {
		width: 60px;
	}
	.reply_list td:nth-child(2), .reply_insert td:nth-child(2) {
		width: 100px;
	}
	.reply_content_td, .reply_insert td:last-child {
		width: 400px;
	}
}

@media screen and (max-width: 995px) and (min-width: 569px) {
	.reply_list td:first-child, .reply_insert td:first-child {
		width: 20px;
	}
	.reply_list td:nth-child(2), .reply_insert td:nth-child(2) {
		width: 100px;
	}
	.reply_content_td, .reply_insert td:last-child {
		width: 600px;
	}
}
</style>

<script type="text/javascript">
	$(function() {
		$(".reply_wrap").hide();
		$(".reply_btn").click(function() {
				var btn_id = $(this).attr("id");
				btn_id = btn_id.split("_");
				if($(this).html() == "닫&nbsp;&nbsp;&nbsp;기") {
					$(this).html("댓&nbsp;&nbsp;&nbsp;글");
					$("#reply_" + btn_id[2]).slideUp("500");
				}
				else {
					$("#reply_" + btn_id[2]).slideDown("500");
					$(this).html("닫&nbsp;&nbsp;&nbsp;기");
				}
		});
	});
</script>

</head>
<body>
	<div class="review">
		<h2>Review</h2>
		<div class="review_insert">
			<table>
				<!-- 사용자 정보 & 리뷰 내용 -->
				<tr>
					<td width="10%" class="text-center">
						<div id="board_pro"></div>
						<div class="pro_name">
							<!-- 사용자 닉네임 -->
							USER
						</div>
					</td>
					<td width="90%"><textarea class="form-control" rows="5"
							cols="100%"></textarea></td>
					<!-- 별점 & 버튼 -->
				</tr>
				<td>
					<div class="list_star">
						<!-- 별점주기 -->
						<img src="../cb_Detail/image/rating.png">
					</div>
				</td>
				<td class="text-right">
					<div class="star_insert">
						<input type="button" class="btn review_btn"
							value="등&nbsp;&nbsp;&nbsp;&nbsp;록" />
					</div>

				</td>
				<tr>

				</tr>
			</table>

		</div>

		<!-- 리뷰 리스트 -->
		<div class="review_reply">
			<c:forEach var="i" begin="1" end="5">
				<table class="reviewlist">
					<!-- 사용자 정보 & 내용 -->
					<tr>
						<td width="10%" class="text-center user_info">
							<div id="board_pro"></div>
							<div class="pro_name">
								<!-- 사용자 닉네임 -->
								리뷰닉네임
							</div>
						</td>
						<td width="90%" class="text-left">
							<div class="review_content">
								<p>
									저 어제 여기 다녀왔는데요....<br> 사장님은 너무 친절하셨는데 알바생인지 매니저였는지 모르겠지만..<br>
									너무 불친절했어요...기분 좋게 놀러갔다가 기분 나쁜채로 나왔네요..<br> 알바생만 아니면 너무
									놀기좋은 곳입니다!!! 어제 썸남생겼네요!!! ㅎㅎ헤개꿀
								</p>
							</div>
						</td>
					</tr>

					<!-- 별점 & 댓글 버튼 -->
					<tr>
						<td width="10%" class="text-center">
							<div class="star list_star">
								<img src="../cb_Detail/image/rating.png">
								<h4>5.0</h4>
							</div>
						</td>
						<td width="90%" class="text-right"><span>
								<!-- 리뷰등록날짜 -->2017-12-15&nbsp;&nbsp;&nbsp;
						</span> <button class="btn reply_btn" id="reply_btn_${i }">댓&nbsp;&nbsp;&nbsp;글</button></td>
					</tr>
				</table>
				<!-- 대댓글 리스트 & 대댓글 등록 -->
				<div class="reply_wrap" id="reply_${i }">
					<c:forEach var="j" begin="1" end="3">
						<!-- 대댓글 리스트 -->
						<table class="reply_list">
							<!-- 사용자 정보 & 내용 -->
							<tr>
								<td widht="3%" class="reply_tab"></td>
								<td rowspan="2" width="100px"
									class="text-center user_info reply_user">
									<div id="reply_pro"></div>
									<div class="reply_name">
										<!-- 사용자 닉네임 -->
										리뷰닉네임
									</div>
								</td>
								<td width="87%" class="text-left reply_content_td">
									<div class="reply_content">
										<p>와 여기 괜찮나요? 소문은 별로라던데...!!!</p>
									</div>
								</td>
							</tr>

							<!-- 별점 & 댓글 버튼 -->
							<tr>
								<td colspan="2"></td>
								<td width="87%" class="text-right"><span>
										<!-- 리뷰등록날짜 -->2017-12-15&nbsp;&nbsp;&nbsp;
								</span> <button class="btn reply_btn">댓&nbsp;&nbsp;&nbsp;글</button></td>
							</tr>
						</table>
					</c:forEach>

					<!-- 대댓글 등록 -->
					<table class="reply_insert">
						<!-- 사용자 정보 & 내용 -->
						<tr>
							<td widht="3%" class="reply_tab"></td>
							<td rowspan="2" width="100px"
								class="text-center user_info reply_user">
								<div id="reply_pro"></div>
								<div class="reply_name">
									<!-- 사용자 닉네임 -->
									리뷰닉네임
								</div>
							</td>
							<td width="87%" class="text-left reply_content_td">
								<div class="reply_content">
									<textarea class="form-control" rows="2"></textarea>
								</div>
							</td>
						</tr>

						<!-- 별점 & 댓글 버튼 -->
						<tr>
							<td colspan="2"></td>
							<td width="87%" class="text-right"><input type="button"
								class="btn reply_insert_btn" value="등&nbsp;&nbsp;&nbsp;록" /></td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>