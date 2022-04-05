<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
	
	String url = "jdbc:mysql://localhost:3306/";
	String id = "root";
	String pw = "0000";
	
	Connection conn = null; //연결객체
	PreparedStatement pstmt = null; //구문객체
	
	conn = DriverManager.getConnection(url, id, pw);
	
	String sql = "CREATE DATABASE school";//DB생성 sql 구문
	
	pstmt = conn.prepareStatement(sql);//구문을 객체에 넣어서
	
	pstmt.executeUpdate();//구문객체 실행
	
	//데이터베이스 연결 종료
	if (conn != null) {
		conn.close();
}
%>


</body>
</html>