package mypage.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import market.model.MarketDAO;
import market.model.MarketDTO;
import member.model.MemberDTO;
import mypage.MypageService;

public class BoardList implements MypageService{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		MemberDTO user = (MemberDTO)session.getAttribute("User");
		
		MarketDAO dao = new MarketDAO();
		
		int page = (int)request.getAttribute("nowPage");
		
		int limit =8; // 한 페이지당 게시글 수
		int pageLimit = 4; // 페이지 번호 갯수
		
		
		int total = dao.myTotalCnt(user.getPid());
		
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
		
		ArrayList<MarketDTO> data = dao.userList(user.getPid(), start, limit);
		
		request.setAttribute("mainData", data);
		request.setAttribute("mainUrl", "mypage/board/List");
		
		request.setAttribute("start", start);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
	}

}
