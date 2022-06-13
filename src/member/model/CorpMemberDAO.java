package member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CorpMemberDAO {
	PreparedStatement pstmt;
	Connection con;
	ResultSet rs;
	String sql;
	
	public CorpMemberDAO() {
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:comp/env/projectDB");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	
	public int editInfo(CorpMemberDTO dto) {
		int res = 0;
		sql = "update corpmemlist set nick_name = ?, corp_name = ?, corp_regnum = ?, corp_email = ?, corp_address = ?, manager_name = ?, manager_num = ? where pid = ?";
		
		 try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getNick_name());
			pstmt.setString(2, dto.getCorp_name());
			pstmt.setLong(3, dto.getCorp_regnum());
			pstmt.setString(4, dto.getCorp_email());
			pstmt.setString(5, dto.getCorp_address());
			pstmt.setString(6, dto.getManager_name());
			pstmt.setInt(7, dto.getManager_num());
			pstmt.setString(8, dto.getPid());
			
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
	}
	
	public String emailCheck(String inputMail) {
		String res = "unuseable";
		sql = "select * from corpmemlist where corp_email=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inputMail);
			rs = pstmt.executeQuery();
			
			if (!rs.next()) {
				res = "useable";
				System.out.println("this email possible to use.");
			} else {
				res = "unuseable";
				System.out.println("this email is already in use.");
			}
		} catch (SQLException e) {
			System.out.println("email duplecation check fail");
			e.printStackTrace();
		} finally {
			close();
		}
		return res;
		
	}
	
	public int pwChange(CorpMemberDTO dto){
		int res = 0;
		sql = "update corpmemlist set pw = ? where corp_email = ?";
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,dto.getPw());
			pstmt.setString(2,dto.getCorp_email());
			
			res = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return res;
	}
	
	public ArrayList<String> memList(){
		ArrayList<String> list = new ArrayList<>();
		
		sql = "select pid from corpmemlist";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String mem = rs.getString("pid");
				
				list.add(mem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public CorpMemberDTO findId(String corp_email) {
		CorpMemberDTO res = null;
		sql = "select * from corpmemlist where corp_email=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,corp_email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = new CorpMemberDTO();
				res.setPid(rs.getString("pid"));
				res.setPw(rs.getString("pw"));
				res.setNick_name(rs.getString("nick_name"));
				res.setCorp_name(rs.getString("corp_name"));
				res.setCorp_regnum(rs.getLong("corp_regnum"));
				res.setCorp_email(rs.getString("corp_email"));
				res.setCorp_address(rs.getString("corp_address"));
				res.setManager_name(rs.getString("manager_name"));
				res.setManager_num(rs.getInt("manager_num"));
				
				System.out.println(res);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return res;
	}
	
	public CorpMemberDTO findUser(String id) {
		CorpMemberDTO res = null;
		sql = "select * from corpmemlist where pid=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = new CorpMemberDTO();
				res.setPid(rs.getString("pid"));
				res.setPw(rs.getString("pw"));
				res.setNick_name(rs.getString("nick_name"));
				res.setCorp_name(rs.getString("corp_name"));
				res.setCorp_regnum(rs.getLong("corp_regnum"));
				res.setCorp_email(rs.getString("corp_email"));
				res.setCorp_address(rs.getString("corp_address"));
				res.setManager_name(rs.getString("manager_name"));
				res.setManager_num(rs.getInt("manager_num"));
				res.setGrade(rs.getInt("grade"));
				
				System.out.println(res);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return res;
	}
	
	public void corpMemInsert(CorpMemberDTO dto) {
		sql = "insert into corpmemlist (pid, pw, nick_name, corp_name, corp_regnum, corp_email, corp_address, manager_name, manager_num, grade) values"
				+"(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		System.out.println(dto);
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getPid());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getNick_name());
			pstmt.setString(4, dto.getCorp_name());
			pstmt.setLong(5, dto.getCorp_regnum());
			pstmt.setString(6, dto.getCorp_email());
			pstmt.setString(7, dto.getCorp_address());
			pstmt.setString(8, dto.getManager_name());
			pstmt.setInt(9, dto.getManager_num());
			pstmt.setInt(10, dto.getGrade());
			
			pstmt.executeUpdate();
			
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	
	
	public void close() {
		if (rs!=null) {try { rs.close(); } catch (SQLException e) {e.printStackTrace();}}
		if (pstmt!=null) { try { pstmt.close(); } catch (SQLException e) {e.printStackTrace();}}
		if (con!=null) { try { con.close(); } catch (SQLException e) {e.printStackTrace();}}
	}
	
	
	
}
