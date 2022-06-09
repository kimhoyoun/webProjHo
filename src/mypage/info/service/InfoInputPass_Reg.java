package mypage.info.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.CorpMemberDTO;
import member.model.MemberDTO;
import mypage.MypageService;


public class InfoInputPass_Reg implements MypageService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();			
		
		String user_pw = request.getParameter("user_pw");
		String msg = "비밀번호를 확인해주세요";
		String goUrl = "InputPass";
		
		
		Object user = session.getAttribute("User");
		
		if(user instanceof MemberDTO) {
			MemberDTO dto = (MemberDTO)user;
			if (dto.getPw().equals(user_pw)) {
				msg = "확인되었습니다.";
				goUrl = "MemberEdit";
			} else {
				msg = "비밀번호를 확인해주세요";
				goUrl = "InputPass";
			}
			
		}else if(user instanceof CorpMemberDTO) {
			CorpMemberDTO dto = (CorpMemberDTO)user;
			if (dto.getPw().equals(user_pw)) {
				System.out.println("여기");
				msg = "확인되었습니다.";
				goUrl = "CorpMemberEdit";
			} else {
				msg = "비밀번호를 확인해주세요";
				goUrl = "InputPass";
			}
			
		}
		
		
		request.setAttribute("msg", msg);
		request.setAttribute("mainUrl", "alert");
		request.setAttribute("goUrl", goUrl); //Controller에서 nowpage를 Attribute로 전달받아 로그인 전 조회중이던 페이지로 이동해야함
		
	}

}
