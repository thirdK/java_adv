<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">
div {
	margin: 3px 0;
}
</style>
</head>
<body>
	<%@include file="/_header.jsp"%>

	<%!//선언문
	String title = "유저 등록";%>
	
	<div class="alert alert-secondary" role="alert" id="div-welcome1">
		<div class="container">
			<h1 class="display-3"><%=title%></h1>
		</div>
	</div>





	<div class="container">
		<form action="useradddb.jsp" method="post">

			<div class="form-group row">
				<label class="col-sm-2"> 아이디 </label>
				<div class="col-sm-3">
					<input type="text" name="uid" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2"> 암호 </label>
				<div class="col-sm-3">
					<input type="password" name="upw" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2"> 이름 </label>
				<div class="col-sm-3">
					<input type="text" name="uname" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2"> 성별 </label>
				<div class="col-sm-3">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="ugender" id="inlineRadio1" value="남성">
						<label class="form-check-label" for="inlineRadio1">남성</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="ugender" id="inlineRadio2" value="여성">
						<label class="form-check-label" for="inlineRadio1">여성</label>
					</div>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2"> 생년월일 </label>
				<div class="col-sm-3">
					<input type="text" name="ubirth" class="form-control">
				</div>
			</div>


			<div class="form-group row">
				<label class="col-sm-2"> 이메일 </label>
				<div class="col-sm-3">
					<input type="text" name="uemail" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2"> 전화번호 </label>
				<div class="col-sm-3">
					<input type="text" name="uphone" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2"> 주소 </label>
				<div class="col-sm-3">
					<input type="text" name="uaddr" class="form-control">
				</div>
			</div>


			<div class="form-group row">
				<div class="col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록">
					<input type="reset" class="btn btn-danger" value="취소">
				</div>
			</div>

		</form>
	</div>






	<%@include file="/_footer.jsp"%>
</body>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>