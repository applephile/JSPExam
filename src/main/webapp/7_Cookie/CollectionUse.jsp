<%@page import="common.Person"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>List 컬렉션</h2>
	<%
		List<Object> aList = new ArrayList<Object>();
		aList.add("김그린"); //string 타입		
		aList.add(new Person("박자바", 22)); //Person 객체 저장
		pageContext.setAttribute("Ocean", aList);
	%>
	
	<ul>
		<li>0번째 요소 : ${ Ocean[0] }</li>
		<li>1번째 요소 : ${ Ocean[1].name }, ${ Ocean[1].age }</li>
		<li>2번재 요소 : ${ 	Ocean[2] }</li>
	</ul>
	
	<h2>Map 컬렉션</h2>
	<%
		Map<String, String> map = new HashMap<String, String>();
		map.put("한글", "가나다");
		map.put("Eng", "ABC");
		pageContext.setAttribute("text", map);
	%>
	
	<ul>
		<li>영어 : ${ text["Eng"] }, ${ text['Eng'] }, ${ text.Eng }</li>
		<li>한글 : ${ text["한글"] }, ${ text['한글'] }, \${ text.한글 }</li>
	</ul>
</body>
</html>