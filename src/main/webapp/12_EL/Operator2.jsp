<%-- <%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	pageContext.setAttribute("num1", 9);
	pageContext.setAttribute("num2", "10");
	
	pageContext.setAttribute("nullStr", null);
	pageContext.setAttribute("emptyStr", "");
	pageContext.setAttribute("lengthZero", new Integer[0]);
	pageContext.setAttribute("sizeZero", new ArrayList());
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>empty 연산자</h2>
	
	<!-- empty 연산자 : 값이 없을 때 true 반환하는 연산자 
		null / 빈문자열 / 길이가 0인 배열 / size 0인 컬렉션 -->
	nullStr : ${empty nullStr } <br>
	emptyStr : ${empty emptyStr } <br>
	lengthZero : ${empty lengthZero } <br>
	sizeZero : ${empty sizeZero } <br>
	
	<h2>삼항연산자</h2>
	num1이 num2보다 큰가 -> ${num1 gt num2 ? "크다" : "작다"}
	
	<h2>null 연산</h2>
	<!-- null은 모두 0으로 처리 -->
	null + 10 : ${null + 10 } <br>
	nullStr + 10 : ${nullStr + 10 } <br>
</body>
</html> --%>