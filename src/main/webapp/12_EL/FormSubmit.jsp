<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>폼값 전송하기</h2>
	<form name="frm" method="post" action="FormResult.jsp">
		이름 : <input type="text" name="name" /> <br/><br/>
		성별 : <input type="radio" name="gender" value="man"/> 남자
			  <input type="radio" name="gender" value="woman"/> 여자 <br/><br/>
		학력 : 
			 <select name="grade">
			 	<option value="ele">초등학교</option>
			 	<option value="mid">중학교</option>
			 	<option value="high">고등학교</option>
			 	<option value="uni">대학교</option>
			 </select> <br/><br/>
			 
	 	관심사항 : <input type="checkbox" name="inter" value="pol" /> 정치
	 			<input type="checkbox" name="inter" value="eco" /> 경제
	 			<input type="checkbox" name="inter" value="ent" /> 연예
	 			<input type="checkbox" name="inter" value="spo" /> 스포츠 <br/><br/>
	 			
		<input type="submit" value="전송하기">
		
	</form>
</body>
</html>