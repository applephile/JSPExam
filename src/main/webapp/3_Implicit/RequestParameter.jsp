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
		//post의 경우 한글이 깨져서 출력됨 -> 인코딩으로 변경
		request.setCharacterEncoding("utf-8");
		
		//전송된 값이 하나일 경우 getParameter() 사용
		String id = request.getParameter("id");
		String gender = request.getParameter("gender");
		
		//전송된 값이 둘 이상일 경우 getParameterValues() 사용
		String[] hobby = request.getParameterValues("hobby");
		
		String hoStr = "";
		
		if(hobby != null) {
			for(int i=0; i<hobby.length; i++) {
				hoStr += hobby[i] + ", ";
			}
		}
		
		//textarea 내용 가져오기
		String intro = request.getParameter("intro").replace("\r\n", "<br>");
		
	%>
	
	<ul>
		<li>아이디 : <%=id %></li>
		<li>성별 : <%=gender %></li>
		<li>취미 : <%=hoStr %></li>
		<li>자기소개 : <%=intro %></li>
	</ul>
	
	
	
</body>
</html>