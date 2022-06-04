package support.feedback.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.feedback.model.FeedbackAnswerDTO;
import support.feedback.model.FeedbackDAO;
import support.feedback.model.FeedbackQuestionDTO;
import support.notice.model.NoticeDAO;
import support.notice.model.NoticeDTO;

public class FeedbackInsertRegA implements SupportService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		String content = request.getParameter("content");
		String question_id = request.getParameter("question_id");
		
		FeedbackAnswerDTO dto = new FeedbackAnswerDTO(content, question_id);
		
		new FeedbackDAO().insertA(dto);
		
		request.setAttribute("msg", "작성되었습니다.");
		request.setAttribute("goUrl", "feedback/Detail?id="+question_id);
		request.setAttribute("mainUrl", "/feedback/alert");
	}

}
