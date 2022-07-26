package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
	
	//파일 업로드 처리
	public static MultipartRequest uploadFile(HttpServletRequest req, String saveDirectory, int maxPostSize) {
		
		try {
			
			return new MultipartRequest(req, saveDirectory, maxPostSize, "UTF-8");
			
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void download(HttpServletRequest req, HttpServletResponse resp, String directory, String sfileName, String ofileName) {
		
		String sDirectory = req.getServletContext().getRealPath(directory);
		
		try {
			
			//다운받고자 하는 파일을 찾아 입력스트림 생성
			File file = new File(sDirectory, sfileName);
			InputStream iStream = new FileInputStream(file);
			
			//한글 파일명 깨짐 방지
			String client = req.getHeader("User-Agent");
			
			if(client.indexOf("WOW64") == -1) {
				ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
			} else {
				ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
			}
			
			//파일 다운로드용 응답 헤더 설정
			resp.reset(); //응답 헤더 초기화
			
			//다운로드 창을 띄우기 위해 콘텐츠 타입 지정
			//octet-stream : 8비트 단위의 바이너리 데이터 의미
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename =\"" + ofileName + "\""); 
			
			//새로운 출력 스트림 생성
			OutputStream oStream = resp.getOutputStream();
			
			byte b[] = new byte[(int)file.length()];
			int readBuffer = 0;
			
			while((readBuffer = iStream.read(b)) > 0) {
				oStream.write(b, 0, readBuffer);
			}
			
			//입,출력 닫기
			iStream.close();
			oStream.close();
			
		} catch(FileNotFoundException e) {
			System.out.println("파일을 찾을 수 없습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("예외가 발생했습니다.");
			e.printStackTrace();
		}
	}
	
	public static void deleteFile(HttpServletRequest req, String directory, String filename) {
		String sDirectory = req.getServletContext().getRealPath(directory);
		File file = new File(sDirectory + File.separator + filename);
		
		if(file.exists()) {
			file.delete();
		}
	}
}
