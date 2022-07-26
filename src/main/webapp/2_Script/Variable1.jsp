<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 선언부 -->
	<%!
		int a = 2; //전역변수
	%>
	
	<!-- 스크립틀릿 -->
	<%
		int b = 3; //지역변수 -> 스크립틀릿을 불러올 때마다 새롭게 선언된다
		out.println("a = " + a++);
		out.println("b = " + b++);
	%>
</body>
</html>