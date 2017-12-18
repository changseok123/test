<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 
	EL
	1) 데이터형
		정수형 : long
		실수형 : double
		논리형 : true/false
		문자열 : String
	2) 연산자
 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	정수 : ${10}<br>
	실수 : ${20.5}<br>
	논리 : ${true}<br>
	문자 : ${"admin"}<br>
		${'admin'}<br>
	null : ${null}
</body>
</html>