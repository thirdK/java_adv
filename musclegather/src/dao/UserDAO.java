package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import dto.UserDTO;
import util.ConnectionPool;

public class UserDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	//getUser는 user_no으로 user테이블 정보를 가져옵니다.
	//추가프로필 (Trainer/Gym 테이블) 정보는 가져오지 않으므로 주의
	public UserDTO getUser(int user_no) {
		String sql = "SELECT * FROM user WHERE user_no = ?";
		UserDTO user = null;
		
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_no);
			rs = pstmt.executeQuery();
			rs.next();
			
			user = new UserDTO(
					user_no+"", 
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
}
