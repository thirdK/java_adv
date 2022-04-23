package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class JoinDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<String> getToList(String user_no, int start, int limit) {
		String sql = "SELECT user_to_no FROM resume WHERE user_from_no = ? LIMIT ?,?";
		ArrayList<String> toList = new ArrayList<String>(); 
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_no);
			pstmt.setInt(2, start);
			pstmt.setInt(3, limit);
			
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
	
	public ArrayList<String> getFromList(String user_no, int start, int limit) {
		String sql = "SELECT user_from_no FROM resume WHERE user_to_no = ? LIMIT ?,?";
		ArrayList<String> fromList = new ArrayList<String>(); 
		
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_no);
			pstmt.setInt(2, start);
			pstmt.setInt(3, limit);
			
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
	
	public int getToRow(String user_no) {
		String sql = "SELECT COUNT(user_to_no) FROM resume WHERE user_from_no = ?";
		int result=0;
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
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		return result;
	}
	
	public int getFromRow(String user_no) {
		String sql = "SELECT COUNT(user_from_no) FROM resume WHERE user_to_no = ?";
		int result=0;
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
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		return result;
	}
	
}























