<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>한 번의 매핑으로 여러 가지 요청 처리</h2>
	
	${ resultValue }
	
	<ul>
		<li>URI : ${uri }</li>
		<li>요청명 : ${commandStr }</li>
	</ul>	
	
	<hr>
	
	<ul>
		<li><a href="../15_Servlet/regist.one">회원가입</a></li>
		<li><a href="../15_Servlet/login.one">로그인</a></li>
		<li><a href="../15_Servlet/board.one">게시판</a></li>
	</ul>
</body>
</html>