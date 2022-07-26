<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 변수 선언 -->
	<c:set var="number" value="100" />
	<c:set var="string" value="ABC" />
	
	<h2>if태그로 홀/짝 구분</h2>
	<c:if  test="${number mod 2 eq 0 }" var="result" >
		${ number } 는 짝수입니다. <br/>
	</c:if>	
	<c:if test="${ not result }" >
		${number } 는 홀수입니다. <br/>
	</c:if>
	
	result : ${result }
	
	<h2>문자열 비교</h2>
	<!-- 
		string에 입력된 내용이 'ABC'면 '문자열은 ABC입니다.' 출력
		아닐 경우 'ABC가 아닙니다.' 출력
	 -->	
	 
	 <c:if test="${string eq 'ABC' }" var="result2">
	 	문자열은 ${string }입니다. <br/>
	 </c:if>
	 <c:if test="${not  result2}">
	 	ABC가 아닙니다. <br/>
	 </c:if>
	
	<h2>조건식 주의사항</h2>
	<c:if test="100" var="result3">
		EL이 아닌 일반값이 오면 무조건 false 반환
	</c:if>
	
	result3 : ${result3 } <br/>
	
	<c:if test="true" var="result4">
		대소문자 구분 없이 "true"인 경우엔 무조건 true 반환
	</c:if>
	result4 : ${result4 } <br/>
	
	<c:if test=" ${ true } " var="result5">
		true 안 나옴
	</c:if>
	result5 : ${result5 } <br/>
</body>
</html>



