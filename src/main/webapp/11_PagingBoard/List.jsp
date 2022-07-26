<%@page import="utils.BoardPage"%>
<%@page import="model1.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	BoardDAO dao = new BoardDAO(application);
	Map<String, Object> param = new HashMap<String, Object>();
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	if(searchWord != null) {
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	//게시물 개수 확인
	int totalCount = dao.selectCount(param);
	
	//페이징 처리
	//전체 페이지 수 계산
	int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
	int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
	int totalPage = (int)Math.ceil((double)totalCount / pageSize);
	
	//현재 페이지 확인
	int pageNum = 1;
	String pageTemp = request.getParameter("pageNum");
	if(pageTemp != null && !pageTemp.equals("")) {
		pageNum = Integer.parseInt(pageTemp);
	}
	
	//목록에 출력할 게시물의 범위 확인
	int start = (pageNum - 1) * pageSize + 1; //첫 게시물 번호
	int end = pageNum * pageSize; //마지막 게시물 번호
	param.put("start", start);
	param.put("end", end);
	
	
	List<BoardDTO> boardLists = dao.selectListPage(param);
	dao.close();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./Link.jsp"></jsp:include>
	
	<h2>목록 보기 - 현재 페이지 : <%=pageNum %> (전체 : <%=totalPage %>)</h2>
	<form method="get">
		<table border="1" width="90%">
			<tr align="center">
				<td>
					<select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchWord">
					<input type="submit" value="검색하기">
				</td>
			</tr>
		</table>
	</form>
	
	<!-- 게시물 목록 테이블 -->
	
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		
		<%
			if(boardLists.isEmpty()) {
				//게시물이 하나도 없을 시 
		%>
			<tr>
				<td colspan="5" align="center">
					등록된 게시물이 없습니다.
				</td>
			</tr>
		<%
			} else {
				//게시물이 있을 시 
				int virtualNum = 0; //화면상 게시물 번호
				int countNum = 0;
				
				for(BoardDTO dto : boardLists) {
					//virtualNum = totalCount--;
					virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++);
		%>
					<tr align="center">
						<td><%= virtualNum %></td> <!-- 게시물 번호 -->
						<td> <!-- 제목(하이퍼링크) -->
							<a href="View.jsp?num=<%=dto.getNum()%>"><%= dto.getTitle() %></a>
						</td>
						<td align="center"><%= dto.getId() %></td>
						<td align="center"><%= dto.getVisitcount() %></td>
						<td align="center"><%= dto.getPostdate() %></td>
					</tr>
		
		<%
				}
			}
		%>
	</table>
	<table border="1" width="90%">
		<tr align="center">
			<!-- 페이징 처리 -->
			<td>
				<%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
			</td>
			<td>
				<button type="button" onclick="location.href='Write.jsp'">글쓰기</button>
			</td>
		</tr>
	</table>
	
</body>
</html>