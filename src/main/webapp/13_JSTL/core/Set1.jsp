<%@page import="common.Person"%>
<%@page import="java.util.Date"%>
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

	<!-- 변수 선언 -->
	<c:set var = "directVar" value="100"/> <!-- 값 직접 입력 -->
	<c:set var = "elVar" value="${directVar mod 5 }"/> <!-- EL 사용 -->
	<c:set var = "expVar" value="<%= new Date()%>"/> <!-- 표현식 사용 -->
	<c:set var = "betweenVar">변수값 지정</c:set> <!-- 태그 사이에 값 지정 -->
	
	<h2>EL 이용하여 변수 값 출력</h2>
	<ul>
		<li> directVar : ${pageScope.directVar }</li>
		<li> elVar : ${elVar }</li>
		<li> expVar : ${expVar }</li>
		<li> betweenVar : ${betweenVar }</li>
	</ul>
	
	<h3>자바빈즈 생성 1 - 생성자 사용</h3>
	<c:set var="personVar1" value='<%=new Person("김그린", 22) %>' scope="request"/>
	
	<ul>
		<li> 이름 : ${ requestScope.personVar1.name }</li>
		<li> 나이 : ${ personVar1.age }</li>
	</ul>	
	
	<h3>자바빈즈 생성 2 - target, property 사용</h3>
	<c:set var="personVar2" value="<%=new Person() %>" scope="request"/>
	<c:set target="${personVar2 }" property="name" value="정자바"/>
	<c:set target="${personVar2 }" property="age" value="33"/>
	
	<ul>
		<li> 이름 : ${ requestScope.personVar2.name }</li>
		<li> 나이 : ${ personVar2.age }</li>
	</ul>
	
</body>
</html>