package manager.adjustment.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import contents.ContentsService;

import payment.model.PaymentDAO;
import payment.model.PaymentDTO;

public class AdjustmentMainPage implements ContentsService{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String today = format.format(new Date());
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String year =null, month = null, manager = null;
		PaymentDAO dao = new PaymentDAO();
		
		String searchDate = "2022";
		
		
		if(request.getParameter("searchDate")!=null&& !request.getParameter("searchDate").equals("") ) {
			year = request.getParameter("searchDate");
			searchDate = year;
		}
		

		HashMap<String, Integer> managerTotalMoney = dao.managerTotal(searchDate);
		HashMap<String, Integer> managerRefundMoney = dao.refundMoney(searchDate);
		
		Set<String> set = managerTotalMoney.keySet();
		
		Iterator it = set.iterator();
		
		HashMap<String, Integer> resultM = new HashMap<String, Integer>();
		
		int tot = 0;
		while(it.hasNext()) {
			String key = (String)it.next();
			
			if(managerRefundMoney.get(key) != null) {
				int res = managerTotalMoney.get(key) - managerRefundMoney.get(key);
				resultM.put(key, res);
				tot += res;
			}else {
				resultM.put(key, managerTotalMoney.get(key));
				tot += managerTotalMoney.get(key);
			}
			
		}

		
		ArrayList<PaymentDTO> data = dao.list(searchDate);
		ObjectMapper jacksonObject = new ObjectMapper();
		
		
		request.setAttribute("mainData", data);
		request.setAttribute("resultM", resultM);
		request.setAttribute("tot", tot);
		request.setAttribute("searchDate", searchDate);
	
		request.setAttribute("mainUrl", "manager/adjustment/MainPage");
	}

}
