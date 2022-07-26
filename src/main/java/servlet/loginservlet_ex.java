package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class loginservlet_ex extends HttpServlet{
	
	@Override
	public void init() throws ServletException {
		System.out.println("로그인 서블릿 초기화");
	}
	
	@Override
	public void destroy() {
		System.out.println("로그인 서블릿 소멸");
	}
	
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("로그인 서비스");
//	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		
		PrintWriter pw = resp.getWriter();
		
		req.getRequestDispatcher("login_ex.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");
		
		if(userid.equals(userpw)) {
			resp.sendRedirect("./main.jsp");
		} else {
			resp.sendRedirect("./login_ex.jsp");
		}
	}
}
