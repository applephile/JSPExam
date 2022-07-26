<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>영역을 통해서 전달된 객체 읽기</h2>
	
	<%-- <%
		Object object = request.getAttribute("personObj");
		Person person = (Person)object;
		
		out.println("이름 : " + person.getName());
		out.println("나이 : " + person.getAge());
	%> --%>
	
	<ul>
		<li>Person 객체 : 이름 - ${personObj.name }, 나이 - ${personObj.age }</li>
		<li>String 객체 : ${ requestScope.stringObj }</li>
		<li>Integer 객체 : ${ requestScope.integerObj }</li>
	</ul>
	
	<h2>매개변수로 전달된 값</h2>
	<ul>
		<li>${ param.firstNum + param['secondNum'] }</li>
		<li>${ param.firstNum } + ${ param['secondNum'] }</li>
	</ul>
</body>
</html>