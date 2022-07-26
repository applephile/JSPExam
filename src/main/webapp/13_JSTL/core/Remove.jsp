<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 변수 선언 -->
<c:set var="scopeVar" value="page영역" />    
<c:set var="scopeVar" value="request영역" scope="request"/>    
<c:set var="scopeVar" value="session영역" scope="session"/>    
<c:set var="scopeVar" value="application영역" scope="application"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>변수 값 출력</h2>
	<ul>
		<li>scopeVar : ${scopeVar }</li>
		<li>requestScope.scopeVar : ${requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar }</li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar }</li>
	</ul>	
	
	<h2>session 영역에서 삭제</h2>
	<c:remove var="scopeVar" scope="session"/>
	
	<ul>
		<li>scopeVar : ${scopeVar }</li>
		<li>requestScope.scopeVar : ${requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar }</li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar }</li>
	</ul>	
	
	<h2>scope없이 삭제</h2>
	<c:remove var="scopeVar"/>
	
	<ul>
		<li>scopeVar : ${scopeVar }</li>
		<li>requestScope.scopeVar : ${requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar }</li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar }</li>
	</ul>		
</body>
</html>








