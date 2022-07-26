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
	<h2>페이지 이동 후 속성값 확인</h2>
	<%
		Object pInteger = pageContext.getAttribute("pageInteger");
		Object pString = pageContext.getAttribute("pageString");
		Object pPerson = pageContext.getAttribute("pagePerson");
	%>
	
	<ul>
		<li>Integer객체 : <%=(pInteger == null) ? "값 없음" : pInteger %></li>
		<li>String객체 : <%=(pString == null) ? "값 없음" : pString %></li>
		<li>Person객체 : <%=(pPerson == null) ? "값 없음" : ((Person)pPerson).getName()%></li>
	</ul>
</body>
</html>