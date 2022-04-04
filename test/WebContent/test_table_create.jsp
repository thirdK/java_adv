<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean class="com.conn.test.MemberDAO" id="con"/>
<%

Connection conn = null;
try {
	String url = "jdbc:mysql://localhost:3306/test";
	String id = "root";
	String pw = "0000";
	
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(url, id, pw);
} catch (ClassNotFoundException e) {
	System.out.println("드라이버 로딩 실패");
} catch (SQLException e) {
	System.out.println("DB 접속 실패");
} catch (Exception e) {
	System.out.println("알 수 없는 오류 " + e);
}

try {
	PreparedStatement pstm = null;
	
	String sql = "CREATE TABLE test1("
			+ "num int not null,"
			+ "name varchar(20),"
			+ "birthday DATE,"
			+ "primary key(num))";
	
	pstm = conn.prepareStatement(sql);
	pstm.executeUpdate();
} catch (SQLException e) {
	System.out.println("Table_create 오류" + e);
}

%>

</body>
</html>