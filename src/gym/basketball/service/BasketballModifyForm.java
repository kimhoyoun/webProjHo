package gym.basketball.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gym.GymService;
import gym.basketball.model.BasketballDAO;
import support.SupportService;
import support.notice.model.NoticeDAO;

public class BasketballModifyForm implements GymService{
	
	public BasketballModifyForm() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		BasketballDAO dao = new BasketballDAO();
		
		Object data = dao.detail(id);
		
		request.setAttribute("dto", data);
		request.setAttribute("mainUrl", BASKETBALL+"ModifyForm");
	}
}
