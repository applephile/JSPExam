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
	<c:set var="number" value="100"/>
	
	<h2>choose를 이용하여 홀/짝 구분</h2>
	
	<c:choose>
		<c:when test="${number mod 2 eq 0 }">
			${ number }는 짝수입니다.
		</c:when>
		<c:otherwise>
			${ number }는 홀수입니다.
		</c:otherwise>
	</c:choose>
	
	<h2>국, 영, 수 점수 입력 시 평균을 이용하여 학점 계산</h2>
	<form>
		국어 : <input type="text" name="kor"> <br/>
		영어 : <input type="text" name="eng"> <br/>
		수학 : <input type="text" name="math"> <br/>
		<input type="submit" value="학점구하기"> <br/>
	</form>
	
	<!-- 모든 과목 점수 입력 유무 확인 -->
	<c:if test="${not(empty param.kor or empty param.eng or empty param.math)}">
	<!-- 평균 계산 (평균 점수 : __점) 출력 -->
	<c:set var="avg" value="${(param.kor + param.eng + param.math) / 3 }" />
	평균은 ${ avg }점으로
	<!-- 평균 이용 학점 도출
		평균 90이상 - A
		평균 80이상 - B
		평균 70이상 - C
		평균 60이상 - D
		나머지 F -->
	<c:choose>
		<c:when test="${avg ge 90}">A학점</c:when>
		<c:when test="${avg ge 80}">B학점</c:when>
		<c:when test="${avg ge 70}">C학점</c:when>
		<c:when test="${avg ge 80}">D학점</c:when>
		<c:otherwise>F학점</c:otherwise>
	</c:choose>	
	입니다.
	<!-- 출력 결과
		평균은 __점으로 _학점입니다.
	 -->
	</c:if>	 
</body>
</html>