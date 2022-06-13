package mypage.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import commu_bas.board.model.BoardDAO;
import commu_bas.board.model.BoardDTO;
import market.model.MarketDAO;
import market.model.MarketDTO;
import member.model.CorpMemberDTO;
import member.model.MemberDTO;
import mypage.MypageService;

public class BoardList implements MypageService{
	int total;
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		Object sUser = session.getAttribute("User");
		 
		if(sUser instanceof MemberDTO) {
			MemberDTO user = (MemberDTO)session.getAttribute("User");
			
			String board = request.getParameter("board");
			
			if(board.contains("bas_board")) {
				BoardDAO dao = new BoardDAO();
				
				total = dao.myTotalCnt(user.getPid());
				
				
				ArrayList<BoardDTO> data = dao.userList(user.getPid(), start, limit);
			}
			
			
		}else if(sUser instanceof CorpMemberDTO) {
			CorpMemberDTO user = (CorpMemberDTO)session.getAttribute("User");
			
		}
		
		
		MarketDAO dao = new MarketDAO();
		
		int page = (int)request.getAttribute("nowPage");
		
		int limit =8; // 한 페이지당 게시글 수
		int pageLimit = 4; // 페이지 번호 갯수
		
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
		
		
		
		request.setAttribute("mainData", data);
		request.setAttribute("mainUrl", "mypage/board/List");
		
		request.setAttribute("start", start);
		request.setAttribute("pageTotal", pageTotal);
		request.setAttribute("pageStart", pageStart);
		request.setAttribute("pageEnd", pageEnd);
	}

}
