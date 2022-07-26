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
	<c:set var="requestVar" value="green" scope="request"/>
	
	<c:redirect url="../inc/OtherPage.jsp">
		<c:param name="user_param1" value="그린컴퓨터아카데미"/>
		<c:param name="user_param2" value="정산기"/>
	</c:redirect>
</body>
</html>