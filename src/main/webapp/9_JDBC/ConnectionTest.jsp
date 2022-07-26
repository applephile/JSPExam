<%@page import="common.DBConnPool"%>
<%@page import="oracle.jdbc.OracleDriver"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JDBC테스트 1</h2>
	<%
		JDBConnect jdbc1 = new JDBConnect();
		jdbc1.close();
	%>
	
	<h2>JDBC테스트 2</h2>
	<%
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleUrl");
		String id = application.getInitParameter("OracleId");
		String pw = application.getInitParameter("OraclePw");
		
		JDBConnect jdbc2 = new JDBConnect(driver, url, id, pw);
		jdbc2.close();
	%>
	
	<h2>JDBC테스트 3</h2>
	<%
		JDBConnect jdbc3 = new JDBConnect(application);
		jdbc3.close();
	%>
	
	<h2>커넥션 풀 테스트</h2>
	<%
		DBConnPool pool = new DBConnPool();
		pool.close();
	%>
</body>
</html>