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
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		if(id.equalsIgnoreCase("admin") && pw.equalsIgnoreCase("1234")) {
			response.sendRedirect("ResponseWelcome.jsp");
		} else {
			//로그인 실패 시 ResponseMain으로 전달
			//forward() : 페이지의 이동과는 다르게 제어 흐름을 넘겨주고자 할 때 사용
			//쿼리스트링을 이용하여 로그인 성공 여부 알려줌
			request.getRequestDispatcher("ResponseMain.jsp?loginErr=1").forward(request, response);
		}
	%>
</body>
</html>