package dbconnclose;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnClose {
	public static Connection getConnection() {
		Connection conn = null; // 디비 연결 객체
		String url = "";
		String id = "";
		String pw = "";
		
		try {
			// JDBC 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			// DB연결
			url = "jdbc:mysql://localhost:3306/shopmall";
			id = "root";
			pw = "0000";

			conn = DriverManager.getConnection(url, id, pw);
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} catch (Exception e) {
			System.out.println("예상치 못한 예외 발생 " + e.getMessage());
		}
		return conn;
	}
	
	public static void resourceClose(ResultSet rset, Statement pstmt, Connection conn) {
		try {
			if(rset != null) rset.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	public static void resourceClose(Statement pstmt, Connection conn) {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
}
