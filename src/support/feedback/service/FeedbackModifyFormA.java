package support.feedback.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.feedback.model.FeedbackDAO;
import support.notice.model.NoticeDAO;

public class FeedbackModifyFormA implements SupportService{
	
	public FeedbackModifyFormA() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		FeedbackDAO dao = new FeedbackDAO();
		
		Object data = dao.detailA(id);
		
		request.setAttribute("dto", data);
		request.setAttribute("mainUrl", "/feedback/ModifyFormA");
	}
}
