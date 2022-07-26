<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="common.Person" scope="request"></jsp:useBean>
	<h2>포워드된 페이지에서 매개변수 확인</h2>
	<ul>
		<li>이름 : <jsp:getProperty property="name" name="person"/> </li>
		<li>나이 : <jsp:getProperty property="age" name="person"/> </li>
		<li><%=request.getParameter("param1") %></li>
		<li><%=request.getParameter("param2") %></li>
		<li><%=request.getParameter("param3") %></li>
	</ul>
	
	<jsp:include page="inc/ParamInclude.jsp">
		<jsp:param value="골스우승" name="str1"/>
		<jsp:param value="커리파엠" name="str2"/>
	</jsp:include>
</body>
</html>