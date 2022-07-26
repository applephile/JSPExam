<%@page import="javax.sound.sampled.AudioFormat.Encoding"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>입력 성공!</h2>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
	%>
	
	<p>아이디 : <%=id %></p>
	<p>패스워드 : <%=passwd %></p>
</body>
</html>