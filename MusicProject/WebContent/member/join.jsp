<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../member/shadow/css/shadowbox.css">
<script type="text/javascript" src="../member/shadow/js/shadowbox.js"></script>
<style type="text/css">
.qnarow{
  margin: 0px auto;
  width: 600px;
}
.qna-th,.qna-td{
  font-family: 맑은 고딕;
  font-size: 10pt;
}
</style>
<script type="text/javascript">
Shadowbox.init({
	players:["iframe"]
});
$(function(){
	$('#idcheck').click(function(){
		Shadowbox.open({
			content:'../member/idcheck.jsp',
			player:'iframe',
			title:'아이디중복체크',
			width:330,
			height:250
		});
	});
	$('#postBtn').click(function(){
		Shadowbox.open({
			content:'../member/postfind.jsp',
			player:'iframe',
			title:'우편번호검색',
			width:470,
			height:350
		});
	});
});
</script>
</head>
<body>
  <div class="container">
   <div class="row qnarow">
    <div style="height:70px"></div>
    <h3>회원가입</h3>
    <form method="post" action="../member/join_ok.jsp" name=frm>
    <table class="table table-hover">
     <tr>
      <td width=20% class="text-right qna-td">아이디</td>
      <td width=80% class="text-left qna-td">
       <input type=text name=id size=12 required readonly>
       <input type=button value="중복체크" class="btn btn-sm btn-primary" id="idcheck">
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td">비밀번호</td>
      <td width=80% class="text-left qna-td">
       <input type=password name=pwd size=12 required>
       &nbsp;재입력 <input type=password name=pwd1 size=12 required>
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td">이름</td>
      <td width=80% class="text-left qna-td">
       <input type=text name=name size=12 required>
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td">성별</td>
      <td width=80% class="text-left qna-td">
       <input type=radio name=sex value="남자" checked>남자
       <input type=radio name=sex value="여자">여자
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td">생년월일</td>
      <td width=80% class="text-left qna-td">
       <input type=date name="birthday" size=30>
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td">이메일</td>
      <td width=80% class="text-left qna-td">
       <input type="email" name="email" size=50>
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td">우편번호</td>
      <td width=80% class="text-left qna-td">
       <input type="text" name="post1" size=5 readonly>-
       <input type="text" name="post2" size=5 readonly>
       <input type=button value="우편번호검색" class="btn btn-sm btn-primary" id="postBtn">
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td">주소</td>
      <td width=80% class="text-left qna-td">
       <input type="text" name="addr1" size=50 readonly>
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td">상세주소</td>
      <td width=80% class="text-left qna-td">
       <input type="text" name="addr2" size=50>
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td">전화번호</td>
      <td width=80% class="text-left qna-td">
       <select name=tel1>
        <option>010</option>
        <option>011</option>
        <option>017</option>
       </select>
       <input type=text name=tel2 size=7>-
       <input type=text name=tel3 size=7>
      </td>
     </tr>
     <tr>
      <td width=20% class="text-right qna-td">소개</td>
      <td width=80% class="text-left qna-td">
       <textarea rows="5" cols="55" name="content"></textarea>
      </td>
     </tr>
     <tr>
      <td colspan="2" class="text-center qna-td">
       <input type=submit value="가입" class="btn btn-sm btn-primary">
       <input type=button value="취소" class="btn btn-sm btn-primary">
      </td>
     </tr>
    </table>
    </form>
   </div>
  </div>
</body>
</html>




