<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<String> lists = new ArrayList();
	lists.add("리스트");
	lists.add("컬렉션");
	session.setAttribute("lists", lists);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>페이지를 이동하여 session 영역 확인</h2>
	
	<a href="SessionLocation.jsp">SessionLocation.jsp</a>
</body>
</html>