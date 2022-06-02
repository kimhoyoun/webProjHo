package support.faq.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import support.SupportService;
import support.faq.model.FaqDAO;
import support.faq.model.FaqDTO;
import support.notice.model.NoticeDAO;
import support.notice.model.NoticeDTO;

public class FaqModifyReg implements SupportService{
	
	public FaqModifyReg() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		FaqDTO dto = new FaqDTO();
		dto.setId(request.getParameter("id"));
		dto.setQuestion(request.getParameter("question"));
		dto.setAnswer(request.getParameter("answer"));
		
		System.out.println(dto);
		
		
		int res = new FaqDAO().modify(dto);
		
		String msg = "수정 실패", goUrl = "faq/List?page="+request.getAttribute("nowPage");
		
		if(res>0) {
			msg = "수정되었습니다.";
			goUrl = "faq/List?page="+request.getAttribute("nowPage");
			System.out.println(goUrl);
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "/faq/alert");
	}
}
