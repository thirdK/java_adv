<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		로그 아웃
	</div>
		<%
			out.print(session.getAttribute("hakbun") + "(" + session.getAttribute("name") + ") 님 ");

		session.invalidate();
		out.print("로그 아웃 되었습니다.");
		%>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	</div>
</body>
</html>