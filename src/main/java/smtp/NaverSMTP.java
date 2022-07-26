package smtp;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Authenticator;
import java.util.Map;
import java.util.Properties;

public class NaverSMTP {
	private final Properties serverInfo; //서버정도
	private final Authenticator auth; //인증정보
	
	public NaverSMTP() {
		//네이버 SMTP서버 접속 정보
		//Properties : 파일에서 직접 값을 설정하여 읽어오는 방법
		//HashTable을 상속받아 구현한 컬렉션의 한 종류
		serverInfo = new Properties();
		serverInfo.put("mail.smtp.host", "smtp.naver.com");
		serverInfo.put("mail.smtp.port", "465");
		serverInfo.put("mail.smtp.starttls.enable", "true");
		serverInfo.put("mail.smtp.auth", "true");
		serverInfo.put("mail.smtp.debug", "true");
		serverInfo.put("mail.smtp.socketFactory.port", "465");
		serverInfo.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		serverInfo.put("mail.smtp.socketFactory.fallback", "false");
		
		//사용자 인증 정보
		auth = new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("applerc", "n2011sjapple.");
			}
		};
	}
	//메일 내용 전송
	public void emailSending(Map<String, String> mailInfo) throws MessagingException {
		//1. 세션 생성
		Session session = Session.getInstance(serverInfo, auth);
		session.setDebug(true);
		
		//2. 메세지 작성
		MimeMessage msg = new MimeMessage(session);
		msg.setFrom(new InternetAddress(mailInfo.get("from")));
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(mailInfo.get("to")));;
		msg.setSubject(mailInfo.get("subject"));
		msg.setContent(mailInfo.get("content"), mailInfo.get("format"));
		
		Transport.send(msg);
	}
}
