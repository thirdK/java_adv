<%@page import="jdbc.BoardDAO"%>
<%@page import="jdbc.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%
	String uid = (String) session.getAttribute("id");
if (uid == null) {
	response.sendRedirect("/user/login.jsp");
	return;
}
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
	<%@include file="/_header.jsp"%>

	<%!//선언문
	String title = "게시물 쓰기";%>
	<div class="alert alert-secondary" role="alert" id="div-welcome1">
		<div class="container">
			<h1 class="display-3"><%=title%></h1>
		</div>
	</div>

	<div>
		<form action="boardwritedb.jsp" method="post" enctype="multipart/form-data">
		
			<div>
				<div>제목</div>
			</div>
			<div>
				<div><input type="text" name="btitle"></div>
			</div>
			<div>
				<div>내용</div>
			</div>
			<div>
				<div><textarea cols="80" rows="10" name="bcontent"></textarea></div>
			</div>
			<div>
				<input type="file" name="images">
			</div>
			<div>
				<button>완료</button>
			</div>
		</form>
	</div>










	<%@include file="/_footer.jsp"%>
</body>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>