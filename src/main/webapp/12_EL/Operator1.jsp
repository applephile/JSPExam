<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num1 = 3;
	pageContext.setAttribute("num2", 4);
	pageContext.setAttribute("num3", "5");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>변수선언 및 할당</h3>
	스트립틀릿에서 선언한 변수 : ${num1 } <br/>
	page영역에 저장된 변수 : ${num2 } <br/>
	변수를 할당하고 값을 즉시 출력 : ${num1 = 7 } <br/>
	변수를 할당하고 값을 별도로 출력 : ${num2 = 9;''} -> ${num2 } <br/>
	num1 = ${ num1 },
	num2 = ${ num2 },
	num3 = ${ num3 },
	num4 = ${ num4 }
	
	<h3>산술연산자</h3>
	num1 + num2 : ${ num1 + num2 } <br/>
	num1 - num2 : ${ num1 - num2 } <br/>
	num1 * num2 : ${ num1 * num2 } <br/>
	num1 / num2 : ${ num1 / num2 } <br/>
	num1 div num2 : ${ num1 div num2 } <br/>
	num1 % num2 : ${ num1 % num2 } <br/>
	num1 mod num2 : ${ num1 mod num2 } <br/>
	
	<hr>
	
	<!-- 숫자형태의 문자열은 자동으로 숫자로 변환 -->
	num1 + "34" : ${ num1 + "34"}; <br/>
	num2 + "이십" : \${ num1 + "이십"}; <br/>
	
	<h2>비교연산자</h2>
	num4 > num3 : ${ num4 gt num3 }; <br/> <!-- greater than -->
	num1 < num3 : ${ num1 lt num3 }; <br/> <!-- less than -->
	num2 >= num4 : ${ num2 ge num4 }; <br/> <!-- greater equal-->
	num1 == num4 : ${ num1 eq num4 }; <br/> <!-- equal -->
	num1 != num4 : ${ num1 ne num4 }; <br/> <!-- not equal -->
	
	<h2>논리연산자</h2>
	num3 <= num4 && num3 == num1 : ${num3 le num4 and num3 eq num1 }; <br/>
	num1 >= num2 || num3 != num4 : ${num1 ge num2 or num3 ne num4 }; 
		
	<br><br><br><br><br><br>
</body>
</html>