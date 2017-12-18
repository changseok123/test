<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
산술연산자 + - * /(div) %(mod)
	${10+10} 20
	*****${null+10} 10 (null=>0)
	*****${"10"+20} 30 (java:1020) ("10"=>10)
	*****${"10"+=20} 1020
	${" 10"+100} error
	${5 / 2} 2.5
	${5 div 2} 2.5
	${5 % 2} 1
	${5 mod 2}  1
논리연산자 && ||
	${5<6 && 5==6} false
	${5<6 || 5==6} true
비교연산자 == != < > <= >=
	${7==8} ${7eq8}
	${"abc"=="abc"}
	!= ne
	< lt
	> gt
	<= le
	>= ge
삼항연산자	
	${sex==1 ? "남자":"여자"}
 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>