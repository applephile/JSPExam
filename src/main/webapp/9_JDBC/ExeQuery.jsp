<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	<h2>회원 목록 조회</h2>
	<%
		//1. DB연결
		JDBConnect jdbc = new JDBConnect();
	
		//2. 쿼리문 생성
		String sql = "SELECT id, pass, name, regidate FROM member";
		
		Statement stmt = jdbc.con.createStatement();
		
		//3. 쿼리 실행
		//ResultSet : 조회 결과를 담고 있는 집합
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString("name");
			java.sql.Date regidate = rs.getDate("regidate");
			
			out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br>"); 
		}
		
		//연결 해제
		jdbc.close();
		
		
	%>
</body>
</html>