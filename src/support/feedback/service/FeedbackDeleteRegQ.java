package support.feedback.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.feedback.model.FeedbackDAO;
import support.feedback.model.FeedbackQuestionDTO;
import support.notice.model.NoticeDAO;
import support.notice.model.NoticeDTO;

public class FeedbackDeleteRegQ implements SupportService{
	
	public FeedbackDeleteRegQ() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		
		FeedbackQuestionDTO dto = new FeedbackQuestionDTO();
		
		String id = request.getParameter("id");
		String deleteCheck = request.getParameter("deleteCheck");
		
		
		
		dto.setId(id);
		int res = 0;
		if(deleteCheck.equals("삭제")) {
			res = new FeedbackDAO().deleteQ(dto);
		}
		 
		String msg = "삭제 실패", goUrl = "feedback/DeleteFormQ?id="+dto.getId()+"&page="+request.getAttribute("nowPage");
		
		if(res>0) {
			msg = "삭제성공";
			goUrl = "feedback/home";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "/feedback/alert");
	}
}
