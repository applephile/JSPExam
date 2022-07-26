<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>포워드로 전달된 페이지</h2>
	<p>RequestMain의 속성 읽어오기</p>
	
	<%
		Person pPerson = (Person)(request.getAttribute("requestPerson"));
	%>
	
	<ul>
		<li>String객체 : <%=request.getAttribute("reqeustString") %></li>
		<li>Person객체 : <%=pPerson.getName()%>, <%=pPerson.getAge() %></li>
	</ul>
	
	<h3>매개변수 값 전달</h3>
	<%
		request.setCharacterEncoding("utf-8");
		out.println(request.getParameter("paramHam"));
		out.println(request.getParameter("paramEng"));
	%>
</body>
</html>