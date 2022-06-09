package market.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MarketDAO {
	PreparedStatement pstmt;
	Connection con;
	ResultSet rs;
	String sql;
	
	public MarketDAO() {
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:comp/env/projectDB");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	
	public int modify(MarketDTO dto){
		int res = 0;
		sql = "update postlist_market set user_email = ?, user_num = ?, title = ?, check_quality = ?, "
				+ "l_category = ?, s_category = ?, delivery = ?, price = ?, content = ? where post_id = ?";
		System.out.println(dto);
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_email());
			pstmt.setInt(2,dto.getUser_num());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getCheck_quality());
			pstmt.setString(5, dto.getL_category());
			pstmt.setString(6, dto.getS_category());
			pstmt.setString(7, dto.getDelivery());
			pstmt.setInt(8, dto.getPrice());
			pstmt.setString(9, dto.getContent());
			pstmt.setString(10, dto.getPost_id());
			
			res = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return res;
	}
	
	public int delete(String user_Id){
		int res = 0;
		sql = "delete from postlist_market where post_id = ?";
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_Id);
			
			res = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return res;
	}
	
	public void addCount(String post_id){
		sql = "update postlist_market set cnt = cnt +1 where post_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, post_id);
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MarketDTO detail(String post_id){
		MarketDTO dto = null;
		sql = "select * from postlist_market where post_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, post_id);
			
			rs = pstmt.executeQuery();
			
			// 1개만 찾으면 되니까 if문으로
			if(rs.next()) {
				dto = new MarketDTO();

				dto.setPost_id(rs.getString("post_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_num(rs.getInt("user_num"));
				dto.setTitle(rs.getString("title"));
				dto.setCheck_quality(rs.getString("check_quality"));
				dto.setL_category(rs.getString("l_category"));
				dto.setS_category(rs.getString("s_category"));
				dto.setDelivery(rs.getString("delivery"));
				dto.setPrice(rs.getInt("price"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setCnt(rs.getInt("cnt"));
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}
	
	public void insert(MarketDTO dto){
		sql = "insert into postlist_market (post_id, user_id, user_email, user_num, title, "
				+ "check_quality, l_category, s_category, delivery, price, content, cnt, reg_date) values"
				+"(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, sysdate())";
		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,dto.getPost_id());
			pstmt.setString(2,dto.getUser_id());
			pstmt.setString(3,dto.getUser_email());
			pstmt.setInt(4,dto.getUser_num());
			pstmt.setString(5,dto.getTitle());
			pstmt.setString(6,dto.getCheck_quality());
			pstmt.setString(7,dto.getL_category());
			pstmt.setString(8,dto.getS_category());
			pstmt.setString(9,dto.getDelivery());
			pstmt.setInt(10,dto.getPrice());
			pstmt.setString(11,dto.getContent());
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public int totalCnt(){		
		sql = "select count(*) from postlist_market";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
	
			// 1개만 찾으면 되니까 if문으로
			if(rs.next()) {				
				return rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int myTotalCnt(String user_id){		
		sql = "select count(*) from postlist_market where user_id = ? ";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
	
			// 1개만 찾으면 되니까 if문으로
			if(rs.next()) {				
				return rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public ArrayList<MarketDTO> list(int start, int limit){
		ArrayList<MarketDTO> res = new ArrayList<MarketDTO>();
		sql = "select * from postlist_market order by post_id desc limit ?, ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MarketDTO dto = new MarketDTO();

				dto.setPost_id(rs.getString("post_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_num(rs.getInt("user_num"));
				dto.setTitle(rs.getString("title"));
				dto.setCheck_quality(rs.getString("check_quality"));
				dto.setL_category(rs.getString("l_category"));
				dto.setS_category(rs.getString("s_category"));
				dto.setDelivery(rs.getString("delivery"));
				dto.setPrice(rs.getInt("price"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setCnt(rs.getInt("cnt"));
				
				res.add(dto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return res;
	}
	
	
	public ArrayList<MarketDTO> userList(String user_id, int start, int limit ){
		ArrayList<MarketDTO> res = new ArrayList<MarketDTO>();
		sql = "select * from postlist_market where user_id = ? order by post_id desc limit ?, ? ";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, start);
			pstmt.setInt(3, limit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MarketDTO dto = new MarketDTO();

				dto.setPost_id(rs.getString("post_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_num(rs.getInt("user_num"));
				dto.setTitle(rs.getString("title"));
				dto.setCheck_quality(rs.getString("check_quality"));
				dto.setL_category(rs.getString("l_category"));
				dto.setS_category(rs.getString("s_category"));
				dto.setDelivery(rs.getString("delivery"));
				dto.setPrice(rs.getInt("price"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setCnt(rs.getInt("cnt"));
				
				res.add(dto);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return res;
	}
	
	public void close() {
		if (rs!=null) {try { rs.close(); } catch (SQLException e) {e.printStackTrace();}}
		if (pstmt!=null) { try { pstmt.close(); } catch (SQLException e) {e.printStackTrace();}}
		if (con!=null) { try { con.close(); } catch (SQLException e) {e.printStackTrace();}}
	}
}
