<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
��������� + - * /(div) %(mod)
	${10+10} 20
	*****${null+10} 10 (null=>0)
	*****${"10"+20} 30 (java:1020) ("10"=>10)
	*****${"10"+=20} 1020
	${" 10"+100} error
	${5 / 2} 2.5
	${5 div 2} 2.5
	${5 % 2} 1
	${5 mod 2}  1
�������� && ||
	${5<6 && 5==6} false
	${5<6 || 5==6} true
�񱳿����� == != < > <= >=
	${7==8} ${7eq8}
	${"abc"=="abc"}
	!= ne
	< lt
	> gt
	<= le
	>= ge
���׿�����	
	${sex==1 ? "����":"����"}
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