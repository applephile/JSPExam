<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>액션태그를 이용하여 폼값을 한 번에 받아오기</h2>
	<form method="post" action="UseBeanAction.jsp">
		이름 : <input type="text" name="name"/> <br/>
		나이 : <input type="text" name="age"/> <br/>
		<input type="submit" value="폼값 전송"/>
	</form>
</body>
</html>