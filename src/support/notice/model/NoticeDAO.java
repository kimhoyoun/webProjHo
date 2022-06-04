package support.notice.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class NoticeDAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public NoticeDAO() {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/projectDB");
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
		public int totalCnt(){
		
		sql = "select count(*) from notice";
		
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
			
			sql = "select count(*) from notice where notice_filter = ? and INSTR(notice_title, ?) > 0";
			
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
		
		public ArrayList<NoticeDTO> list(int start, int limit){
			ArrayList<NoticeDTO> res = new ArrayList<>();
			
			sql = "select * from notice order by no desc limit ?, ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1,start);
				ptmt.setInt(2, limit);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					NoticeDTO dto = new NoticeDTO();
					// 필요한것만 보이기
					dto.setNotice_id(rs.getString("notice_id"));
					dto.setNotice_title(rs.getString("notice_title"));
					dto.setNotice_content(rs.getString("notice_content"));
					dto.setNotice_filter(rs.getString("notice_filter"));
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
			
			sql = "select * from notice where notice_filter = ? and INSTR(notice_title, ?) > 0 order by no desc limit ?, ?";
			
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
					dto.setNotice_id(rs.getString("notice_id"));
					dto.setNotice_title(rs.getString("notice_title"));
					dto.setNotice_content(rs.getString("notice_content"));
					dto.setNotice_filter(rs.getString("notice_filter"));
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
		
		
		public NoticeDTO detail(String notice_id){
			NoticeDTO dto = null;
			
			sql = "select * from notice where notice_id = ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, notice_id);
				rs = ptmt.executeQuery();
				
				if(rs.next()) {
					dto = new NoticeDTO();
					// 필요한것만 보이기
					dto.setNotice_id(rs.getString("notice_id"));
					dto.setNotice_title(rs.getString("notice_title"));
					dto.setNotice_content(rs.getString("notice_content"));
					dto.setNotice_filter(rs.getString("notice_filter"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return dto;
		}
		
		
		public void insert(NoticeDTO dto){
			
			sql = "insert into notice(notice_id, notice_title, notice_content, notice_filter, reg_date) "
					+ "values (? , ? , ? , ? ,sysdate())";
			
			dto.setNotice_id("notice"+System.currentTimeMillis());
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, dto.getNotice_id());
				ptmt.setString(2, dto.getNotice_title());
				ptmt.setString(3, dto.getNotice_content());
				ptmt.setString(4, dto.getNotice_filter());
				ptmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
		}
		
		
	public int modify(NoticeDTO dto){
			int res = 0;
			
			sql = "update notice set notice_title = ?, notice_content = ?, notice_filter = ? "
					+ "where notice_id = ?";
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, dto.getNotice_title());
				ptmt.setString(2, dto.getNotice_content());
				ptmt.setString(3, dto.getNotice_filter());
				ptmt.setString(4, dto.getNotice_id());
				res = ptmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}

		public int delete(NoticeDTO dto){
		int res = 0;
		
		sql = "delete from notice where notice_id = ?";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getNotice_id());
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
