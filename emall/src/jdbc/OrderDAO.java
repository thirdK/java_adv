package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class OrderDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<OrderDTO> getList() {
		String sql = "SELECT * FROM `orders`";
		ArrayList<OrderDTO> orders = new ArrayList<OrderDTO>();
		OrderDTO order = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				order = new OrderDTO(
						rs.getInt("oid"),
						rs.getString("opid"),
						rs.getString("ouid"),
						rs.getString("opname"),
						rs.getString("oprice"),
						rs.getString("ostatus"),
						rs.getString("odate"),
						rs.getString("ograde"),
						rs.getString("ocomm")
						);
				orders.add(order);
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
		
		
		return orders;
	}
	
	
	public ArrayList<OrderDTO> getList(String status) {
		
		String sql = "SELECT * FROM `orders` WHERE ostatus = ?";
		ArrayList<OrderDTO> orders = new ArrayList<OrderDTO>();
		OrderDTO order = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, status);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				order = new OrderDTO(
						rs.getInt("oid"),
						rs.getString("opid"),
						rs.getString("ouid"),
						rs.getString("opname"),
						rs.getString("oprice"),
						rs.getString("ostatus"),
						rs.getString("odate"),
						rs.getString("ograde"),
						rs.getString("ocomm")
						);
				orders.add(order);
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
		
		
		return orders;
	}
	
	//구매 시작 메소드	status 1 고객
	public int insert() {
		String sql = "";
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 1;
	}
	
	//입금 확인 메소드	status 2 고객
	public int confrim() {
		String sql = "";
		
		return 1;
	}
	
	// 발송 메소드 status 3 판매자
	public int delivery() {
		
		return 1;
	}

	// 리뷰 status 4 고객
	public int review() {
		
		return 1;
	}
}
