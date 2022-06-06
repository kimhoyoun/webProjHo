package gym.basketball.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gym.GymService;
import gym.basketball.model.BasketballDAO;
import support.notice.model.NoticeDAO;

public class BasketballList implements GymService{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String today = format.format(new Date());
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int page = (int)request.getAttribute("nowPage");
		
		int limit =8; // 한 페이지당 게시글 수
		int pageLimit = 4; // 페이지 번호 갯수
		
		
		BasketballDAO dao = new BasketballDAO();
		
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
		
		
		
		if(request.getParameter("dateSet")!= null) {
			request.setAttribute("dateSet", request.getParameter("dateSet"));
		}else {
			request.setAttribute("dateSet", today);
		}
		Object data = dao.list(start, limit);
		
		request.setAttribute("mainData", data);
		request.setAttribute("mainUrl", BASKETBALL+"List");
		
		request.setAttribute("start", start);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
		
	}

}
