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
	<c:url value="../inc/OtherPage.jsp" var="url">
		<c:param name="user_param1" value="그린컴퓨터아카데미"/>
		<c:param name="user_param2" value="정산기"/>
	</c:url>
	
	<a href="${url }">OtherPage.jsp 바로가기</a>
</body>
</html>