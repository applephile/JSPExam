package model1;

public class BoardDTO {
	//DTO : 데이터를 저장하거나 전송하는데 사용
	//멤버변수와 getter, setter만 가지고 있음
	
	//board테이블의 컬럼과 동일하게 작성
	//자료형은 특별한 이유 없을 시 String 선언
	private String num;
	private String title;
	private String content;
	private String id;
	private java.sql.Date postdate;
	private String visitcount;
	private String name;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
