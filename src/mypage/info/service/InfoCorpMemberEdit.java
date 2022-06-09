package mypage.info.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.CorpMemberDTO;
import mypage.MypageService;


public class InfoCorpMemberEdit implements MypageService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		CorpMemberDTO dto = (CorpMemberDTO)session.getAttribute("User");
		String[] email_arr = dto.getCorp_email().split("@");
		
		
		
		request.setAttribute("email", email_arr[0]);
		request.setAttribute("email_adress", email_arr[1]);
		request.setAttribute("user_data", dto);
		request.setAttribute("mainUrl", "mypage/info/CorpMemberEdit");
	}
	
}
