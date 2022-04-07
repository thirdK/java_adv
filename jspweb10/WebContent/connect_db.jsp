<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//JDBC드라이버 로딩 테스트

	//드라이버 로드
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
	
	Connection conn = null;
	
	try {
		conn = DriverManager.getConnection(url, id, pw);
		out.print("SQL DB 연결 성공!! by 32임태종<br>");
	} catch (SQLException sqlerr) {
		out.print("SQL DB 연결 실패!! <br>");
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