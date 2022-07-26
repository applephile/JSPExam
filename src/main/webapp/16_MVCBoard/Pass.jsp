<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>비밀번호 확인</h2>
	<form name="writefrm" method="post" onsubmit="return validateForm(this)" action="../model2/pass.do">
		<input type="hidden" name="idx" value="${param.idx }">
		<input type="hidden" name="mode" value="${param.mode }">
		<table border="1" width="90%">
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" style="width:100px;"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">확인</button>
					<button type="reset">초기화</button>
					<button type="button" onclick="location.href='../model2/list.do';">목록보기</button>
				</td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
		function validateForm(form) {
			if(form.pass.value == "") {
				alert("비밀번호르 입력하세요");
				form.pass.focus();
				return false;
			}
		}
	</script>
</body>
</html>