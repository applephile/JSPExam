<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
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
	
	<h2>List 컬렉션 사용</h2>
	<%
		ArrayList<Person> pList = new ArrayList<Person>();
		
		pList.add(new Person("김그린", 11));
		pList.add(new Person("이자바", 33));
	%>
	
	<c:set var="personList" value="<%=pList %>" scope="request"/>
	
	<ul>
		<li> 이름 : ${ requestScope.personList[0].name}</li>
		<li> 나이 : ${ personList[0].age}</li>
		
		<li> 이름 : ${ requestScope.personList[1].name}</li>
		<li> 나이 : ${ personList[1].age}</li>
	</ul>
	
	<h2>Map 켈렉션 사용</h2>
	<%
		Map<String, Person> pMap = new HashMap<String, Person>();
	
		pMap.put("personArgs1", new Person("최제이", 33));
		pMap.put("personArgs2", new Person("스프링", 41));
	%>
	
	<c:set var="personMap" value="<%=pMap %>" scope="request"/>
	
	<ul>
		<li> 이름 : ${ requestScope.personMap.personArgs1.name}</li>
		<li> 나이 : ${ personMap.personArgs1.age}</li>
	</ul>
</body>
</html>







