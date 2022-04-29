package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import dto.TrainerDTO;
import dto.UserDTO;
import util.ConnectionPool;

public class TrainerDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public TrainerDTO getTrainer(String user_no) {
		String sql = "SELECT * FROM trainer WHERE user_no = ?";
		TrainerDTO trainer = null;
		UserDTO user = (new UserDAO()).getUser(user_no);
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_no);
			rs = pstmt.executeQuery();
			rs.next();
			trainer = new TrainerDTO(
					user.getUser_no(),
					user.getUser_name(),
					user.getUser_pw(),
					user.getUser_birth(),
					user.getUser_zipcode(),
					user.getUser_addr(),
					user.getUser_addrdetail(),
					user.getUser_gender(),
					user.getUser_email(),
					user.getUser_phone(),
					user.getUser_admin(),
					user.getUser_kakao(),
					user.getUser_auth(),
					user.getUser_status(),
					rs.getString("trainer_no"),
					rs.getString("trainer_title"),
					rs.getString("trainer_content"),
					rs.getString("trainer_secret"),
					rs.getString("trainer_addr"),
					rs.getString("trainer_regdate"),
					rs.getString("trainer_images")
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
		
		return trainer;
	}
	
	public boolean changeTrainerProfile(TrainerDTO trainer) {
		int result = 0;
		String sql = "UPDATE trainer SET "
				+ "trainer_title = ?, "
				+ "trainer_content = ?, "
				+ "trainer_secret = ?,"
				+ "trainer_addr = ?, "
				+ "trainer_regdate = now(),"
				+ "trainer_images = ?"
				+ "WHERE user_no = ?";

			try {
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, trainer.getTrainer_title());
				pstmt.setString(2, trainer.getTrainer_content());
				pstmt.setString(3, trainer.getTrainer_secret());
				pstmt.setString(4, trainer.getTrainer_addr());
				pstmt.setString(5, trainer.getTrainer_images());
				pstmt.setString(6, trainer.getUser_no());
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
		return result == 1;
	}
	
	public boolean TrainerFind(String user_no) {
		String sql = "SELECT COUNT(user_no) FROM trainer WHERE user_no=?";
		int result = 0;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_no);
			rs = pstmt.executeQuery();
			
			rs.next();
			result = rs.getInt(1);
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
			} catch(Exception e) {
				throw new RuntimeException(e);
			}
		}
		return result == 1;
	}
}
