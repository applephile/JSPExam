<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 첨부형 게시판 - 목록보기(List)</h2>
	
	<!-- 검색창 만들기 -->
	<form method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center">
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
	
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="*">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
			<th width="10%">첨부파일</th>
		</tr>
		<c:choose>
			<c:when test="${ empty boardLists }">
				<tr>
					<td colspan="6" align="center">
						등록된 게시물이 없습니다.
					</td>
				</tr>
			</c:when>
			<%-- 게시물이 있을 때 --%>
			<c:otherwise>
				<%-- items : 컬렉션 객체, var : 변수명, varStatus : 반복상태를 확인할 수 있는 변수 --%>
				<c:forEach items="${boardLists}" var="row" varStatus="loop">
					<tr align="center">
						<td> <%-- 번호 --%>
							<%-- 전체 게시물 수 - (((현재 페이지 번호 - 1) * 페이지 사이즈) + varStatus의 index 값) --%>
							${map.totalCount - (((map.pageNum - 1) * map.pageSize) + loop.index)}
						</td>
						<td><a href="../model2/view.do?idx=${row.idx}">${row.title}</a></td> <!-- 제목 -->
						<td>${row.name }</td> <%-- 작성자 --%>
						<td>${row.postdate }</td> <%-- 작성일 --%>
						<td> <%-- 첨부파일 --%>
							<c:if test="${not empty row.ofile}">
								<a href="../model2/download.do?ofile=${row.ofile}&sfile=${row.sfile}&idx=${row.idx}">[DOWN]</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
	<!-- 하단메뉴. (바로가기, 글쓰기) -->
	<table border="1" width="90%">
		<tr align="center">
			<td>${map.pagingImg}</td>
			<td>
				<button type="button" onclick="location.href='../model2/write.do';">글쓰기</button>
			</td>
		</tr>
	</table>
</body>
</html>









