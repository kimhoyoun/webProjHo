package gym.basketball.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import support.notice.model.NoticeDTO;

public class BasketballDAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public BasketballDAO() {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/projectDB");
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
		public int totalCnt(){
		
		sql = "select count(*) from gym_basketball";
		
		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			
			rs.next();
			
			return rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
		
		public int totalCntSearch(String filter, String keyword){
			
			sql = "select count(*) from gym_basketball where notice_filter = ? and INSTR(notice_title, ?) > 0";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,filter);
				ptmt.setString(2,keyword);
				rs = ptmt.executeQuery();
				
				rs.next();
				
				return rs.getInt(1);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return 0;
		}
		
		public ArrayList<BasketballDTO> list(int start, int limit){
			ArrayList<BasketballDTO> res = new ArrayList<>();
			
			sql = "select * from gym_basketball order by no desc limit ?, ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1,start);
				ptmt.setInt(2, limit);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					BasketballDTO dto = new BasketballDTO();
					// 필요한것만 보이기
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setContents_info(rs.getString("contents_info"));
					dto.setContents_detail(rs.getString("contents_detail"));
					dto.setContents_rule(rs.getString("contents_rule"));
					dto.setContents_refund(rs.getString("contents_refund"));
					dto.setLocation(rs.getString("location"));
					dto.setImg(rs.getString("img"));
					dto.setManager_id(rs.getString("manager_id"));
					dto.setPrice_weekday_weekly(rs.getInt("price_weekday_weekly"));
					dto.setPrice_weekday_nighttime(rs.getInt("price_weekday_nighttime"));
					dto.setPrice_weekend_weekly(rs.getInt("price_weekend_weekly"));
					dto.setPrice_weekend_nighttime(rs.getInt("price_weekend_nighttime"));
					dto.setOption1(rs.getInt("option1"));
					dto.setOption2(rs.getInt("option2"));
					dto.setOption3(rs.getInt("option3"));
					dto.setOption4(rs.getInt("option4"));
					dto.setOption5(rs.getInt("option5"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					
					
					res.add(dto);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}
		
		
		public ArrayList<NoticeDTO> search(int start, int limit, String filter, String keyword){
			ArrayList<NoticeDTO> res = new ArrayList<>();
			
			sql = "select * from gym_basketball where filter = ? and INSTR(title, ?) > 0 order by no desc limit ?, ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,filter);
				ptmt.setString(2,keyword);
				ptmt.setInt(3,start);
				ptmt.setInt(4, limit);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					NoticeDTO dto = new NoticeDTO();
					// 필요한것만 보이기
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setFilter(rs.getString("filter"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					
					
					res.add(dto);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}
		
		
		public BasketballDTO detail(String id){
			BasketballDTO dto = null;
			
			sql = "select * from gym_basketball where id = ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, id);
				rs = ptmt.executeQuery();
				
				if(rs.next()) {
					dto = new BasketballDTO();
					
					dto.setId(rs.getString("id"));
					dto.setTitle(rs.getString("title"));
					dto.setContents_info(rs.getString("contents_info"));
					dto.setContents_detail(rs.getString("contents_detail"));
					dto.setContents_rule(rs.getString("contents_rule"));
					dto.setContents_refund(rs.getString("contents_refund"));
					dto.setLocation(rs.getString("location"));
					dto.setImg(rs.getString("img"));
					dto.setManager_id(rs.getString("manager_id"));
					dto.setPrice_weekday_weekly(rs.getInt("price_weekday_weekly"));
					dto.setPrice_weekday_nighttime(rs.getInt("price_weekday_nighttime"));
					dto.setPrice_weekend_weekly(rs.getInt("price_weekend_weekly"));
					dto.setPrice_weekend_nighttime(rs.getInt("price_weekend_nighttime"));
					dto.setOption1(rs.getInt("option1"));
					dto.setOption2(rs.getInt("option2"));
					dto.setOption3(rs.getInt("option3"));
					dto.setOption4(rs.getInt("option4"));
					dto.setOption5(rs.getInt("option5"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return dto;
		}
		
		
		public void insert(BasketballDTO dto){
			
			sql = "INSERT INTO gym_basketball (id, title, contents_info, contents_detail, contents_rule,"
					+ "contents_refund, location, price_weekday_weekly, price_weekday_nighttime, price_weekend_weekly,"
					+ "price_weekend_nighttime, option1, option2, option3, option4, option5, img, manager_id, reg_date)"
					+ "values (? , ? , ? , ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate())";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, dto.getId());
				ptmt.setString(2, dto.getTitle());
				ptmt.setString(3, dto.getContents_info());
				ptmt.setString(4, dto.getContents_detail());
				ptmt.setString(5, dto.getContents_rule());
				ptmt.setString(6, dto.getContents_refund());
				ptmt.setString(7, dto.getLocation());
				ptmt.setInt(8, dto.getPrice_weekday_weekly());
				ptmt.setInt(9, dto.getPrice_weekday_nighttime());
				ptmt.setInt(10, dto.getPrice_weekend_weekly());
				ptmt.setInt(11, dto.getPrice_weekend_nighttime());
				ptmt.setInt(12, dto.getIntOption1());
				ptmt.setInt(13, dto.getIntOption2());
				ptmt.setInt(14, dto.getIntOption3());
				ptmt.setInt(15, dto.getIntOption4());
				ptmt.setInt(16, dto.getIntOption5());
				ptmt.setString(17, dto.getImg());
				ptmt.setString(18, dto.getManager_id());
				
				ptmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
		}
		
		
	public int modify(BasketballDTO dto){
			int res = 0;
			
			sql = "update gym_basketball set title = ?, contents_info = ?, contents_detail = ?, contents_rule = ?, contents_refund = ?, "
					+"location = ?, price_weekday_weekly = ?, price_weekday_nighttime = ?, price_weekend_weekly = ?, price_weekend_nighttime = ?,"
					+ "option1 = ?, option2 = ?, option3 = ?, option4 = ?, option5 = ? "
					+ "where id = ?";
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, dto.getTitle());
				ptmt.setString(2, dto.getContents_info());
				ptmt.setString(3, dto.getContents_detail());
				ptmt.setString(4, dto.getContents_rule());
				ptmt.setString(5, dto.getContents_refund());
				ptmt.setString(6, dto.getLocation());
				ptmt.setInt(7, dto.getPrice_weekday_weekly());
				ptmt.setInt(8, dto.getPrice_weekday_nighttime());
				ptmt.setInt(9, dto.getPrice_weekend_weekly());
				ptmt.setInt(10, dto.getPrice_weekend_nighttime());
				ptmt.setInt(11, dto.getIntOption1());
				ptmt.setInt(12, dto.getIntOption2());
				ptmt.setInt(13, dto.getIntOption3());
				ptmt.setInt(14, dto.getIntOption4());
				ptmt.setInt(15, dto.getIntOption5());
				ptmt.setString(16, dto.getId());
				res = ptmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}

		public int delete(BasketballDTO dto){
		int res = 0;
		
		sql = "delete from gym_basketball where id = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getId());
			res = ptmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
		public void close() {
			if(rs!=null) {try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
			if(ptmt!=null) {try {ptmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if(con!=null) {try {con.close();} catch (SQLException e) {e.printStackTrace();}}
		}
}
