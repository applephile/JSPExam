<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CookieManager.makeCookie(response, "ELCookie", "EL연습", 10);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키값 읽어오기</h2>
	<li>ELCookie 값 : ${ cookie.ELCookie.value }</li>
	
	<h2>HTTP 헤더 읽어오기</h2>
	<ul>
		<li>host : ${ header.host }</li>
		<li>user-agent : ${ header['user-agent']}</li>
		<li>cookie : ${ header.cookie}</li>
	</ul>
	
	<h2>컨텍스트 초기화 매개변수 읽어오기</h2>
	<li>${ initParam.OracleDriver }</li>

	<h2>컨텍스트 루트 경로 읽어오기</h2>
	<li>${ pageContext.request.contextPath }</li>
</body>
</html>