package gym.basketball.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gym.GymService;
import gym.basketball.model.BasketballDAO;

public class BasketballReservationForm implements GymService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		BasketballDAO dao = new BasketballDAO();
		
		Object data = dao.detail(id);
		
		request.setAttribute("dto", data);
		request.setAttribute("totalPrice",request.getParameter("totalPrice"));
		request.setAttribute("dateSet",request.getParameter("dateSet"));
		request.setAttribute("mainUrl", BASKETBALL+"ReservationForm");
	}

}