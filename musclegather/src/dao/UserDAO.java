package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import dto.UserDTO;
import util.ConnectionPool;

public class UserDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	//getUser는 user_no으로 user테이블 정보를 가져옵니다.
	//추가프로필 (Trainer/Gym 테이블) 정보는 가져오지 않으므로 주의
	public UserDTO getUser(String user_no) {
		String sql = "SELECT * FROM user WHERE user_no = ?";
		UserDTO user = null;
		
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_no);
			rs = pstmt.executeQuery();
			rs.next();
			
			user = new UserDTO(
					user_no, 
					rs.getString("user_name"),
					rs.getString("user_pw"), 
					rs.getString("user_birth"), 
					rs.getString("user_zipcode"),
					rs.getString("user_addr"), 
					rs.getString("user_addrdetail"), 
					rs.getString("user_gender"), 
					rs.getString("user_email"), 
					rs.getString("user_phone"),
					rs.getString("user_admin"), 
					rs.getString("user_kakao"), 
					rs.getString("user_auth"), 
					rs.getString("user_status") 
					);
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				//null이 아니면 close(메모리에서 해제)시킨다.
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				throw new RuntimeException(e);
				//만약 예상못한 예외 발생시 메모리에서 해제가 안되면 문제가 생길 수 있으므로
				//런타임에러 발생시켜서 강종합니다.
			}
		}
		return user;
	}
	
	public boolean checkPw(String user_no, String user_pw) {
		UserDTO user = getUser(user_no);
		return user.getUser_pw().equals(user_pw);
	}
	
	public boolean changeUserInfo(UserDTO user) {
		int result=0;

		String sql = "UPDATE user SET user_name = ?, user_pw = ?, user_birth = ?,user_zipcode = ?, user_addr = ?,user_addrdetail = ?,user_gender = ?, user_phone = ? WHERE user_no = ?";
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUser_name());
			pstmt.setString(2, user.getUser_pw());
			pstmt.setString(3, user.getUser_birth());
			pstmt.setString(4, user.getUser_zipcode());
			pstmt.setString(5, user.getUser_addr());
			pstmt.setString(6, user.getUser_addrdetail());
			pstmt.setString(7, user.getUser_gender());
			pstmt.setString(8, user.getUser_phone());
			pstmt.setInt(9, Integer.parseInt(user.getUser_no()));
			
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
		return result==1;
	}
	
	public ArrayList<String> getToList(String user_no) {
		String sql = "SELECT user_to_no FROM resume WHERE user_from_no = ?";
		ArrayList<String> toList = new ArrayList<String>(); 
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_no);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				toList.add(rs.getString(1));
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		return toList;
	}
	
	public ArrayList<String> getFromList(String user_no) {
		String sql = "SELECT user_From_no FROM resume WHERE user_to_no = ?";
		ArrayList<String> fromList = new ArrayList<String>(); 
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_no);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				fromList.add(rs.getString(1));
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		return fromList;
	}
}
