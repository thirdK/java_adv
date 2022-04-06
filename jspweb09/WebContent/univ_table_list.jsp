<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록 출력</title>
<style type="text/css">
#div_id{
background-color: #F2EDD7;
}
#table_id {
	color: #755139;
	font-weight: 800;
	font-size: 20;
}
 .btn btn-primary {
 	background-color: #F2EDD7;
 }
.btn btn-primary active .btn btn-primary .btn btn-primary{
	background-color: #F2EDD7;
}
</style>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<div class="container shadow mx-auto mt-5 p-5 w-75" id="div_id">
		<%
		request.setCharacterEncoding("UTF-8");
		// JDBC 드라이버 로딩
		Class.forName("com.mysql.jdbc.Driver");
		// DB연결
		String url = "jdbc:mysql://localhost:3306/university";
		String id = "root";
		String pw = "0000";

		Connection conn = null; // 디비 연결 객체
		PreparedStatement pstmt = null; // 디비에 전달할 SQL 구문객체
		ResultSet rset = null; // 디비에서 꺼내올 데이터들을 담을 객체

		conn = DriverManager.getConnection(url, id, pw);

		// 테이블 데이터 넣는 SQL
		String sql = "SELECT * FROM student";
		pstmt = conn.prepareStatement(sql);
		rset = pstmt.executeQuery();
		%>

		<table class="table table-hover" id="table_id">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">학번</th>
					<th scope="col">이름</th>
					<th scope="col">성별</th>
					<th scope="col">학년</th>
					<th scope="col">전공</th>
					<th scope="col">주소</th>
				</tr>
			</thead>
			<tbody>

				<%
					int no = 1;

				while (rset.next()) {

					String hakbun = rset.getString("hakbun");
					String name = rset.getString("name");
					String gender = rset.getString("gender");
					String year = rset.getString("year");
					String dept = rset.getString("dept");
					String addr = rset.getString("addr");
				%>

				<tr>
					<th scope="row"><%=no%></th>
					<td><%=hakbun%></td>
					<td><%=name%></td>
					<td><%=gender%></td>
					<td><%=year%></td>
					<td><%=dept%></td>
					<td><%=addr%></td>
				</tr>
				<%
					no++;
				}
				%>

			</tbody>
		</table>

		<div class="btn-group">
			<a href="univ_table_list.jsp" class="btn btn-primary active" aria-current="page">학생 목록</a>
			<a href="univ_table_input_form.jsp" class="btn btn-primary">학생 추가</a>
			<a href="#" class="btn btn-primary">학생 삭제</a>
		</div>
	</div>

	<%
		// DB 연결 종료
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	%>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>