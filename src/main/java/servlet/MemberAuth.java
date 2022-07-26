package servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;
import membership.MemberDTO;

public class MemberAuth extends HttpServlet{
	
	MemberDAO dao;
	
	@Override
	public void init() throws ServletException {
		//application 내장 객체 얻기
		ServletContext application = this.getServletContext();
		
		//web.xml에서 DB연결 정보 얻기
		String driver = application.getInitParameter("OracleDriver");
		String connectUrl = application.getInitParameter("OracleUrl");
		String oId = application.getInitParameter("OracleId");
		String oPass = application.getInitParameter("OraclePw");
		
		//DAO 생성
		dao = new MemberDAO(driver, connectUrl, oId, oPass);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//서블릿 초기화 매개변수에서 관리자 id 받아오기
		String admin_id = this.getInitParameter("admin_id");
	
		//인증을 요청한 아이디 / 패스워드
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		MemberDTO memberDTO = dao.getMemberDTO(id, pass);
		
		String memberName = memberDTO.getName();
		
		if(memberName != null) {
			req.setAttribute("authMessage", memberName + "회원");
		} else {
			if(admin_id.equals(id)) {
				req.setAttribute("authMessage", admin_id + "관리자님");
			} else {
				req.setAttribute("authMessage", "회원이 아닙니다");
			}
		}
		req.getRequestDispatcher("/15_Servlet/MemberAuth.jsp").forward(req, resp);
	}
	
	@Override
	public void destroy() {
		dao.close();
	}
}

















