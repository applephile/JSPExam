<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function checkNum() {
			//이름은 숫자로 시작할 수 없음
			//숫자 여부 확인 함수 : isNaN() 
			//isNaN() 함수의 인수값이 숫자면 false, 아닐 경우 true
			/* if(!isNaN(document.frm.name.value.substr(0, 1))) {
				alert("이름은 숫자로 시작할 수 없습니다.");
				document.frm.name.select();
				return false;
			} */
			
			//event.returnValue : 입력받은 키값의 반환 여부 설정
			/* if(!(event.keyCode >= 48 && event.keyCode <= 57)) {
				alert("숫자만 입력 가능");
				event.returnValue = false;
			} */
		}
	</script>
	
	<form name="frm">
		<p> 나이 : <input type="text" name="age" onkeypress="checkNum();"></p>
		<input type="submit" value="전송">
	</form>
</body>
</html>