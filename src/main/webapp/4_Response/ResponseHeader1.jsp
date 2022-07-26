<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>HTTP 헤더 설정</h2>
	<form action="./ResponseHeaderResult.jsp" method="get">
		날짜 형식 : <input type="text" name="add_date" value="2022-06-16 12:41"> <br>
		숫자 형식 : <input type="text" name="add_int" value="1234"> <br>
		문자 형식 : <input type="text" name="add_str" value="아이폰"> <br>
		<input type="submit" value="응답 헤더 설정 및 출력">
	</form>
</body>
</html>