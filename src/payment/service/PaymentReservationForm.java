package payment.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import contents.ContentsService;
import gym.GymService;
import gym.basketball.model.BasketballDAO;
import lesson.bas.model.LessonDAO;

public class PaymentReservationForm implements ContentsService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		
		if(id.contains("lesson_bas")) {
			LessonDAO dao = new LessonDAO();
			Object data = dao.detail(id);
			request.setAttribute("dto", data);
			request.setAttribute("dataType","lesson");
		}
		
		
		request.setAttribute("timeSelect", request.getParameter("timeSelect"));
		request.setAttribute("totalPrice",request.getParameter("totalPrice"));
		request.setAttribute("dateSet",request.getParameter("dateSet"));
		request.setAttribute("mainUrl", "payment/ReservationForm");
	}

}
