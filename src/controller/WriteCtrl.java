package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import util.FileUtil;

public class WriteCtrl extends HttpServlet{
	
/*
	글쓰기 페이지로 진입했을 때의 요청을 처리한다.
	글쓰기 폼으로 이동(location)하는 것은 
	get방식이므로 doGet()에서 처리한다.
 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//글쓰기 페이지로 진입할 때는 다른 처리 없이 포워드만 하면 됨.
		req.getRequestDispatcher("/14Dataroom/DataWrite.jsp").forward(req, resp);
	}
	
/*
	글 작성을 완료한 후 서버로 전송(submit)할 때의 요청을 처리한다.
	게시판에 글을 쓸 때는 post방식으로 처리하게 된다.
*/
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//한글처리
		req.setCharacterEncoding("UTF-8");
		//request객체와 물리적 경로를 매개변수로 upload
		MultipartRequest mr=FileUtil.upload(req, req.getServletContext().getRealPath("/Upload"));
		
		int sucOrFail;
		
		if(mr != null) {
			/*
				파일업로드가 완료되면 나머지 폼값을 받기 위해
				mr 참조변수를 이용한다.
			*/
			String name=mr.getParameter("name");
			String title=mr.getParameter("title");
			String pass=mr.getParameter("pass");
			String content=mr.getParameter("content");
			//MultipartRequest를 통해 이미 서버에 올라간(저장된) 실제 파일명을 getFilesystemName으로 가져온다.
			String attachedfile=mr.getFilesystemName("attachedfile");
			
			//DTO객체에 위의 폼값을 저장한다.
			DataroomDTO dto=new DataroomDTO();
			dto.setAttachedfile(attachedfile);
			dto.setContent(content);
			dto.setTitle(title);
			dto.setName(name);
			dto.setPass(pass);
			
			//DAO객체생성 및 연결 ... insert처리
			DataroomDAO dao=new DataroomDAO();
			//파일업로드 성공 및 insert 성공시
			sucOrFail = dao.insert(dto);
			
		/*
			페이지 처리를 위한 100개 더미 데이터 입력
			
			sucOrFail = 1;
			for(int i=1; i<=100; i++) {
				dto.setTitle("자료실"+i+"번 째 포스팅");
				dao.insert(dto);
			}
		*/
			
			dao.close();
		}
		else {
			//mr객체가 생성되지 않은 경우, 즉 파일 업로드 실패시
			sucOrFail=-1;
		}
		if(sucOrFail==1){
			resp.sendRedirect("../DataRoom/DataList");
		}
		else {
			req.getRequestDispatcher("/14Dataroom/DataWrite.jsp").forward(req, resp);
		}
		//System.out.println("submit");
	}
}
