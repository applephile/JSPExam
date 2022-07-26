package model2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/model2/view.do")
public class ViewController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//게시글 불러오기
		//게시글 조회 요청 시
		MVCBoardDAO dao = new MVCBoardDAO(); //DAO 생성
		String idx = req.getParameter("idx"); //게시글의 일련번호를 매개변수로
		dao.updateVisitCount(idx); //해당 게시글의 조회 수를 1 증가 시키고
		MVCBoardDTO dto = dao.selectView(idx); //게시글의 내용을 가져옴
		dao.close();
		
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/16_MVCBoard/View.jsp").forward(req, resp);
		
		
	}
}
