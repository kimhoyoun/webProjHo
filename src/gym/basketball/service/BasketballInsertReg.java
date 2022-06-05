package gym.basketball.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import gym.GymService;
import gym.basketball.model.BasketballDAO;
import gym.basketball.model.BasketballDTO;
import support.SupportService;
import support.notice.model.NoticeDAO;
import support.notice.model.NoticeDTO;

public class BasketballInsertReg implements GymService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("basketball");
		path = "C:\\temp\\jsp_work\\webProjectTest\\webapp\\uploadFile\\gym\\basketball";
		
		try {
			MultipartRequest mm = new MultipartRequest(
					request, 
					path,
					10*1024*1024,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);
		
		BasketballDTO dto = new BasketballDTO();
		dto.setId("basketball"+System.currentTimeMillis());
		dto.setTitle(mm.getParameter("title"));
		dto.setContents_info(mm.getParameter("contents_info"));
		dto.setContents_detail(mm.getParameter("contents_detail"));
		dto.setContents_rule(mm.getParameter("contents_rule"));
		dto.setContents_refund(mm.getParameter("contents_refund"));
		dto.setOption1((mm.getParameter("option1")!=null)? Boolean.parseBoolean(mm.getParameter("option1")):false);
		dto.setOption2((mm.getParameter("option2")!=null)? Boolean.parseBoolean(mm.getParameter("option2")):false);
		dto.setOption3((mm.getParameter("option3")!=null)? Boolean.parseBoolean(mm.getParameter("option3")):false);
		dto.setOption4((mm.getParameter("option4")!=null)? Boolean.parseBoolean(mm.getParameter("option4")):false);
		dto.setOption5((mm.getParameter("option5")!=null)? Boolean.parseBoolean(mm.getParameter("option5")):false);
		dto.setPrice_weekday_weekly(Integer.parseInt(mm.getParameter("price_weekday_weekly")));
		dto.setPrice_weekday_nighttime(Integer.parseInt(mm.getParameter("price_weekday_nighttime")));
		dto.setPrice_weekend_weekly(Integer.parseInt(mm.getParameter("price_weekend_weekly")));
		dto.setPrice_weekend_nighttime(Integer.parseInt(mm.getParameter("price_weekend_nighttime")));
		dto.setLocation(mm.getParameter("location"));
		dto.setImg(mm.getFilesystemName("img"));
		dto.setManager_id(mm.getParameter("manager_id"));
		
		new BasketballDAO().insert(dto);
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		
	
		request.setAttribute("msg", "작성되었습니다.");
		request.setAttribute("goUrl", "List");
		request.setAttribute("mainUrl", "alert");
	}
}
