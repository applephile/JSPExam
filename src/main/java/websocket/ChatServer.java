package websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatingServer")
public class ChatServer {
	
	//새로 접속한 클라이언트의 세션을 저장할 컬렉션 생성
	//Collections.synchronizedSet : 동시에 여러 클라이언트가 접속가능하도록 설정(멀티스레드환경)
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());

	//클라이언트 접속시 실행
	@OnOpen
	public void onOpen(Session session) {
		//clients 컬렉션에 클라이언트의 세션을 추가
		clients.add(session);
		System.out.println("웹 소켓 연결 : " + session.getId());
	}
	
	//메시지를 받으면 실행
	@OnMessage 
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("메시지 전송 : " + session.getId() + " > " + message);
		
		//동기화 블럭 내에서...
		synchronized (clients) {
			
			//모든 클라이언트에게 메세지를 전달
			for (Session client: clients) {
				
				//단, 메세지를 보낸 클라이언트를 제외하고 전달
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
		
	//클라이언와 연결이 끊기면 실행
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("웹소켓 종료 : " + session.getId());
	}
	
	//에러바 발생했을 때 실행할 메서드
	@OnError
	public void onError(Throwable e) {
		System.out.println("에러 발생!!!");
		e.printStackTrace();
	}
	
}










