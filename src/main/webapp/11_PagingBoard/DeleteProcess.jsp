<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>


<%
	String num = request.getParameter("num");
	BoardDTO dto = new BoardDTO();
	BoardDAO dao = new BoardDAO(application);
	dto = dao.selectView(num); //기존 일련번호에 해당하는 게시글 가져오기
	
	//로그인 된 사용자 ID가져오기
	String sessionId = session.getAttribute("UserId").toString();
	
	int delResult = 0;
	
	//작성자와 사용자가 같은지 확인
	if(sessionId.equals(dto.getId())) {
		dto.setNum(num);
		delResult = dao.DeletePost(dto);
		dao.close();
		
		if(delResult == 1) {
			JSFunction.alertLocation("삭제되었습니다.", "List.jsp", out);
		} else {
			JSFunction.alertBack("삭제를 실패했습니다.", out);
		}
	} else {
		JSFunction.alertBack("작성자 본인만 삭제할 수 있습니다.", out);
		
		return;
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