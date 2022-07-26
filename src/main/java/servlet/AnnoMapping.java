package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/15_Servlet/AnnoMapping.do")
public class AnnoMapping extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "Annotation Mapping");
		req.getRequestDispatcher("/15_Servlet/AnnoMapping.jsp").forward(req, resp);
		
	}
	
}
