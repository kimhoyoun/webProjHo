package commu_bas.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commu_bas.board.BoardService;
import commu_bas.board.model.BoardDAO;

public class BoardSearchList implements BoardService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int page = 	(int)request.getAttribute("nowPage");
		String field = request.getParameter("field");
		String search = request.getParameter("search");

		
		int limit = 5; // 한 페이지당 게시물 갯수
		int pageLimit = 3; // 페이지 번호 갯수
		int total = 0;
		
		BoardDAO dao = new BoardDAO();
		Object data = null;
		if(field.equals("list")) {
			total = dao.totalCntSearch(search);
		}else {
			total = dao.totalCntSearch(field, search);
		}
		int pageTotal = total/limit;
		
		if (total%limit > 0) {
			pageTotal++;
		}
		
		int start = (page-1) * limit;
		int pageStart = (page-1) / pageLimit * pageLimit + 1;
		int pageEnd = pageStart + pageLimit -1;
		
		if(pageEnd > pageTotal) {
			pageEnd = pageTotal;
		}
		
		if (field.equals("list")) {
			data = dao.list(start, limit, search);
		} else {
			data = dao.list(start, limit, field, search);
		}
		
		request.setAttribute("field", field);
		request.setAttribute("search", search);
		request.setAttribute("mainData", data);
		request.setAttribute("mainUrl", "commu_bas/board/List");
		
		request.setAttribute("start", start);

		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);


		System.out.println("BoardList execute() 실행" + data + "," + total);
	}
	
}