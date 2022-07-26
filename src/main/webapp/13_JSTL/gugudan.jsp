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
	<h2>구구단</h2>
	
	<!-- 1. 스크립틀릿과 표현식으로 구현하기 -->
	<table border="1">
		<% for(int i=2; i<=9; i++){ %>
			<tr>
				<% for(int j=1; j<=9; j++) { %>
				<td>
					<%= i %> * <%= j %> = <%= (i*j) %>
				</td>
				<% } %>
			</tr>
		<% } %> 
	</table>
	
	<!-- 2. 스크립틀릿으로만 구현하기 -->
	<%
		out.print("<table border='1'>");
		for(int i=2; i<=9; i++) {
			out.print("<tr>");
			for(int j=1; j<=9; j++) {
				out.print("<td>");
				out.print(i + " * " + j + " = " + i * j);
				out.print("</td>");
			}
			out.print("</tr>");
		}
		out.print("</table>");
	%>
	
	<hr>
	
	<!-- 3. jstl로 구현하기 -->
	<table border="1">
		<c:forEach var="i" begin="2" end="9">
			<tr>
				<c:forEach var="j" begin="1" end="9">
					<td>${ i } * ${ j } = ${ i * j }</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>