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
	<h2>일반 for문 형태의 ForEach 사용</h2>
	<c:forEach begin="1" end="3" var="i">
		<p>일반 For문 ${i}번 째입니다.</p>
	</c:forEach>
	
	<h2>varStatus 속성 확인</h2>
	<table border="1">
		<c:forEach var="i" begin="3" end="5" varStatus="loop">
			<tr>
				<td>count : ${loop.count }</td>
				<td>index : ${loop.index }</td>
				<td>current : ${loop.current }</td>
				<td>first : ${loop.first }</td>
				<td>last : ${loop.last }</td>
			</tr>
		</c:forEach>
	</table>
	
	<h2>1에서 100까지의 정수 중 홀수의 합계 구하기</h2>
	<c:forEach var="j" begin="1" end="100">
		<c:if test="${j mod 2 ne 0}">
			<c:set var="sum" value="${sum + j}"/>
		</c:if>			
	</c:forEach>
	${sum}
</body>
</html>