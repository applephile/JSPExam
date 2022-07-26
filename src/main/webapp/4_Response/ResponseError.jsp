<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>응답 관련 메서드</h2>
	
	<%
		response.sendError(500, "오류입니다.");
	%>
</body>
</html>