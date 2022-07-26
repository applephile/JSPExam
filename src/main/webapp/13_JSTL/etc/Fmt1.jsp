<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>숫자 포맷</h2>
	<c:set var="number1" value="12345"/>
	
	<fmt:formatNumber value="${number1 }" type="percent" var="printNum1"/>
	${printNum1 }		
	
	<h2>문자열을 숫자로 변경</h2>
	<c:set var="number2" value="6,789.05"/>
	
	<fmt:parseNumber value="${number2 }" integerOnly="true" />
</body>
</html>




