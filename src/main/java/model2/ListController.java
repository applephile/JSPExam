package model2;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPage;

public class ListController extends HttpServlet{
	
	//doget메서드 호출
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//DAO 생성
		MVCBoardDAO dao = new MVCBoardDAO();
		
		//View에 전달할 매개변수 저장을 위한 Map 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		//매개변수 받아오기
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		
		//매개변수로 전달된 검색어가 있으면 map 컬렉션에 저장
		if(searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		
		//DAO의 selectCount()메서드를 통해 게시물 개수 확인
		int totalCount = dao.selectCount(map);
		
		//***페이지 처리 시작
		//ServletContext : Servlet 간에 서로 값을 공유할 수 있도록 값(상태)를 저장하는 일종의 저장소
		ServletContext application = getServletContext();
		
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
		
		//현재 페이지 확인
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		
		if(pageTemp != null && !pageTemp.equals("")) 
			pageNum = Integer.parseInt(pageTemp); //요청받은 페이지로 변경
		
		//목록에 출력할 게시물 범위 계산
		int start = (pageNum - 1) * pageSize + 1; //첫 게시물 번호 
		int end = pageNum * pageSize; //마지막 게시물 번호
		map.put("start", start);
		map.put("end", end);
		//***페이지 처리 끝
		
		//게시물 목록 받아오기
		List<MVCBoardDTO> boardLists = dao.selectListPage(map);
		dao.close(); //DB연결 종료
		
		//뷰에 전달할 매개변수 추가
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../model2/list.do");
		
		map.put("pagingImg", pagingImg);
		map.put("totalCount", totalCount);
		map.put("pageSize", pageSize);
		map.put("pageNum", pageNum);
		
		//전달할 데이터를 List.jsp로 포워드
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		req.getRequestDispatcher("/16_MVCBoard/List.jsp").forward(req, resp);
	}
	
}











