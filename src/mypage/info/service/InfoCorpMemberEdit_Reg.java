package mypage.info.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.CorpMemberDAO;
import member.model.CorpMemberDTO;
import mypage.MypageService;


public class InfoCorpMemberEdit_Reg implements MypageService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pid = request.getParameter("pid");
		String nick_name = request.getParameter("nick_name");
		String corp_name = request.getParameter("corp_name");
		Long corp_regnum = Long.parseLong((String)request.getParameter("corp_regnum")); 
		String corp_address = request.getParameter("corp_address");
		String manager_name = request.getParameter("manager_name");
		int manager_num = Integer.parseInt((String)request.getParameter("manager_num")); 
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = email1 + "@" + email2;
		
		CorpMemberDTO dto = new CorpMemberDTO();
		
		dto.setPid(pid);
		dto.setNick_name(nick_name);
		dto.setCorp_name(corp_name);
		dto.setCorp_regnum(corp_regnum);
		dto.setCorp_address(corp_address);
		dto.setManager_name(manager_name);
		dto.setManager_num(manager_num);
		dto.setCorp_email(email);
		
		CorpMemberDAO dao = new CorpMemberDAO();
		
		dao.editInfo(dto);
		dto = dao.findUser(dto.getPid());
		
		HttpSession session = request.getSession();
		session.setAttribute("User", dto);
		
		request.setAttribute("msg", "회원정보가 수정되었습니다.");
		request.setAttribute("mainUrl", "alert");
		request.setAttribute("goUrl", "InputPass");
	}

}
