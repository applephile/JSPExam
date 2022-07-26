package model2;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class MVCBoardDAO extends DBConnPool{
	
	public MVCBoardDAO() {
		super();
	}
	
	//게시물 개수
	public int selectCount(Map<String, Object> map) {
		
		int totalCount = 0;
		
		//쿼리문 생성
		String query = "SELECT COUNT(*) FROM mvcboard";
		
		//검색 조건 유무 판단
		if(map.get("searchWord") != null) {
			query += "WHERE " + map.get("searchField")
				  + " LIKE '%" + map.get("searchWord") + "%'";
		}
		
		try {
			stmt = con.createStatement(); //쿼리문 생성
			rs = stmt.executeQuery(query); // 쿼리문 실행
			rs.next();
			totalCount = rs.getInt(1); //검색된 게시물의 개수 저장
		} catch(Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		
		//결과값 반환
		return totalCount;
	}
	
	//게시물 목록 반환
	public List<MVCBoardDTO> selectListPage(Map<String, Object> map) { 
		
		//List 컬렉션 : 순서, 중복 있음
		List<MVCBoardDTO> board = new Vector<MVCBoardDTO>();
		
		//쿼리문 생성
		String query = "SELECT * FROM ( "
				     + " 	SELECT tb.*, ROWNUM rNum FROM ( "
				     + " 		SELECT * FROM mvcboard ";
				     
		if(map.get("searchWord") != null) {
			query += " 		WHERE " + map.get("searchField")
				  + " 		LIKE '%" + map.get("searchWord") + "%' ";
		}
		
			query += " 		ORDER BY idx DESC"
				  + "	 ) tb "
				  + " ) "
				  + " WHERE rNum BETWEEN ? AND ?";
			
		try {
			psmt = con.prepareStatement(query); //동적 쿼리문 생성
			psmt.setString(1, map.get("start").toString()); //인파라미터 설정
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();//쿼리문 실행
			
			//변환된 게시물 목록을 List컬렉션에 추가
			while(rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				
				board.add(dto);
			}
		} catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return board;
	}
	
	
	//게시글을 받아 DB에 추가
	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO mvcboard ( "
					+ " idx, name, title, content, ofile, sfile, pass) "
					+ " VALUES (seq_board_num.nextval, ?, ?, ?, ?, ?, ?) ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	public MVCBoardDTO selectView(String idx) {
		MVCBoardDTO dto = new MVCBoardDTO();
		
		//쿼리문 준비
		String query = "SELECT * FROM mvcboard WHERE idx=?";
				
		try {
			psmt = con.prepareStatement(query); //쿼리문 실행 준비
			psmt.setString(1, idx); //인파라미터 설정
			rs = psmt.executeQuery(); //쿼리문 실행
			
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
			}
		} catch (Exception e) {
			System.out.println("게시글 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	//조회수 증가
	public void updateVisitCount(String idx) {
		String query = "UPDATE mvcboard SET visitcount = visitcount + 1 WHERE idx = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("게시글 조회 수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	//다운로드 횟수 증가
	public void downCountPlus(String idx) {
		String sql = "UPDATE mvcboard SET downcount = downcount + 1 WHERE idx = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
			
		} catch(Exception e) {}
	}
	
	//입력한 비밀번호와 게시물 비밀번호 동일 여부 확인
	public boolean confirmPassword(String pass, String idx) {
		boolean isCorr = true;
		try {
			String sql = "SELECT COUNT(*) FROM mvcboard WHERE pass = ? AND idx = ?";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pass);
			psmt.setString(2, idx);
			rs = psmt.executeQuery();
			
			rs.next();
			
			if(rs.getInt(1) == 0) {
				isCorr = false;
			}
		} catch(Exception e) {
			isCorr = false;
			e.printStackTrace();
		}
		
		return isCorr;
	}
	
	//지정된 일련번호의 게시물 삭제
	public int deletePost(String idx) {
		int result = 0;
		
		try {
			String query = "DELETE FROM mvcboard WHERE idx = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("게시글 삭제 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	//게시글 데이터 받아 DB에 저장된 내용 수정
	public int updatePost(MVCBoardDTO dto) {
		int result = 0;
		
		try {
			
			String query = "UPDATE mvcboard SET title=?, name=?, content=?, ofile=?, sfile=? WHERE idx=? AND pass=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getIdx());
			psmt.setString(7, dto.getPass());
			
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		
		return result;
	}
}













