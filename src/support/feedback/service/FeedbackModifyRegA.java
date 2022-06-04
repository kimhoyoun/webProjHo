package support.feedback.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.feedback.model.FeedbackAnswerDTO;
import support.feedback.model.FeedbackDAO;
import support.feedback.model.FeedbackQuestionDTO;
import support.notice.model.NoticeDAO;
import support.notice.model.NoticeDTO;

public class FeedbackModifyRegA implements SupportService{
	
	public FeedbackModifyRegA() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		FeedbackAnswerDTO dto = new FeedbackAnswerDTO();
		dto.setId(request.getParameter("id"));
		dto.setAnswer(request.getParameter("content"));
		dto.setQuestion_id(request.getParameter("question_id"));
		
		System.out.println(dto);
		int res = new FeedbackDAO().modifyA(dto);
		
		String msg = "수정 실패", goUrl = "feedback/ModifyFormA?id="+dto.getId()+"&page="+request.getAttribute("nowPage");
		
		if(res>0) {
			msg = "수정되었습니다.";
			goUrl = "feedback/Detail?id="+dto.getQuestion_id()+"&page="+request.getAttribute("nowPage");
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "/feedback/alert");
	}
}
