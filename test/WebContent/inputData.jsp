<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
		request.setCharacterEncoding("UTF-8");
		Connection conn = null;
		PreparedStatement psmt = null;
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		String url = "jdbc:mysql://localhost:3306/test";
		String id = "root";
		String pw = "0000";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, id, pw);
		
		
		Integer num = Integer.parseInt(request.getParameter("num"));
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		String date = request.getParameter("date");
		
		String sql = "INSERT INTO test1 VALUES(?,?,?)";
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, num);
		psmt.setString(2, name);
		psmt.setString(3, content);
		
		psmt.executeUpdate();

		if(psmt != null) psmt.close();
		if(conn != null) conn.close();
		
		response.sendRedirect("main.jsp");
	%>
</body>
</html>














