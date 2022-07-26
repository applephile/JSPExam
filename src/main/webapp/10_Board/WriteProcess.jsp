<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %> <!-- 로그인 확인 -->

<%
	//폼값 받아오기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	//폼값을 DTO객체에 저장
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId(session.getAttribute("UserId").toString());
	
	//DAO 객체로 DB에 DTO저장
	BoardDAO dao = new BoardDAO(application);
	int iResult = dao.insertWrite(dto);
	dao.close();
	
	if(iResult == 1) {
		response.sendRedirect("List.jsp");
	} else {
		JSFunction.alertBack("글쓰기 실패했습니다.", out);
	}
%>