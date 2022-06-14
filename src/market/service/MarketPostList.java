package market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import market.Market_Service;
import market.model.MarketDAO;


public class MarketPostList implements Market_Service {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int page = (int)request.getAttribute("nowPage");
		
		int limit = 6; // 한 페이지에 보여줄 게시물 수
		int pageLimit = 4; // 페이지 번호 갯수

		MarketDAO dao = new MarketDAO();
		
		int total = dao.totalCnt();

		int pageTotal = total/limit;
		
		if(total%limit > 0) {
			pageTotal++;
		}
		
		int start = (page-1) * limit;
		int pageStart = (page-1) / pageLimit * pageLimit+1;
		int pageEnd = (pageStart+pageLimit)-1;
		
		if(pageEnd>pageTotal) {
			pageEnd = pageTotal;
		}
		
		Object data = dao.list(start, limit);
		
		request.setAttribute("mainData", data);
		request.setAttribute("mainUrl", "market/PostList");
		
		request.setAttribute("start", start);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
	}

}
