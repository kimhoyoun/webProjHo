package support.feedback.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.feedback.model.FeedbackDAO;
import support.feedback.model.FeedbackQuestionDTO;
import support.notice.model.NoticeDAO;
import support.notice.model.NoticeDTO;

public class FeedbackInsertRegQ implements SupportService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		String title = request.getParameter("title");
		String filter = request.getParameter("filter");
		String content = request.getParameter("content");
		String user_id = request.getParameter("user_id");
		
		FeedbackQuestionDTO dto = new FeedbackQuestionDTO(title, content, filter, user_id);
		
		new FeedbackDAO().insertQ(dto);
		
		request.setAttribute("msg", "작성되었습니다.");
		request.setAttribute("goUrl", "feedback/home");
		request.setAttribute("mainUrl", "/feedback/alert");
	}

}
