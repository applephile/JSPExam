<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 표현식 : 값을 웹브라우저 화면에 출력할 때 사용 -->
	
	<p> 오늘 날짜 : <%= new java.util.Date() %> </p>
	<br>
	
	<%
		int a = 10;
		int b = 20;
		int c = 30;
	%>
	
	<%= a+b+c%>
</body>
</html>