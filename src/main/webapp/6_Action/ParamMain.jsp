<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pValue = "즐거운 금요일";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="common.Person" scope="request"></jsp:useBean>
	<jsp:setProperty property="name" name="person" value="김그린"/>
	<jsp:setProperty property="age" name="person" value="20"/>
	<jsp:forward page="ParamForward.jsp?param1=정자바">
		<jsp:param value="아이폰" name="param2"/>
		<jsp:param value="<%=pValue %>" name="param3"/>
	</jsp:forward>
	
</body>
</html>