<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>useBean 액션태그 사용하기</h2>
	
	<h3>자바빈즈 생성</h3>
	<jsp:useBean id="person" class="common.Person" scope="request"></jsp:useBean>
	
	<h3>자바빈즈 속성값 지정</h3>
	<jsp:setProperty property="name" name="person" value="김그린"/>
	<jsp:setProperty property="age" name="person" value="22"/>
	
	<h3>자바빈즈 속성값 읽어오기</h3>
	<ul>
		<li>이름 : <jsp:getProperty property="name" name="person"/></li>
		<li>나이 : <jsp:getProperty property="age" name="person"/></li>
	</ul>
	
</body>
</html>
