<%@page import="smtp.NaverSMTP"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼값 지정
	Map<String, String> emailInfo = new HashMap<String,String>();
	emailInfo.put("from", request.getParameter("from"));
	emailInfo.put("to", request.getParameter("to"));
	emailInfo.put("subject", request.getParameter("subject"));
	
	//내용을 저장. 메일 포맷에 따라 다르게 처리
	String content = request.getParameter("content"); //내용
	String format = request.getParameter("format"); //메일 포맷
	
	if(format.equals("text")) {
		emailInfo.put("content", content);
		emailInfo.put("format", "text/plain;charset=UTF-8");
	} else if(format.equals("html")) {
		content = content.replace("\r\n", "<br>"); //줄바꿈 처리
		String htmlContent = ""; //HTML용으로 변호나된 내용을 담을 변수
		
		try{
			String templatePath = application.getRealPath("/19_Email/MailForm.html");
			BufferedReader br = new BufferedReader(new FileReader(templatePath));
			
			String oneLine;
			while((oneLine = br.readLine()) != null) {
				htmlContent += oneLine + "\n";
			}
			
			br.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		
		htmlContent = htmlContent.replace("__CONTENT__", content);
		
		emailInfo.put("content", htmlContent);
		emailInfo.put("format", "text/html;charset=UTF-8");
	}
		
	try {
		NaverSMTP smtpServer = new NaverSMTP();
		smtpServer.emailSending(emailInfo);
		out.println("이메일 전송 성공");
	} catch(Exception e) {
		out.print("이메일 전송 실패");
		e.printStackTrace();
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>