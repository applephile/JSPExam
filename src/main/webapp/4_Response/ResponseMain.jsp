<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String loginErr = request.getParameter("loginErr");
		if(loginErr != null) {
			out.println("로그인 실패");
		}
	%>
	<form method="post" action="ResponseLogin.jsp">
		아이디 : <input type="text" name="user_id"> <br>
		패스워드 : <input type="text" name="user_pw"> <br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>