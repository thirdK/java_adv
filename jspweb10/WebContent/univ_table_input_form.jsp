<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 입력</title>
<style type="text/css">
#div_id{
background-color: #F2EDD7;
color: #755139;
	font-weight: 800;
	font-size: 20;
}
.alert{
	background-color : #755139;
	color : #F2EDD7;
}
</style>
</head>
<body>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<%@ include file="menu.jsp" %>
	<div class="container shadow mx-auto mt-5 p-5 w-75" id="div_id">
	<div class="alert" role="alert" align="center">
		학생 정보 입력
	</div>
		<form class="row g-3" action="univ_table_input.jsp" method="post">

			<div class="col-md-6">
				<label for="inputEmail4" class="form-label">학번</label>
				<input type="text" class="form-control" id="inputEmail4" name="hakbun">
			</div>
			<div class="col-md-6">
				<label for="inputPassword4" class="form-label">이름</label>
				<input type="text" class="form-control" id="inputPassword4" name="name">
			</div>


			<div class="col-md-6">
				<label for="inputState" class="form-label">성별</label><br>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="남자">
					<label class="form-check-label" for="inlineRadio1">남자</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="여자">
					<label class="form-check-label" for="inlineRadio2">여자</label>
				</div>
			</div>



			<div class="col-md-6">
				<label for="inputYear" class="form-label">학년</label>
				<select id="inputYear" class="form-select" name="year">
					<option selected>Choose...</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
				</select>
			</div>



			<div class="col-12">
				<label for="inputAddress" class="form-label">전공</label>
				<input type="text" class="form-control" id="inputAddress" name="dept">
			</div>
			<div class="col-12">
				<label for="inputAddress2" class="form-label">주소</label>
				<input type="text" class="form-control" id="inputAddress2" name="addr">
			</div>



			<div class="col-12">
				<button type="submit" class="btn btn-primary">학생 등록</button>
			</div>
		</form>
	</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>