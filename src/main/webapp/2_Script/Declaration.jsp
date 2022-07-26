<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 선언부 : 변수나 메서드를 선언하는 태그 -->
	<%! 
		int sum(int a, int b) {
			return a+b;
		}
	%>
	
	<!-- 스크립틀릿 : JSP 페이지가 요청 받을 때 실행되어야 할 자바 코드 작성 -->
	<%
		out.println("2 + 3 = " + sum(2, 3));
	%>
</body>
</html>