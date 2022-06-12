package gym.basketball.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gym.GymService;
import gym.basketball.model.BasketballDAO;
import gym.basketball.model.BasketballDTO;
import support.SupportService;
import support.notice.model.NoticeDAO;
import support.notice.model.NoticeDTO;

public class BasketballModifyReg implements GymService{
	
	public BasketballModifyReg() {
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			
		BasketballDTO dto = new BasketballDTO();
		dto.setId(request.getParameter("id"));
		dto.setSname(request.getParameter("title"));
		dto.setContents_info(request.getParameter("contents_info"));
		dto.setContents_detail(request.getParameter("contents_detail"));
		dto.setContents_rule(request.getParameter("contents_rule"));
		dto.setContents_refund(request.getParameter("contents_refund"));
		dto.setOption1((request.getParameter("option1")!=null)? Boolean.parseBoolean(request.getParameter("option1")):false);
		dto.setOption2((request.getParameter("option2")!=null)? Boolean.parseBoolean(request.getParameter("option2")):false);
		dto.setOption3((request.getParameter("option3")!=null)? Boolean.parseBoolean(request.getParameter("option3")):false);
		dto.setOption4((request.getParameter("option4")!=null)? Boolean.parseBoolean(request.getParameter("option4")):false);
		dto.setOption5((request.getParameter("option5")!=null)? Boolean.parseBoolean(request.getParameter("option5")):false);
		dto.setPrice_weekday_weekly(Integer.parseInt(request.getParameter("price_weekday_weekly")));
		dto.setPrice_weekday_nighttime(Integer.parseInt(request.getParameter("price_weekday_nighttime")));
		dto.setPrice_weekend_weekly(Integer.parseInt(request.getParameter("price_weekend_weekly")));
		dto.setPrice_weekend_nighttime(Integer.parseInt(request.getParameter("price_weekend_nighttime")));
		
		dto.setPostcode(request.getParameter("postcode"));
        dto.setAddress(request.getParameter("address"));
        dto.setAddress_detail(request.getParameter("detailAddress"));
        dto.setUnused_time(request.getParameter("unused_time"));
        
//		dto.setPostcode(map.get("postcode"));
//        dto.setAddress(map.get("address"));
//        dto.setAddress_detail(map.get("detailAddress"));
//        dto.setUnused_time(map.get("unused_time"));
		
		dto.setManager_id(request.getParameter("manager_id"));
		
		System.out.println(dto);
		
		int res = new BasketballDAO().modify(dto);
		
		String msg = "수정 실패", goUrl = "ModifyForm?id="+dto.getId()+"&page="+request.getAttribute("nowPage");
		
		if(res>0) {
			msg = "수정되었습니다.";
			goUrl = "Detail?id="+dto.getId()+"&page="+request.getAttribute("nowPage");
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("goUrl", goUrl);
		request.setAttribute("mainUrl", "alert");
	}
}
