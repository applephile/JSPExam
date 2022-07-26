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
	%>
	
	<p>아이디 : <%=request.getParameter("id") %></p>
	<p>패스워드 : <%=request.getParameter("passwd") %></p>
	<p>이름 : <%=request.getParameter("name") %></p>
	<p>연락처 : <%=request.getParameter("phone1") %>-<%=request.getParameter("phone2") %>-<%=request.getParameter("phone3") %></p>
	<p>이메일 : <%=request.getParameter("email") %></p>
</body>
</html>