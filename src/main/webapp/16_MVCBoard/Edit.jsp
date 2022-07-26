<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 첨부형 게시판 - 수정하기</h2>
	<form name="writeFrm" method="post" enctype="multipart/form-data" onsubmit="return validateForm(form)" action="../model2/edit.do">
		<input type="hidden" name="idx" value="${dto.idx}">
		<input type="hidden" name="prevOfile" value="${dto.ofile}">
		<input type="hidden" name="prevSfile" value="${dto.sfile}">
		
		<table border="1" width="90%">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" style="width: 150px;" value="${dto.name}"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" style="width: 90px;" value="${dto.title}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content"  style="width: 90%; height: 100px">${dto.content}</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="ofile">기존파일${dto.ofile}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" style="width: 100px;" value="${dto.pass}"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성 완료</button>
					<button type="reset">초기화</button>
					<button type="button" onclick="location.href='../model2/list.do';">목록 바로가기</button>
				</td>
			</tr>
		</table>
	</form>
	<script>
		/* 필수 항목 입력 여부 확인 */
		function validateForm(form) {
			if(form.name.value == "") {
				alert("이름을 입력하세요");
				form.name.focus();
				return false;
			}
			if(form.title.value == "") {
				alert("제목을 입력하세요");
				form.title.focus();
				return false;
			}
			if(form.content.value == "") {
				alert("내용을 입력하세요");
				form.content.focus();
				return false;
			}
			if(form.pass.value == "") {
				alert("비밀번호를 입력하세요");
				form.pass.focus();
				return false;
			}
		}
	</script>
</body>
</html>