package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	
	//6. DB에 연결
	//CRUD에 해당하는 SQL쿼리문 실행
	//실행한 결과를 DTO객체에 담아서 반환하는 작업
	
	//7. 데이터베이스로의 연결이 완료된 MemberDAO객체를 생성
	//JDBConnect 내의 매개변수 4개의 생성자 상속받아 사용
	public MemberDAO (String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	//9. 작성한 아이디/패스워드와 일치하는 회원 정보 반환
	public MemberDTO getMemberDTO(String uid, String upass) {
		
		//10. DTO 객체 생성
		MemberDTO dto = new MemberDTO();
		//11. 아이디와 패스워드가 member테이블에 있는지 확인 위해 쿼리문 작성
		String query = "SELECT * FROM member WHERE id=? AND pass=?";
		
		try {
			//12. 동적 쿼리문 작성
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid); //첫 번째 인파라미터 값 설정
			psmt.setString(2, upass); //두 번째 인파라미터 값 설정
			rs = psmt.executeQuery(); //쿼리문 실행
			
			//13. 결과값 반환
			if(rs.next()) {
				dto.setId(rs.getString("id")); 
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString("regidate"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		//14. dto 객체 반환
		return dto;
	}
}
