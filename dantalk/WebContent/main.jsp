<%@page import="jdbc.FeedDAO"%>
<%@page import="jdbc.FeedDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단톡방</title>
<link rel="stylesheet" href="css/test.css">
</head>
<body>
	<main class="main-main">
		<div class="main-main-div_input">
			<form action="feedAdd.jsp" method="POST" enctype="multipart/form-data">
				<table align=center>
					<tr>
						<td colspan="2" align="center" height="40">
							<b>톡작성</b>
						</td>
					</tr>

					<tr>
						<td align="right">아이디</td>
						<td>
							<input type="text" name="uid" placeholder="글작성자 아이디" required>
						</td>
					</tr>
					<tr>
						<td align="right">글작성</td>
						<td>
							<textarea name="ucon" rows="3" cols="20"> </textarea>
						</td>
					</tr>
					<tr>
						<td align="right">이미지</td>
						<td>
							<input type="file" name="uimage">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right" height="40">
							<input type="submit" value="등록">
						</td>
					</tr>
				</table>
			</form>
		</div>


		<table align="center">
		<tr>
			<td colspan="2"><h3>톡보기</h3></td>
		</tr>

		<%
			ArrayList<FeedDTO> feeds = (new FeedDAO()).getList();
			for (FeedDTO feed : feeds) {
				String imgstr="";
				String img = feed.getImages();
				if(img != null){
					imgstr = "<img src = 'images/" + img + "' width = 240>";
				}
		%>
		<tr>
			<td colspan=2>
				<hr>
			</td>
		</tr>
		<tr>
			<td><%=feed.getId()%></td>
			<td><%=feed.getTs()%></td>
		</tr>
		<tr>
			<td><%=imgstr %></td>
		</tr>
		<tr>
			<td colspan="2">
				<%=feed.getContent()%>
			</td>
		</tr>
		<%
			}
		%>

	</table>
	</main>
</body>
</html>