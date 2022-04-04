<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
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
<h1>게시물 확인하기</h1>
<form action = "input.jsp">
<button>돌아가기</button>
</form>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String sql = "SELECT * FROM test1 ORDER BY num DESC";
	String url = "jdbc:mysql://localhost:3306/test";
	String id = "root";
	String pw = "0000";
	
	Class.forName("com.mysql.jdbc.Driver");
	
	
	conn = DriverManager.getConnection(url, id, pw);
	
	pstmt = conn.prepareStatement(sql);
	
	rset = pstmt.executeQuery();
	
	while(rset.next()){
		int num = rset.getInt(1); 
		String name = rset.getString(2);
		String content = rset.getString(3);
	%>
		<table>
			<tr>
				<td colspan="2"><hr></td>
			</tr>
			<tr> 
				<td><%=num %></td>
				<td><%=name %></td>
			</tr>
			<tr>
				<td colspan="2"><%=content %></td>
			</tr>
		</table>	
<%	}%>

</body>
</html>