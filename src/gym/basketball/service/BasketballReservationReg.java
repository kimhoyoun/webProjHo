package gym.basketball.service;

import java.io.IOException;
import java.math.BigDecimal;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import gym.GymService;
import gym.basketball.model.BasketballDAO;

public class BasketballReservationReg implements GymService{
	private IamportClient client;
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		this.client = new IamportClient("1906848633633616","55aa1ef5de63241781968a472e4e054658a79c5d8557efab9af8b0d29ffcf6bf896081fcadc46a87");
		String uid = request.getParameter("imp_uid");
		
		try {
			IamportResponse<Payment> paymentResponse = client.paymentByImpUid(uid);
			
			// 검증
			assertNotNull(paymentResponse.getResponse());
            assertEquals(uid, paymentResponse.getResponse().getImpUid());
            
            if(paymentResponse.getResponse().getAmount().compareTo(BigDecimal.valueOf(100)) == 0) {
    			System.out.println("검증통과");
    		}
            System.out.println(paymentResponse.getResponse());
			//TODO : 처리 로직
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO : 401 Unauthorized 
				break;
			case 404 :
				//TODO : imp_123412341234 에 해당되는 거래내역이 존재하지 않음
			 	break;
			case 500 :
				//TODO : 서버 응답 오류
				break;
			}
		} catch (IOException e) {
			//서버 연결 실패
			e.printStackTrace();
		}
		
		
		
		request.getParameter("data");
		request.setAttribute("mainUrl", BASKETBALL+"ReservationReg");
	}

}
