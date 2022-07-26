<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 오류 발생 해결 방법 
		1. 예외 처리
		2. 에러 페이지를 생성
	 -->
	<%-- <% 
		/* 1. 예외 처리 */
		try{
			int myAge = Integer.parseInt(request.getParameter("age")) + 10;
			out.println("10년 후 당신의 나이는 " + myAge + "입니다.");
		} catch(Exception e) {
			out.println("예외 발생 : 매개변수 age를 찾을 수 없음");
		}
		
	%> --%>
	
	<!-- 2. 오류 페이지 작성 -->
	<% 
		int myAge = Integer.parseInt(request.getParameter("age")) + 10;
		out.println("10년 후 당신의 나이는 " + myAge + "입니다.");
	%>
</body>
</html>