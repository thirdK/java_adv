<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#div_id {
	background-color: #F2EDD7;
	color: #755139;
	font-weight: 800;
	font-size: 20;
}
.alert{
	background-color : #755139;
	color : #F2EDD7;
	font-size: 60px;
}
</style>
</head>
<body>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<%@ include file="menu.jsp"%>
	<div class="container shadow mx-auto mt-5 p-5 w-75" id="div_id">
	<div class="alert" role="alert" align="center">
		로그인 성공
	</div>
	<%@ include file = "database_connect.inc" %>
		<%
		String sql = "SELECT * FROM student WHERE hakbun = ?";
		String hakbun = request.getParameter("hakbun");
		//JDBC 드라이버 로딩
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, id, pw);
		//DB 검색
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hakbun);
		rset = pstmt.executeQuery();
		//1 아이디가 디비에 없는 경우
		//2 아이디는 있는데 비번이 틀리는 경우
		//3 아이디와 비번 모두 일치하는 경우(로그인 승인)

		//질의 결과 확인
		if (!rset.isBeforeFirst()) { //넘겨받은 값이 없으면
			out.print("<script> alert('존재하지 않는 학생입니다!!');" //자바스크립트를 이용하여 경고창 띄우고
			+ "history.back();" //직전 페이지로 돌아감
			+ "</script>");
			/* response.sendRedirect("univ_db_std_form.jsp");
			 */
		} else {
			rset.next(); //rset이 가리키는 곳(커서가 가리키는 곳) 결과가 하나여도 첫번째로 이동해야함 

			out.print("학생 정보 검색 성공!!<br>");
			String db_hakbun = rset.getString("hakbun");
			String db_name = rset.getString("name");

			if (hakbun.equals(db_hakbun)) {
				session.setAttribute("hakbun", db_hakbun);
				session.setAttribute("name", db_name);

				out.print(session.getAttribute("hakbun") + "(" + session.getAttribute("name") + ") 님 방문을 환영합니다.<br>");
			}
		}
		%>
		<%@ include file="database_close.inc" %>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>

























