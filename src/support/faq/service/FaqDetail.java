package support.faq.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import support.SupportService;

public class FaqDetail implements SupportService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		request.setAttribute("mainUrl", "/faq/Detail");
	}

}
