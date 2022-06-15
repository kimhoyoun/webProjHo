package commu_soc.board.service;

import java.io.File;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import commu_soc.board.BoardService;
import commu_soc.board.model.BoardDAO;
import commu_soc.board.model.BoardDTO;

public class BoardDeleteReg implements BoardService{
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		if (session.getAttribute("User") == null) {
			request.setAttribute("msg", "로그인이 필요합니다.");
			request.setAttribute("goUrl", "../../member/Login");
			request.setAttribute("mainUrl", "alert");
		} else {
			try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			BoardDTO dto = new BoardDTO();
			String post_id = request.getParameter("post_id");
			String deleteCheck = request.getParameter("deleteCheck");
			BoardDTO delDTO = new BoardDAO().detail(post_id);
			
			dto.setPost_id(post_id);
			
			int res = 0;
			if(deleteCheck.equals("삭제")) {
				res = new BoardDAO().delete(dto);
			}
			
			String msg = "삭제 실패", 
					goUrl = "DeleteForm?post_id=" + dto.getPost_id()+"&page="+request.getAttribute("nowPage");
			
			
			if (res > 0) {
				
				msg = "삭제 성공";
				goUrl = "List?page=" + request.getAttribute("nowPage");
				
				if (delDTO.getUpfile() != null) {
					String images = delDTO.getUpfile();
					String[] tokens = images.split(",");
					
					String path = request.getRealPath("board");
					path = "C:/temp/jsp_work/readytoplay/webapp/uploadFile/commu/soc/board";
					
					for(int i =0; i<tokens.length; i++) {
	//					System.out.println(path + "\\" + tokens[i]);
	//					new File(path + "\\" + tokens[i]).delete();
						System.out.println(path + "/" + tokens[i]);
						new File(path + "/" + tokens[i]).delete();
					}
				}
			}
	
			request.setAttribute("msg", msg);
			request.setAttribute("goUrl", goUrl);
			request.setAttribute("mainUrl", "alert");
		}
	}
}