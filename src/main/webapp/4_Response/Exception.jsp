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
		//response 내장객체로부터 에러 코드 확인
		int err = response.getStatus();
		
		if(err == 404) {
			out.println("404 에러 발생 <br>");
			out.println("파일의 경로 확인 요망");
		} else if(err == 405) {
			out.println("405 에러 발생 <br>");
			out.println("전송 방식 확인 요망");
		}  else if(err == 500) {
			out.println("500 에러 발생 <br>");
			out.println("코드에 오류 유무 확인 요망");
		}
	%>
</body>
</html>