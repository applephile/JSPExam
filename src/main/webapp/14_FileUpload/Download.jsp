<%@page import="utils.JSFunction"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Uploads의 물리적 경로 가져옴
	String saveDirectory = application.getRealPath("/Uploads");
	
	//저장된 파일명과 원본 파일명을 매개변수로 받아서 변수에 저장	
	String saveFilename = request.getParameter("sName");
	String originalFilename = request.getParameter("oName");
	
	try{
		//Stream : 실제 입력과 출력이 표현된 데이터의 흐름
		
		//FileInputStream : 파일로부터 바이트 단위로 읽어올 때 사용하는 바이트 기반의 입력 스트림
		//바이트 기반이므로 그림, 오디오, 비디오, 텍스트파일... 등
		//모든 파일을 읽어올 수 있음
		File file = new File(saveDirectory, saveFilename);
		InputStream inStream = new FileInputStream(file);
		
		//한글 파일명 깨짐 방지
		String client = request.getHeader("User-Agent"); //브라우저 종류 확인
		
		if(client.indexOf("WOW64") == -1) {
			originalFilename = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1");
		} else {
			originalFilename = new String(originalFilename.getBytes("KSC5601"), "ISO-8859-1");
		}
		
		//파일 다운로드용 응답헤더
		response.reset();
		
		//파일 다운로드 창을 띄우기 위한 콘텐츠 타입 설정
		//octet-stream : 8비트 단위의 바이너리 데이터
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFilename + "\"");
		response.setHeader("Content-Length", "" + file.length());
		
		//출력 스트림 초기화
		out.clear();
		
		OutputStream outStream = response.getOutputStream();
		
		byte b[] = new byte[(int)file.length()];
		int readBuffer = 0;
		while((readBuffer = inStream.read(b)) > 0) {
			outStream.write(b, 0, readBuffer);
		}
		
		inStream.close();
		outStream.close();
		
		
	} catch(FileNotFoundException e) {
		JSFunction.alertBack("파일을 찾을 수 없습니다.", out);
	} catch(Exception e) {
		JSFunction.alertBack("예외가 발생했습니다.", out);
		e.printStackTrace();
	}
%>