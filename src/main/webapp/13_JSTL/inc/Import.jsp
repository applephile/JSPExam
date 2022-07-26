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
	<c:set var="requestVar" value="google" scope="request"/>
	<c:import url="/13_JSTL/inc/OtherPage.jsp" >
		<c:param name="user_param1" value="google"/>
		<c:param name="user_param2" value="구글"/>
	</c:import>
	
	<h3>다른 문서 삽입</h3>
	${contents }
	
	<h3>외부 문서 삽입</h3>
	<iframe src="../inc/GooglePage.jsp" style="width:100%; height:600px;"></iframe>
</body>
</html>