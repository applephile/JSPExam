<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h4>Include페이지</h4>
    
    <%
    	//파일은 다르더라도 같은 _jspService 내에 생성이 되는 것이라서 변수 이름 같으면 안됨
    	int pInteger2 = (Integer)pageContext.getAttribute("pageInteger");
    	/* String pString2 = pageContext.getAttribute("pageString").toString(); */
    	Person pPerson2 = (Person)pageContext.getAttribute("pagePerson");
    %>
    
    <ul>
		<li>Integer객체 : <%=pInteger2 %></li>
		<li>String객체 : <%=pageContext.getAttribute("pageString") %></li>
		<li>Person객체 : <%=pPerson2.getName() %>, <%=pPerson2.getAge() %></li>
	</ul>