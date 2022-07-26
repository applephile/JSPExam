<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//3. 로그인 폼에서 가져온 아이디와 패스워드
	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");
	
	//4. web.xml에서 가져온 데이터베이스 연결
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleUrl = application.getInitParameter("OracleUrl");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePw = application.getInitParameter("OraclePw");
	
	//5. MemberDAO를 통해 DB에 접근하여 CRUD수행
	MemberDAO dao = new MemberDAO(oracleDriver, oracleUrl, oracleId, oraclePw);
	
	//8. getMemberDTO 호출
	MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
	//15. 데이터베이스 연결 해제
	dao.close();
	
	//16. 로그인 성공 여부에 따른 처리
	if(memberDTO.getId() != null) {
		//17. 로그인 성공 시 session 영역에 아이디와 이름 저장
		session.setAttribute("UserId", memberDTO.getId());
		session.setAttribute("UserName", memberDTO.getName());
		//18. 로그인 페이지 이동
		response.sendRedirect("LoginForm.jsp");
	} else { 
		//20. 로그인 실패 시..
		request.setAttribute("LoginErrMsg", "로그인 오류");
		//21. 로그인 페이지로 포워드
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
%>   