package support.notice.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.notice.model.NoticeDAO;
import support.notice.model.NoticeDTO;

public class NoticeModifyReg implements SupportService{
	
	public NoticeModifyReg() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		NoticeDTO dto = new NoticeDTO();
		dto.setNotice_id(request.getParameter("id"));
		dto.setNotice_title(request.getParameter("title"));
		dto.setNotice_filter(request.getParameter("filter"));
		dto.setNotice_content(request.getParameter("content"));
		
		System.out.println(dto);
		
		int res = new NoticeDAO().modify(dto);
		
		String msg = "수정 실패", goUrl = "notice/ModifyForm?id="+dto.getNotice_id()+"&page="+request.getAttribute("nowPage");
		
		if(res>0) {
			msg = "수정되었습니다.";
			goUrl = "notice/Detail?id="+dto.getNotice_id()+"&page="+request.getAttribute("nowPage");
			System.out.println(goUrl);
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "/notice/alert");
	}
}
