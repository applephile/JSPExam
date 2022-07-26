<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#chatWindow{
		border: 1px solid black;
		width : 270px;
		height: 310px;
		padding : 5px;
		overflow: scroll;
	}
	#chatMessage{
		width: 235px;
		height: 30px;
	}
	#sendBtn{
		height: 30px;
	}
	#closeBtn{
		margin-bottom:5px;
	}
	#chatId{
		width: 160px;
		height: 25px;
		border: 1px solid #aaa;
		background-color: #eee;
	}
	.myMsg{
		text-align: right;
	}
</style>

</head>
<body>
	<!-- 대화창 UI 정의 -->
	대화명 : <input type="text" id="chatId" value="${param.chatId}" readonly >
	<button id="closeBtn" onclick="disconnect();">채팅 종료</button>
	
	<!-- 내용표시 -->
	<div id="chatWindow"></div>
	
	<div>
		<!-- dfsfasd -->
		<input type="text" id="chatMessage" onKeyup="enterKey();">
		<button id="sendBtn" onclick="sendMessage();">전송</button>
	</div>
	
	<script>
		//웹소켓 접속 URL뒤에 요청명을 덧붙여서 웹소켓 객체를 생성
		var webSocket
		    = new WebSocket("<%= application.getInitParameter("CHAT_ADDR") %>/ChatingServer");
		var chatWindow, chatMessage, chatId;
		//채팅창이 열리면 대화창, 메시지 입력창, 대화명을 변수에 저장함
		
		window.onload = function(){
			chatWindow = document.getElementById("chatWindow");
			chatMessage = document.getElementById("chatMessage");
			chatId = document.getElementById("chatId").value;
		}
		
		//메시지 전송
		function sendMessage() {
		    // 대화창에 표시
		    chatWindow.innerHTML += "<div class='myMsg'>" + chatMessage.value + "</div>"
		    webSocket.send(chatId + ' > ' + chatMessage.value);  // 서버로 전송
		    chatMessage.value = "";  // 메시지 입력창 내용 지우기
		    chatWindow.scrollTop = chatWindow.scrollHeight; //대화창 스크롤
		}
		
		//서버와의 연결 종료
		function disconnect(){
			webSocket.close();
		}
		
		//엔터키 입력
		function enterKey(){
			if (window.event.keyCode == 13) {
				sendMessage();
			}
		}
		
		//웹소켓 서버에 연결됐을 때 실행
		webSocket.onopen= function(event) {
			chatWindow.innerHTML += "웹소켓 서버에 연결했습니다.<br>";
		}
		
		//웹소켓 서버가 종료되었을 때(연결이 끊겼을 때) 실행
		webSocket.onclose = function(event) {
			chatWindow.innerHTML += "웹소켓 서버가 종료되었습니다.<br>";
		}
		
		//에러 발생시
		webSocket.onerror = function(event) {
			alert(event.data);
			chatWindow.innerHTML += "채팅 중 에러가 발생하였습니다.<br>";
		}
		
		//메시지를 받았을 때
		webSocket.onmessage = function(event) {
			//대화명과 메세지 분리
			let message = event.data.split(" > ");
			let sender = message[0] //보낸사람의 대화명
			let content = message[1] //메시지 내용
			
			if (content != "") {
				
				if (content.match("/")) { //귓속말
					if (content.match("/" + chatId)) {
						let temp = content.replace(("/" + chatId), "[귓속말] > ");
						chatWindow.innerHTML += "<div>" + sender + " " + temp + "</div>";
					}
				} else { //일반대화
					chatWindow.innerHTML += "<div>" + sender + " > " + content + "</div>";
				}
			}
			chatWindow.scorllTop = chatWindow.scrollHeight;
		}
	</script>
	
</body>
</html>






