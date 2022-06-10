package market.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import market.Market_Service;
import market.model.MarketDAO;
import market.model.MarketDTO;


public class MarketPostModify_Reg implements Market_Service{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		MarketDTO dto = new MarketDTO();
		dto.setPost_id(request.getParameter("post_id"));
		dto.setUser_num(request.getParameter("user_num"));
		dto.setUser_email(request.getParameter("user_email"));
		dto.setTitle(request.getParameter("title"));
		dto.setCheck_quality(request.getParameter("check_quality"));
		dto.setL_category(request.getParameter("l_category"));
		dto.setS_category(request.getParameter("s_category"));
		dto.setDelivery(request.getParameter("delivery"));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		dto.setContent(request.getParameter("content"));
		
		new MarketDAO().modify(dto);
		
		request.setAttribute("msg", "수정되었습니다.");
		request.setAttribute("goUrl", "PostList");
		request.setAttribute("mainUrl", "alert");
	}

}
