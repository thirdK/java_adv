<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
	//JDBC 드라이버 로딩
Class.forName("com.mysql.jdbc.Driver");
//DB연결
String url = "jdbc:mysql://localhost:3306/univ";
String id = "root";
String pw = "0000";

Connection conn = null; // 디비 연결 객체
PreparedStatement pstmt = null; // 디비에 전달할 SQL 구문객체

conn = DriverManager.getConnection(url, id, pw);

//테이블 데이터 넣는 SQL
String hakbun = request.getParameter("hakbun");
String name = request.getParameter("name");
String dept = request.getParameter("dept");

String sql = "INSERT INTO student VALUES(?,?,?)";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, hakbun);
pstmt.setString(2, name);
pstmt.setString(3, dept);
pstmt.executeUpdate();

//DB 연결 종료
if (pstmt != null)
	pstmt.close();
if (conn != null)
	conn.close();

out.print("DB 데이터 삽입 성공 by 32임태종");

response.sendRedirect("univ_table_input.html");
%>