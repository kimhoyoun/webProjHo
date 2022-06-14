package gym.basketball.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gym.basketball.model.BasketballDAO;
import gym.basketball.model.BasketballDTO;
import market.Market_Service;
import market.model.MarketDAO;
import market.model.MarketDTO;

public class BasketballUploadImgEdit_Reg implements Market_Service{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String post_id = request.getParameter("post_id");
		BasketballDTO delDTO = new BasketballDAO().detail(post_id);

//		int res = new BasketballDAO().modifyFile(post_id);
		if (res > 0) {
			if (delDTO.getImg() != null) {
				String images = delDTO.getImg();
				String[] tokens = images.split(",");

				String path = request.getRealPath("board");
				path = "C:\\temp\\jsp_work\\readytoplay\\webapp\\uploadFile\\gym\\basketball";
				
				for (int i = 0; i < tokens.length; i++) {
					System.out.println(path + "\\" + tokens[i]);
					new File(path + "\\" + tokens[i]).delete();
				}
			}
		}

		request.setAttribute("mainUrl", "market/PostModify");
	}
}
