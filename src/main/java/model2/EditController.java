package model2;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/model2/edit.do")
public class EditController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String idx = req.getParameter("idx");
		MVCBoardDAO dao = new MVCBoardDAO();
		MVCBoardDTO dto = dao.selectView(idx);
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/16_MVCBoard/Edit.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//파일 업로드 처리
		
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		//초기화 매개변수로 설정한 첨부 파일의 최대 용량 확인
		//최대 용량을 얻어와서 변수로 설정
		ServletContext application = getServletContext();
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		
		if(mr == null) {
			JSFunction.alertBack(resp, "첨부파일이 제한된 용량을 초과했습니다.");
			return;
		}
		
		//파일 업로드 외 처리
		String idx = mr.getParameter("idx");
		String prevOfile = mr.getParameter("prevOfile");
		String prevSfile = mr.getParameter("prevSfile");
		
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		
		HttpSession session = req.getSession();
		String pass = (String)session.getAttribute("pass");
		
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setIdx(idx);
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPass(pass);
		
		String fileName = mr.getFilesystemName("ofile");
		
		if(fileName != null) {
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = now + ext;
			
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			dto.setOfile(fileName);
			dto.setSfile(newFileName);
			
			FileUtil.deleteFile(req, "/Uploads", prevSfile);
			
		} else {
			dto.setOfile(prevOfile);
			dto.setSfile(prevSfile);
		}
		
		//DB에 반영
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.updatePost(dto);
		dao.close();
		
		if(result == 1) {
			session.removeAttribute("pass");
			resp.sendRedirect("../model2/view.do?idx=" + idx);
		} else {
			JSFunction.alertLocation(resp, "비밀번호를 확인하세요", "../model2/view.do?idx=" + idx);
			
		}
	}
}
