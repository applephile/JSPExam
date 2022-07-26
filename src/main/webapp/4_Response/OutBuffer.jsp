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
		//버퍼의 내용 삭제하기
		out.print("출력");
		/* out.clearBuffer(); */ //버퍼를 비움
		
		out.print("<h2>out 내장 객체</h2>");
		
		//현제 페이지 설정된 버퍼의 크기를 가져옴
		out.print("출력 버퍼의 크기 " + out.getBufferSize() + "<br>");
		out.print("남은 버퍼의 크기 " + out.getRemaining() + "<br>");
		
		//버퍼의 저장된 내용을 강제로 출력
		out.flush();

		out.print("flush 이후 버퍼의 크기 " + out.getRemaining() + "<br>");
		
		out.print(1 + "<br>");
		out.print(true + "<br>");
		out.print("가" + "<br>");
		
		out.print("남은 버퍼의 크기 " + out.getRemaining() + "<br>");
	%>
</body>
</html>