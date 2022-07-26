<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		function checkMember() {
			let regExpId = /^[a-z|A-Z]/; //영어만
			let regExpPasswd = /^[0-9]*$/; //숫자만
			let regExpName= /^[가-힣]*$/; //한글만
			let regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/ //3자리 - 3or4자리 - 4자리
			let regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i //3자리 - 3or4자리 - 4자리
		 	
			
			let form = document.member;
			
			let id = form.id.value;
			let passwd = form.passwd.value;
			let name = form.name.value;
			let phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
			let email = form.email.value;
			
			if(!regExpId.test(id)) {
				alert("아이디는 영어로 시작");
				form.id.select();
				return;
			}
			if(!regExpName.test(name)) {
				alert("이름은 한글로 시작");
				form.name.select();
				return;
			}
			if(!regExpPasswd.test(passwd)) {
				alert("비밀번호는 숫자로 시작");
				form.passwd.select();
				return;
			}
			if(!regExpPhone.test(phone)) {
				alert("연락처 확인");
				return;
			}
			if(!regExpEmail.test(email)) {
				alert("이메일 확인");
				form.email.select();
				return;
			}
			
		}
	</script>

	<h2>회원가입</h2>
	<form name="member" method="post" action="validation2_process.jsp">
		<p>아이디 : <input type="text" name="id"></p>
		<p>패스워드 : <input type="password" name="passwd"></p>
		<p>이름 : <input type="text" name="name"></p>
		
		<p>연락처 : 
			<select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select>
			-
			<input type="text" name="phone2" maxlength="4" size="4"> - 
			<input type="text" name="phone3" maxlength="4" size="4"> 
		</p>
		
		<p>이메일 : <input type="email" name="email"></p>
		<p><input type="button" value="가입하기" onclick="checkMember()"></p>
		<!-- <p><input type="button" value="가입하기" onclick="checkMember()"></p> -->
	</form>
</body>
</html>