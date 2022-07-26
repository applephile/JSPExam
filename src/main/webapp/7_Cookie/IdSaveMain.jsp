<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<
<%
	String loginId = CookieManager.readCookie(request, "loginId");

	String cookieCheck = "";
	if(!loginId.equals("")) {
		cookieCheck="checked";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../Resourse/css/styles.css" rel="stylesheet">

<style>
	.login {
		text-align : center;
		padding : 70px 0;
	}
	.login>p {
		margin-bottom : 20px;
	}
</style>
</head>
<body>
	<%@ include file="./Header.jsp" %>
	<div class="login">
		<form action="IdSaveProcess.jsp" method="post">
			<p>아이디 : <input type="text" name="user_id" value="<%= loginId%>"></p>
			<p>패스워드 : <input type="text" name="user_pw"></p>
			<p><input type="checkbox" name="save_check" value="Y" <%= cookieCheck %>>아이디 저장하기</p>
			<input type="submit" value="로그인">
		</form>
	</div>
</body>
</html>