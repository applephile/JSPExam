package model2;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

public class WriteController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/16_MVCBoard/Write.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. 파일 업로드 처리
		
		//업로드 폴더의 물리적 경로 확인
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		//첨부파일 최대 용량 확인
		ServletContext application = getServletContext();
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		//파일 업로드
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		
		if(mr == null) {
			//파일 업로드 실패
			JSFunction.alertLocation(resp, "첨부 파일이 제한 용량을 초과했습니다.", "../model2/write.do");
			return;
		}
		
		//2. 파일 업로드 외 처리
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setName(mr.getParameter("name"));
		dto.setTitle(mr.getParameter("title"));
		dto.setContent(mr.getParameter("content"));
		dto.setPass(mr.getParameter("pass"));
		
		//원본 파일명(ofile), 저장된 파일명(sfile)
		String fileName = mr.getFilesystemName("ofile");
		if(fileName != null) {
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = now + ext;
			
			//저장된 파일명 변경
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			dto.setOfile(fileName); //원래 이름
			dto.setSfile(newFileName); //서버에 저장된 새로운 파일 이름
			
			//DAO를 통해 DB에 작성된 내용을 저장
			MVCBoardDAO dao = new MVCBoardDAO();
			int result = dao.insertWrite(dto);
			dao.close();
			
			if(result == 1) {
				resp.sendRedirect("../model2/list.do"); //목록으로
			} else {
				resp.sendRedirect("../model2/write.do"); //글쓰기로
			}
		}
	}
	
}
