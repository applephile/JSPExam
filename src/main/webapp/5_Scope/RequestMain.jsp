<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("requestString", "request 영역의 문자열");
	request.setAttribute("requestPerson", new Person("김그린", 30));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>request 영역의 속성값 삭제</h2>
	<%
		request.removeAttribute("requestString");
		request.removeAttribute("requestInteger");
	%>	
	
	<h2>request 영역의 속성값 읽어오기</h2>
	<%
		Person rPerson = (Person)request.getAttribute("requestPerson");
	%>
	
	<ul>
		<li>String객체 : <%=request.getAttribute("reqeustString") %></li>
		<li>Person객체 : <%=rPerson.getName()%>, <%=rPerson.getAge() %></li>
	</ul>
	
	<h2>포워드된 페이지에서 request 영역의 속성값 읽어오기</h2>
	<!--
		forward란 현재 페이지로 들어온 요청을 다음 페이지로 보내는 기능 
		request.getRequestDispatcher("포워드할 경로").forward(request, response);
		
		forward 방식의 특징
			: 웹 브라우저에는 최초의 url만 표시되고 이동한 페이지의 url은 볼 수 없음
			: 현재 실행중인 페이지와 forward로 호출되는 페이지는 request와 response 객체를 공유
		redirect 방식의 특징
			: 웹 브라우저는 url을 지시된 주소로 변경하고 이동		 
	-->
	<%
		request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English").forward(request, response);
	%>
	
</body>
</html>









