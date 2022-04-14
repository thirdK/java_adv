package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
				content = new BoardDTO(bid,buser,btitle,bdate,bcontent);
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
			content = new BoardDTO(id,buser,btitle,bdate,bcontent);
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return content;
	}
}














