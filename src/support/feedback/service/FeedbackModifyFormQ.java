package support.feedback.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.feedback.model.FeedbackDAO;
import support.notice.model.NoticeDAO;

public class FeedbackModifyFormQ implements SupportService{
	
	public FeedbackModifyFormQ() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		FeedbackDAO dao = new FeedbackDAO();
		
		Object data = dao.detailQ(id);
		
		request.setAttribute("dto", data);
		request.setAttribute("mainUrl", "/feedback/ModifyFormQ");
		System.out.println("BoardDetail execute() "+data);
	}
}
