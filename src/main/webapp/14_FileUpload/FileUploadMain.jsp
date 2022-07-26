<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function validateForm(form) {
		if(form.name.value == null){
			alert("작성자 입력");
			form.name.focus();
			return false;
		} 
			
		if(form.title.value == null) {
			alert("제목 입력");
			form.title.focus();
			return false;
		}
		if(form.attachedFile.value == null) {
			alert("파일 첨부");
			return false;
		}
	}
</script>
<body>
	<h2>파일 업로드</h2>
	<span style="color: red;"> ${errorMessage }</span>
	<form name="fileForm" method="post" enctype="multipart/form-data" action="UploadProcess.jsp" onsubmit="return validateForm(this)">
		작성자 : <input type="text" name="name" value="김그린"/> <br/> 
		제목 : <input type="text" name="title" > <br/>
		카테고리(선택사항) :
			<input type="checkbox" name="cate" value="사진" checked> 사진
			<input type="checkbox" name="cate" value="과제"> 과제
			<input type="checkbox" name="cate" value="워드"> 워드
			<input type="checkbox" name="cate" value="음원"> 음원 <br/>
			
		첨부파일 : <input type="file" name="attachedFile"> <br/>
		<input type="submit" value="전송하기">
	</form>
</body>
</html>