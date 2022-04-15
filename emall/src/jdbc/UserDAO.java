package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.naming.NamingException;

import util.ConnectionPool;

public class UserDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	
	public int insert(String uid, String upw, String uname, String ugender, String ubirth, String uemail, String uphone,
			String uaddr) throws NamingException, SQLException {
		
		
		int result = 0;
		String sql = "INSERT INTO user VALUES(?,?,?,?,?,?,?,?,?)";
		
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, upw);
			pstmt.setString(3, uname);
			pstmt.setString(4, ugender);
			pstmt.setString(5, ubirth);
			pstmt.setString(6, uemail);
			pstmt.setString(7, uphone);
			pstmt.setString(8, uaddr);
			pstmt.setString(9, LocalDate.now().toString());
			result = pstmt.executeUpdate();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		
		return result;
	}
	
	public int login(String uid, String upw) throws NamingException, SQLException{
		int result = 0;
		String sql = "SELET uid, upw FROM user WHERE uid = ?";
		
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			if(!rs.next()) result = 1;
			else if(!upw.equals(rs.getNString("upw"))) result = 2;
			else result = 0;
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
