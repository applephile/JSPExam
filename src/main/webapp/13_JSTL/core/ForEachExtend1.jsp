<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>향상된 for문 형태의 forEach 사용</h2>
	<%
		String[] rgba = {"Red", "Green", "blue", "black"};
	%>
	
	<c:forEach var="c" items="<%=rgba %>">
		<span style="color : ${c}">${c}</span>
	</c:forEach>
	
	<h2>varStatus 속성 확인</h2>
	<table border="1">
		<c:forEach var="c" items="<%=rgba %>" varStatus="loop">
			<tr>
				<td>count : ${loop.count }</td>
				<td>index : ${loop.index }</td>
				<td>current : ${loop.current }</td>
				<td>first : ${loop.first }</td>
				<td>last : ${loop.last }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>