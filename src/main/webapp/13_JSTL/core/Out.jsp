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
	<c:set var="iTag">
		i 태그는 <i>기울임</i>을 표현함
	</c:set>
	
	<c:out value="${iTag}" escapeXml="false"/>
	<c:out value="" default="공백"/>
</body>
</html>