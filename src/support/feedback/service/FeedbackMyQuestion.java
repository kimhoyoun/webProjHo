package support.feedback.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.faq.model.FaqDAO;
import support.feedback.model.FeedbackDAO;

public class FeedbackMyQuestion implements SupportService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		int page = (int)request.getAttribute("nowPage");
		
		int limit =8; // 한 페이지당 게시글 수
		int pageLimit = 4; // 페이지 번호 갯수
		
		FeedbackDAO dao = new FeedbackDAO();
		
		int total = dao.totalCnt();
		
		int pageTotal = total/limit;
		
		if(total%limit > 0) {
			pageTotal++;
		}
		
		int start = (page-1)*limit;
		
		int pageStart = (page-1)/pageLimit*pageLimit+1;
		
		int pageEnd = pageStart+pageLimit-1;
		if(pageEnd>pageTotal) {
			pageEnd = pageTotal;
		}
		
		
		String user_id = request.getParameter("user_id");
		
		System.out.println(user_id);
		Object data = dao.mylist(start, limit, user_id);
		
		request.setAttribute("mainData", data);
		request.setAttribute("mainUrl", "/feedback/MyQuestion");
		
		
		request.setAttribute("start", start);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
		
		}
		
}
