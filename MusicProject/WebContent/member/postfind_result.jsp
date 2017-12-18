<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="model" class="com.sist.model.MemberModel"></jsp:useBean>
<%
	model.postAllData(request);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
function ok(zip, addr) {
	parent.frm.post1.value = zip.substring(0,3);
	parent.frm.post2.value = zip.substring(4,7);
	parent.frm.addr1.value = addr;
	parent.Shadowbox.close();
}
</script>
</head>
<body>
	<c:if test="${count==0}">
		<table class="table table-hover">
			<tr>
				<td class="text-center">
					<font color="blue">검색된 결과가 없습니다.</font>
				</td>
			</tr>
		</table>
	</c:if>
	
	<c:if test="${count!=0}">
		<table class="table table-hover">
			<tr class="success">
				<th width=20% class="text-center">우편번호</th>
				<th width=80% class="text-center">주소</th>
			</tr>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td width=20% class="text-center">${vo.zipcode}</td>
					<td width=80% class="text-left"><a href="javascript:ok('${vo.zipcode}','${vo.address}')">${vo.address}</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>