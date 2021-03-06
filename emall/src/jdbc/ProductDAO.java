package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.naming.NamingException;

import util.ConnectionPool;
public class ProductDAO{
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	public ArrayList<ProductDTO> getList() throws NamingException, SQLException{
		
		ArrayList<ProductDTO> products = new ArrayList<>();
		try {
			String sql = "SELECT * FROM product";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				products.add(new ProductDTO(rs.getString("pid"),
						rs.getString("pname"),
						rs.getString("pprice"),
						rs.getString("pdesc"),
						rs.getString("pmanu"),
						rs.getString("pcate"),
						rs.getString("pcondi"),
						rs.getString("pimage")
						));
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		return products;
	}
	
	public ProductDTO getDetail(String pid) throws NamingException, SQLException{
		String sql = "SELECT * FROM product WHERE pid= ?";
		ProductDTO product = null;
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pid);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String id = rs.getString(1);
			String pname = rs.getString(2);
			String pprice = rs.getString(3);
			String pdesc = rs.getString(4);
			String pmanu = rs.getString(5);
			String pcate = rs.getString(6);
			String pcondi = rs.getString(7);
			String pimage = rs.getString(8);
			
			product = new ProductDTO(id, pname, pprice, pdesc, pmanu, pcate, pcondi, pimage);
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
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
	
		return product;
		
	}
	
	
	public boolean insert(String pid, String pname, String pprice, String pdesc, String pmanu, String pcate,
			String pcondi, String pimage) throws NamingException, SQLException {
		int result = 0;
		String sql = "INSERT INTO product VALUES(?,?,?,?,?,?,?,?)";
		
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pid);
			pstmt.setString(2, pname);
			pstmt.setString(3, pprice);
			pstmt.setString(4, pdesc);
			pstmt.setString(5, pmanu);
			pstmt.setString(6, pcate);
			pstmt.setString(7, pcondi);
			pstmt.setString(8, pimage);
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
	
	
	
	//???????????? ????????? ???????????? ?????? ?????????(1?????? ????????????)
	public boolean insert(String pid, String pname, String pprice, String pdesc, String pmanu, String pcate,
			String pcondi, ArrayList<String> arr) throws NamingException, SQLException {
		int result = 0;
		String sql = "INSERT INTO product VALUES(?,?,?,?,?,?,?,?)";
		
		String pimages = "";
		for(String str : arr) {
			pimages += str+"/";
		}
		//pimages??? ????????????+"/"??? ????????? img01, img02??? ?????????
		// "img01/img02/"??? ?????????
		
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pid);
			pstmt.setString(2, pname);
			pstmt.setString(3, pprice);
			pstmt.setString(4, pdesc);
			pstmt.setString(5, pmanu);
			pstmt.setString(6, pcate);
			pstmt.setString(7, pcondi);
			pstmt.setString(8, pimages);	//????????? "/"??? ????????? ????????? DB??? ??????
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
















