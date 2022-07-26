<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.println("금일 날짜, 시간 <br>");
		
		// java.util.Calendar : 날짜, 시간을 처리하기 위해서 import를 하지 않고 사용
		//.getInstance() : 시스템의 날짜와 시간을 가지고 온다
		//.getTime() : 현재의 날짜와 시간을 Date 객체로 변환
		out.println(java.util.Calendar.getInstance().getTime());
		
	%>
</body>
</html>