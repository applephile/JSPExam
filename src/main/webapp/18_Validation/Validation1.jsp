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
		function checkLogin() {
			let form = document.loginForm;
			
			//아이디가 입력되었는지 검사하여
			//입력되지 않았으면 '아이디를 입력해주세요' 출력 후 해당 항목 포커스
			if(form.id.value == "") {
				alert("아이디를 입력해주세요");
				form.id.focus();
				return false;
			}
			
			if(form.passwd.value == "") {
				alert("패스워드를 입력해주세요");
				form.passwd.focus();
				return false;
			}
			
			//아이디는 4~12자로 사이로, 패스워드는 4글자 이상으로 입력
			if(form.id.value.length < 4 || form.id.value.length > 12) {
				alert("아이디는 4~12자 사이로 입력");
				form.id.focus();
				return false;
			}
			//focus() : 커서만 가져다 둠
			//select() : 작성했던 내용 선택
			if(form.passwd.value.length < 4) {
				alert("비밀번호는 4글자 이상");
				form.passwd.select();
				return false;
			}
			
			for(i=0; i<=form.id.value.length; i++) {
				let ch = form.id.value.charAt(i);
				
				if((ch < 'a' || ch > 'z') && (ch > 'A' || ch < 'Z') && (ch > '0' || ch < '9')) {
					alert("아이디는 영문 소문자만 입력 가능");
					form.id.select();
					return;
				}
			}
			
			form.submit();
		}
	
	</script>

	<form name="loginForm" action="validation1_process.jsp" method="post">
		<p>아이디 : <input type="text" name="id"></p>
		<p>패스워드 : <input type="password" name="passwd"></p>
		<p><input type="button" value="전송" onclick="checkLogin();"></p>
	</form>
</body>
</html>