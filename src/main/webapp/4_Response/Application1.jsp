<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		web.xml : 웹 어플리케이션에 대한 설정을 저장하는 곳 a.k.a 배포서술자
		파일을 업로드하거나 입출력 작업 시에 많이 사용
	 -->
	 
	 <h2>web.xml에서 설정한 내용 확인</h2>
	 초기화 매개변수 : <%= application.getInitParameter("INIT_PARAM") %>
	 
	 <h2>서버의 경로 확인</h2>
	 application의 내장객체 : <%= application.getRealPath("/4_Response") %>
	 
	 <h2>선언부에서 application 내장 객체 사용</h2>
	 <%!
	 	public String useImpObj() {
		 return this.getServletContext().getRealPath("/4_Response");
	 	}
		 
	 	public String useImpObj(ServletContext app) {	
	 		return app.getRealPath("/4_Response");
	 	}
	  %>
	  
	  <p>this 사용 : <%= useImpObj() %></p>
	  <p>매개변수의 인수로 내장객체 사용 : <%= useImpObj(application) %></p>
</body>
</html>