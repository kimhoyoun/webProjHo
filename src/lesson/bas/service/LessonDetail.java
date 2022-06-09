package lesson.bas.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.bas.LessonService;
import lesson.bas.model.LessonDAO;


public class LessonDetail implements LessonService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
//		int id = Integer.parseInt(request.getParameter("id"));
		String post_id = request.getParameter("post_id");
		LessonDAO dao = new LessonDAO();
		
//		dao.addCount(post_id);
		Object data = dao.detail(post_id);
		
		request.setAttribute("dto",data);
		request.setAttribute("mainUrl", "lesson/bas/Detail");
		System.out.println("LessonDAO excute() 실행" + data);
		
		
	}
	
}