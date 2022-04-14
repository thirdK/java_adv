<%@page import="jdbc.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<%@include file="/_header.jsp"%>

	<%!//선언문
	String title = "자유 게시판";%>
	<div class="alert alert-secondary" role="alert" id="div-welcome1">
		<div class="container">
			<h1 class="display-3"><%=title%></h1>
		</div>
	</div>

	<div align="center">
		<form>
			<table>
				<tr>
					<th width="100px">글번호</th>
					<th width="200px">글제목</th>
					<th width="150px">날짜</th>
				</tr>
				<tr>
					<td colspan=3>
						<hr>
					</td>

				</tr>
				<%
					ArrayList<BoardDTO> contents = (new BoardDAO()).getContents();

				for (BoardDTO content : contents) {
				%>
				<tr>
					<td>
						<%=content.getBid()%>
					</td>
					<td>
						<a href="contentdetail.jsp?bid=<%=content.getBid()%>">
							<%=content.getBtitle()%>
						</a>
					</td>
					<td>
						<%=content.getBdate()%>
					</td>
				</tr>
				<%
					}
				%>
			</table>

		</form>
	</div>

	<%@include file="/_footer.jsp"%>
</body>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>