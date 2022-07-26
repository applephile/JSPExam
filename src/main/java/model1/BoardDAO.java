package model1;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect{
	
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	//게시글 개수 세기
	public int selectCount(Map<String, Object> map) {
		
		int totalCount = 0; //결과값(게시물 개수) 저장
		
		String query = "SELECT COUNT(*) FROM board";
		
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch(Exception e) {
			System.out.println("게시물의 개수 계산 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount; //게시물 개수 반환
	}
	
	//게시물 목록 반환
	
	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		String query = "SELECT * FROM board";
		
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		
		query += " ORDER BY num DESC";
		
		try {
			stmt = con.createStatement(); // 쿼리문 생성
			
			rs = stmt.executeQuery(query); // 쿼리문 실행
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto); //결과에 목록 저장
			}
		} catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	//목록 출력 시 페이징 기능 추가
	public List<BoardDTO> selectListPage(Map<String, Object> map) {
		
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		//쿼리문 작성 1
		String query = " SELECT * FROM ("
				+ " SELECT tb.*, ROWNUM rNum FROM ("
				+ " SELECT * FROM board";
		
		//검색 조건 추가
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField")
				+ " LIKE '%" + map.get("searchWord") + "%' ";
		}
		
		//쿼리문 작성2
		query += " ORDER BY num DESC"
				+ " ) tb "
				+ " ) "
				+ " WHERE rNum BETWEEN ? AND ?"; 
		
		try {
			//쿼리문 완성
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			
			//쿼리문 실행
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto);
				
			}
		} catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	//게시글 데이터를 받아 DB에 추가
	
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		try {
			
			String query = "INSERT INTO board(num, title, content, id, visitcount) VALUES(seq_board_num.nextval, ?, ?, ?, 0)";
			
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			
			result = psmt.executeUpdate(); 
		} catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	//게시글 확인
	public BoardDTO selectView(String num) {
		
		BoardDTO dto = new BoardDTO();
		
		String query = "SELECT B.*, M.name FROM member M INNER JOIN board B ON M.id = B.id WHERE num = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setName(rs.getString("name"));
			}
		} catch(Exception e) {
			System.out.println("게시글 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	//조회수 증가 메서드 생성
	public void updateVisitCount(String num) {
		String query = "UPDATE board SET visitCount = visitCount + 1 WHERE num = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
		} catch(Exception e) {
			System.out.println("조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	//선택한 게시글 수정하기
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "UPDATE board SET title = ?, content = ? WHERE num = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result = psmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("게시글 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	} 
	
	//지정한 게시글 삭제하기
	public int DeletePost(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "DELETE FROM board WHERE num = ?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("게시글 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
}





















