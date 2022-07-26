<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//날짜를 지정된 시간의 형식으로 표시
	SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
	
	//최초 요청 시각
	long creationTime = session.getCreationTime();
	String creationTimeStr = dateFormat.format(new Date(creationTime));
	
	//최종 요청 시각
	long lastTime = session.getLastAccessedTime();
	String lastTimeStr = dateFormat.format(new Date(lastTime));
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션 설정 확인</h2>
	<ul>
		<li>세션 유지 시간 : <%= session.getMaxInactiveInterval()%></li>
		<li>세션 아이디 : <%= session.getId()%></li>
		<li>최초 요청 시각 : <%= creationTimeStr %></li>
		<li>최종 요청 시각: <%= lastTimeStr %></li>
	</ul>
</body>
</html>