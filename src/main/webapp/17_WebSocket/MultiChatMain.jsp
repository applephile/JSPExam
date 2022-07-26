<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 웹소켓 채팅 - 대화명 입력하기</h2>
	
	대화명 : <input type="text" id="chatId">
	<button onclick="chatWinOpen();">채팅 참여</button>
	
	<script>
		function chatWinOpen(){
			let id = document.getElementById("chatId");
			
			
			if (id.value == "") {
				alert("대화명을 입력해주세요");
				id.focus();
				return;
			}
			
			//window.open : 웹 브라우저에서 새로운 창을 여는 데 사용
			//window.open("경로", 이름, 속성)
			window.open("ChatWindow.jsp?chatId=" + id.value, "", "width=320, height=400");
			
			id.value="";
		}
	</script>
</body>
</html>





