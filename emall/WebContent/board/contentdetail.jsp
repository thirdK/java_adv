<%@page import="jdbc.BoardDAO"%>
<%@page import="jdbc.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
.contentdetail-table {
	margin: 20px;
}
</style>
</head>
<body>
	<%@include file="/_header.jsp"%>

	<%!//선언문
	String title = "게시물 보기";%>
	<div class="alert alert-secondary" role="alert" id="div-welcome1">
		<div class="container">
			<h1 class="display-3"><%=title%></h1>
		</div>
	</div>
	<%
		String bid = request.getParameter("bid");
	BoardDTO content = (new BoardDAO()).getCon(bid);
	%>
	<div align="center">
		<form action="board.jsp">
			<table class="contentdetail-table">
				<tr>
					<th>글쓴이 :</th>
					<td><%=content.getBuser()%></td>
				</tr>
				<tr>
					<th>날짜 :</th>
					<td><%=content.getBdate()%></td>
				</tr>
				<tr>
					<td colspan="2">
						<hr>
					</td>
				</tr>
				<tr>
					<th>내용</th>
				</tr>
				<tr>
					<td>
						<br><%=content.getBcontent()%></td>
				</tr>
			</table>
			<div>
				<button>뒤로가기</button>
			</div>
		</form>
	</div>





	<%@include file="/_footer.jsp"%>
</body>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>