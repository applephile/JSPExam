<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//헤더에 추가할 내용 설정
	//yyyy-mm-dd 형식으로 전송된 파라미터 값을 long타입으로 변경하여 저장
	//이러한 값을 타임스탬프라고 표현(1970-01-01 0시 0분0초부터 현재까지의 시간을 밀리초로 환산한 값)
	SimpleDateFormat s = new SimpleDateFormat("yyyy-mm-dd");
	long add_date = s.parse(request.getParameter("add_date")).getTime();
	
	//폼값으로 전송되는 값은 모두 String타입이므로
	//정수로 변환함
	int add_int = Integer.parseInt(request.getParameter("add_int"));
	
	String add_str = request.getParameter("add_str");
	
	//응답 헤더에 값 추가 
	response.addDateHeader("MyBirthday", add_date);			
	response.addIntHeader("MyNumber", add_int);			
	response.setIntHeader("MyNumber", 1111);
	response.addHeader("MyName", add_str);
	response.setHeader("MyName", "김그린");
%>    

<!-- 
	add_() 메서드 : 새로운 헤더명으로 값을 추가. 동일한 헤더명이 있으면 동일한 이름으로 값을 추가
	set_() 메서드 : 기존의 헤더값을 수정. 동일한 헤더명이 없으면 새로 추가
 -->    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>응답 헤더 정보 출력</h2>
	
	<%
		Collection<String> headerNames = response.getHeaderNames();
	
		for(String hName:headerNames) {
			String hValue = response.getHeader(hName);
	%>			
			<p>
				<%= hName %> : <%= hValue %>
			</p>
	<%
		}
	%>
	
	<h2>myNumber 확인</h2>
	
	<%
		Collection<String> myNumber = response.getHeaders("myNumber");
	
		for(String myNum:myNumber) {
	%>			
			<p>
				<%= myNumber %> : <%= myNum %>
			</p>
	<%
		}
	%>
</body>
</html>
