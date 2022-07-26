<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>web.xml에서 매핑하여 JSP에 출력</h2>
	<p><%= request.getAttribute("message") %></p>
	<a href="./HelloServlet.naver">바로가기</a>
</body>
</html>