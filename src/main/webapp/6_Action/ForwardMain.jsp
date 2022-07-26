<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String outerPath1 = "./inc/OuterPage1.jsp";
	String outerPath2 = "./inc/OuterPage2.jsp";
	
	pageContext.setAttribute("pAttr", "커리 파엠");
	request.setAttribute("rAttr", "반지 4개");
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>액션 태그를 이용한 포워딩</h2>
	<jsp:forward page="./ForwardSub.jsp"></jsp:forward>
</body>
</html>