package utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

public class JSFunction {
	//메세지 알림창 표시 후 특정 URL로 이동하는 스크립트 코드
	
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = "" 
							+ "<script>" 
							+ " alert('" + msg + "');"
							+ " location.href ='" + url + "';"
							+ "</script>";
			
			out.println(script);
		} catch(Exception e) {}
	}
	
	//메세지 알림창을 표시 후 이전 페이지로 돌아가기
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = ""
							+ "<script>"
							+ " alert('" + msg + "');"
							+ " history.back();"
							+ "</script>";
			out.println(script);
		} catch(Exception e) {}
	}
	
	//서블릿에서 알림창 표시하고 다른 페이지로 이동
	public static void alertLocation(HttpServletResponse resp, String msg, String url) {
		try {
			//서블릿에서 내용을 출력하기 위해 컨텐츠 타입 지정
			resp.setContentType("text/html;charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			String script = "<script>"
							+ "	alert('" + msg + "');"
							+ "	location.href = '" + url + "';"
							+ "</script>";
			writer.print(script);
			
		} catch(Exception e) {}
	}
	
	//서블릿에서 알림창 표시하고 이전 페이지로 이동
	public static void alertBack(HttpServletResponse resp, String msg) {
		try {
			//서블릿에서 내용을 출력하기 위해 컨텐츠 타입 지정
			resp.setContentType("text/html;charset=UTF-8");
			
			PrintWriter writer = resp.getWriter();
			String script = "<script>"
							+ "	alert('" + msg + "');"
							+ "	history.back();"
							+ "</script>";
			writer.print(script);
			
		} catch(Exception e) {}
	}
}
