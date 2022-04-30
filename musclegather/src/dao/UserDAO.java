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

	// getUser는 user_no으로 user테이블 정보를 가져옵니다.
	// 추가프로필 (Trainer/Gym 테이블) 정보는 가져오지 않으므로 주의
	public UserDTO getUser(String user_no) {
		String sql = "SELECT * FROM user WHERE user_no = ?";
		UserDTO user = null;

		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_no);
			rs = pstmt.executeQuery();
			rs.next();

			user = new UserDTO(user_no, rs.getString("user_name"), rs.getString("user_pw"), rs.getString("user_birth"),
					rs.getString("user_zipcode"), rs.getString("user_addr"), rs.getString("user_addrdetail"),
					rs.getString("user_gender"), rs.getString("user_email"), rs.getString("user_phone"),
					rs.getString("user_admin"), rs.getString("user_kakao"), rs.getString("user_auth"),
					rs.getString("user_status"));
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// null이 아니면 close(메모리에서 해제)시킨다.
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				throw new RuntimeException(e);
				// 만약 예상못한 예외 발생시 메모리에서 해제가 안되면 문제가 생길 수 있으므로
				// 런타임에러 발생시켜서 강종합니다.
			}
		}
		return user;
	}

	public boolean checkPw(String user_no, String user_pw) {
		UserDTO user = getUser(user_no);
		return user.getUser_pw().equals(user_pw);
	}

	public boolean changeUserInfo(UserDTO user) {
		int result = 0;

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
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		return result == 1;
	}

	public boolean deleteUserInfo(String user_no) {
		int result = 0;

		String sql = "UPDATE user SET user_status = 1 WHERE user_no = ?";
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_no);

			result = pstmt.executeUpdate();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		return result == 1;
	}

	public int login(String user_email, String user_pw) throws NamingException, SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		if (user_pw != null) {

			try {
				String sql = "SELECT user_email, user_pw FROM user where user_email = ?";

				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user_email);
				rs = pstmt.executeQuery();

				if (!rs.next())
					return 1; // 회원이 아닌 경우
				if (!user_pw.equals(rs.getString("user_pw")))
					return 2; // 암호 틀린 경우

				return 0;
			} finally {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			}
		} else {
			return 2;

		}
	}// 메닫중

	public UserDTO getUser(String user_email, int flag) throws NamingException, SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM user WHERE user_email = ?";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_email);
			rs = pstmt.executeQuery();

			rs.next();

			String user_no = rs.getString(1);
			String user_name = rs.getString(2);
			String user_pw = rs.getString(3);
			String user_birth = rs.getString(4);
			String user_zipcode = rs.getString(5);
			String user_addr = rs.getString(6);
			String user_addrdetail = rs.getString(7);
			String user_gender = rs.getString(8);
			String email = rs.getString(9);
			String user_phone = rs.getString(10);
			String user_admin = rs.getString(11);
			String user_kakao = rs.getString(12);
			String user_auth = rs.getString(13);
			String user_status = rs.getString(14);

			UserDTO user = new UserDTO(user_no, user_name, user_pw, user_birth, user_zipcode, user_addr,
					user_addrdetail, user_gender, email, user_phone, user_admin, user_kakao, user_auth, user_status);

			return user;

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

	}
}
