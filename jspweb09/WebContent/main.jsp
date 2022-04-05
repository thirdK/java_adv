<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="add.jsp" method="POST">
		<table>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>부서</th>
			</tr>
			<tr>
				<td>
					<input type="text" name="num">
				</td>
				<td>
					<input type="text" name="name">
				</td>
				<td>
					<input type="text" name="dept">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<button>추가</button>
				</td>
			</tr>
		</table>
	</form>

		<%
		request.setCharacterEncoding("UTF-8");
		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3306/school";
		String id = "root";
		String pw = "0000";

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		conn = DriverManager.getConnection(url, id, pw);

		String sql = "SELECT * FROM emp ORDER BY num DESC";
		pstmt = conn.prepareStatement(sql);
		rset = pstmt.executeQuery();
		%>
		<h3>데이터 목록</h3>

		<%
			while (rset.next()) {

			String num = rset.getString("num");
			String name = rset.getString("name");
			String dept = rset.getString("dept");
		%>
		<table>
				
				<tr>
					<td><%=num %></td>
					<td><%=name %></td>
					<td><%=dept %></td>
				</tr>
		<%
			}
		%>
		</table>
	

</body>
</html>