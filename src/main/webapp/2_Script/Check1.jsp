<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	/* 선언부 - 메서드 선언 */
	public int add(int num1, int num2) {
		return num1 + num2;
	}
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		/* 스크립틀릿 - 자바코드 작성 */
		int result = add(10, 20);
	%>
	
	add 결과1 : <%= result %> <br> <!-- 표현식 - 변수 -->
	add 결과2 : <%= add(30, 40) %> <!-- 표현식 - 메서드 호출 -->
	
	<!-- 		
		선언부 : 멤버 변수, 메서드 생성 시 사용하는 영역
				_jspService 메서드 바깥에 생성
				선언부에 생성한 변수는 전역변수
				
		스크립틀릿 : 선언부에서 선언한 메서드를 호출하거나 자바코드를 작성하는 영역
					_jspService 메서드 내부에 생성
					스크립틀릿 안에 메서드 생성 불가능 -> _jspService 메서드 내부에 또 다른 메서드를 생성할 수 없기 때문
					스크립틀릿 안에서 생성한 변수는 지역변수
					
		표현식 : 변수의 값을 출력하고자 할 때 사용
				표현식 구문 전체가 서블릿에서 out.print의 값으로 들어가므로 세미콜론 사용 불가능
	 -->			
		
</body>
</html>