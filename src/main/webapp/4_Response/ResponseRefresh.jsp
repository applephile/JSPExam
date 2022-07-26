<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>5초에 한 번씩 새로고침</p>
	
	<%
		response.setIntHeader("Refresh", 5);
	%>
	
	<%= (new java.util.Date()) %>
</body>
</html>