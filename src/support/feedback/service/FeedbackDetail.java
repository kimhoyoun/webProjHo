package support.feedback.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.feedback.model.FeedbackDAO;
import support.notice.model.NoticeDAO;

public class FeedbackDetail implements SupportService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		FeedbackDAO dao = new FeedbackDAO();
		
		Object question = dao.detailQ(id);
		
		Object answer = dao.detailA(id);
		
		request.setAttribute("dto", question);
		if(answer!= null) {
			request.setAttribute("dto_answer", answer);
		}
		request.setAttribute("mainUrl", "/feedback/Detail");
	}

}
