package payment.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class PaymentDAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public PaymentDAO() {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/projectDB");
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
		public int totalCnt(){
		
		sql = "select count(*) from payment";
		
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
			
			sql = "select count(*) from payment where notice_filter = ? and INSTR(notice_title, ?) > 0";
			
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
		
		public ArrayList<PaymentDTO> list(int start, int limit){
			ArrayList<PaymentDTO> res = new ArrayList<>();
			
			sql = "select * from payment order by no desc limit ?, ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1,start);
				ptmt.setInt(2, limit);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					PaymentDTO dto = new PaymentDTO();
					// 필요한것만 보이기
					dto.setImp_uid(rs.getString("imp_uid"));
					dto.setBuyer_name(rs.getString("buyer_name"));
					dto.setMerchant_uid(rs.getString("merchant_uid"));
					dto.setId(rs.getString("id"));
					dto.setResDate(rs.getString("resdate"));
					dto.setResTime(rs.getString("restime"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setAmount(rs.getInt("amount"));
					dto.setIntRefund_reg(rs.getInt("refunt_reg"));
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
		
		public ArrayList<PaymentDTO> dateList(String resdate){
			ArrayList<PaymentDTO> res = new ArrayList<>();
			
			sql = "select * from payment where resdate = ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, resdate);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					PaymentDTO dto = new PaymentDTO();
					// 필요한것만 보이기
					dto.setImp_uid(rs.getString("imp_uid"));
					dto.setBuyer_name(rs.getString("buyer_name"));
					dto.setMerchant_uid(rs.getString("merchant_uid"));
					dto.setId(rs.getString("id"));
					dto.setResDate(rs.getString("resdate"));
					dto.setResTime(rs.getString("restime"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setAmount(rs.getInt("amount"));
					dto.setIntRefund_reg(rs.getInt("refunt_reg"));
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
		
		public ArrayList<PaymentDTO> myList(String boardId, String resdate){
			ArrayList<PaymentDTO> res = new ArrayList<>();
			
			sql = "select * from payment where id= ? and resdate = ?";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1,boardId);
				ptmt.setString(2, resdate);
				rs = ptmt.executeQuery();
				
				while(rs.next()) {
					PaymentDTO dto = new PaymentDTO();
					// 필요한것만 보이기
					dto.setImp_uid(rs.getString("imp_uid"));
					dto.setBuyer_name(rs.getString("buyer_name"));
					dto.setMerchant_uid(rs.getString("merchant_uid"));
					dto.setId(rs.getString("id"));
					dto.setResDate(rs.getString("resdate"));
					dto.setResTime(rs.getString("restime"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setAmount(rs.getInt("amount"));
					dto.setIntRefund_reg(rs.getInt("refund_reg"));
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
		
//		
//		public PaymentDTO detail(String notice_id){
//			PaymentDTO dto = null;
//			
//			sql = "select * from payment where id = ?";
//			
//			try {
//				ptmt = con.prepareStatement(sql);
//				ptmt.setString(1, notice_id);
//				rs = ptmt.executeQuery();
//				
//				if(rs.next()) {
//					dto = new PaymentDTO();
//					// 필요한것만 보이기
//					dto.setId(rs.getString("id"));
//					dto.setTitle(rs.getString("title"));
//					dto.setContent(rs.getString("content"));
//					dto.setFilter(rs.getString("filter"));
//					dto.setReg_date(rs.getTimestamp("reg_date"));
//				}
//			}catch(Exception e) {
//				e.printStackTrace();
//			}finally {
//				close();
//			}
//			
//			return dto;
//		}
		
		public void insert(PaymentDTO dto){
			
			sql = "insert into payment(imp_uid, amount, buyer_name, merchant_uid, id, resdate, restime, user_id, refund_reg, reg_date ) "
					+ "values (? , ? , ? , ?, ?, ?, ?, ?, ?, sysdate())";
			
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setString(1, dto.getImp_uid());
				ptmt.setInt(2, dto.getAmount());
				ptmt.setString(3, dto.getBuyer_name());
				ptmt.setString(4, dto.getMerchant_uid());
				ptmt.setString(5, dto.getId());
				ptmt.setString(6, dto.getResDate());
				ptmt.setString(7, dto.getResTime());
				ptmt.setString(8, dto.getUser_id());
				ptmt.setInt(9, dto.getIntRefund_reg());
				ptmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
		}
		
		
	public int modify(PaymentDTO dto){
			int res = 0;
			
			sql = "update payment set refund_reg = ? "
					+ "where imp_id = ? and merchant_id = ? ";
			try {
				ptmt = con.prepareStatement(sql);
				ptmt.setInt(1, dto.getIntRefund_reg());
				ptmt.setString(2, dto.getImp_uid());
				ptmt.setString(3, dto.getMerchant_uid());
				res = ptmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return res;
		}

		public int delete(PaymentDTO dto){
		int res = 0;
		
		sql = "delete from payment where id = ?";
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
