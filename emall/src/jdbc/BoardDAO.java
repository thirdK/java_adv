package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class BoardDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<BoardDTO> getContents(){
		ArrayList<BoardDTO> contents = new ArrayList<BoardDTO>();
		BoardDTO content = null;
		String sql = "SELECT * FROM board";
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String bid = rs.getString("bid");
				String buser = rs.getString("buser");
				String btitle = rs.getString("btitle");
				String bdate = rs.getString("bdate");
				String bcontent = rs.getString("bcontent");
				String bimage = rs.getString("bimage");
				content = new BoardDTO(bid,buser,btitle,bdate,bcontent, bimage);
				contents.add(content);
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return contents;
		
	}
	
	public BoardDTO getCon(String bid) {
		BoardDTO content = null;
		String sql = "SELECT * FROM board WHERE bid= ?";
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bid);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String id = rs.getString("bid");
			String buser = rs.getString("buser");
			String btitle = rs.getString("btitle");
			String bdate = rs.getString("bdate");
			String bcontent = rs.getString("bcontent");
			String bimage = rs.getString("bimage");
			content = new BoardDTO(id,buser,btitle,bdate,bcontent, bimage);
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return content;
	}
	
	public boolean insert(String btitle, String bcontent, String buser, String bimage) {
		String sql = "INSERT INTO board	VALUES(0,?,?,?,?,?)";
		int result = 0;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, buser);
			pstmt.setString(2, btitle);
			pstmt.setString(3, LocalDate.now().toString());
			pstmt.setString(4, bcontent);
			pstmt.setString(5, bimage);
			
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
}














