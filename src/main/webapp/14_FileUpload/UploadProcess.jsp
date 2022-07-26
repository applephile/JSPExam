<%@page import="java.util.Date"%>
<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Uploads 폴더의 '물리적 경로'를 가져옴
	String saveDirectory = application.getRealPath("/Uploads");
	int maxPostSize = 1024 * 1000;
	String encoding = "UTF-8"; //인코딩 방식
	
	try{
		//1. MultipartRequest 객체 생성
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
		
		//2. 새로운 파일명 생성
		String fileName = mr.getFilesystemName("attachedFile"); //현재 파일 이름
		String ext = fileName.substring(fileName.lastIndexOf(".")); //파일 확장자
		
		//새로운 파일 이름(년월일_시분초밀리초.확장자))
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String newFileName = now + ext;
		
		//3. 파일명 설정
		//File.separator : 경로를 구분하는 특수기호
		File oldFile = new File(saveDirectory + File.separator + fileName);
		File newFile = new File(saveDirectory + File.separator + newFileName);
		oldFile.renameTo(newFile); //파일 이름 변경
		
		//4. 다른 폼값 받아오기
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String[] cateArray = mr.getParameterValues("cate");
		StringBuffer cateBuf = new StringBuffer();
		
		if(cateArray == null) {
			cateBuf.append("선택 없음");
		} else { 
			for(String s : cateArray) {
				cateBuf.append(s + ", ");
			}
		}
		
		//5. DTO 생성
		MyfileDTO dto = new MyfileDTO();
		dto.setName(name);
		dto.setTitle(title);
		dto.setCate(cateBuf.toString());
		dto.setOfile(fileName);
		dto.setSfile(newFileName);
		
		//6. DAO를 통해서 DB 반영
		MyfileDAO dao = new MyfileDAO();
		dao.insertFile(dto);
		dao.close();
		
		//7. 파일 목록 JSP로 리다이렉션
		response.sendRedirect("FileList.jsp");
		
		
	} catch(Exception e) {
		e.printStackTrace();
		request.setAttribute("errorMessage", "파일 업로드 오류");
		request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
	}
	
%>