<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 생성</title>
</head>
<body>

	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		out.print("JDBC Driver loading 성공!! by 32임태종<br>");
	} catch (ClassNotFoundException err) {
		out.print("JDBC Driver loading 실패!!<br>");
	}
	
	//DB 연결
		String url = "jdbc:mysql://localhost:3306/";
		String id = "root";
		String pw = "0000";
		
		Connection conn = null;			//연결객체
		PreparedStatement pstmt = null;	//구문객체
		
		try {
			conn = DriverManager.getConnection(url, id, pw);
			out.print("SQL DB 연결 성공!! by 32임태종<br>");
			
			String sql = "CREATE DATABASE univ";//DB생성 sql 구문
			
			pstmt = conn.prepareStatement(sql);//구문을 객체에 넣어서
			
			pstmt.executeUpdate();//구문객체 실행
			
			out.print("univ 데이터베이스 생성 성공!!<br>");
			
		} catch (SQLException sqlerr) {
			out.print("univ 데이터베이스 생성 실패!!<br>");
		}finally{
			//데이터베이스 연결 종료
			if(conn != null){
				try {
					conn.close();
					out.print("SQL 서버 연결 종료<br>");
				} catch (Exception conerr){
					conerr.printStackTrace();
				}
			}
		}
	%>

</body>
</html>