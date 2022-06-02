package support.notice.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;
import support.notice.model.NoticeDAO;

public class NoticeModifyForm implements SupportService{
	
	public NoticeModifyForm() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		NoticeDAO dao = new NoticeDAO();
		
		Object data = dao.detail(id);
		
		request.setAttribute("dto", data);
		request.setAttribute("mainUrl", "/notice/ModifyForm");
		System.out.println("BoardDetail execute() "+data);
	}
}
