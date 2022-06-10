package gym.basketball.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gym.GymService;
import gym.basketball.model.BasketballDAO;
import payment.model.PaymentDAO;
import payment.model.PaymentDTO;

public class BasketballDetail implements GymService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		
		String resDate = request.getParameter("dateSet");
		BasketballDAO dao = new BasketballDAO();
		
		Object data = dao.detail(id);
		
		ArrayList<PaymentDTO> resData = new PaymentDAO().myList(id, resDate);
		String resTime = "";
		
		
		if(resData != null) {
			for(int i =0; i<resData.size(); i++) {
				if(!resData.get(i).isRefund_reg()) {
					resTime += resData.get(i).getResTime();
				}
				
				if(i != resData.size()-1) {
					resTime += ",";
				}
			}
		}
		
		request.setAttribute("dto", data);
		request.setAttribute("resData", resTime);
		request.setAttribute("mainUrl", BASKETBALL+"Detail");
	}

}
