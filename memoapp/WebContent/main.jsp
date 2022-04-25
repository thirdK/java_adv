<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">
.main-main {
	margin: 20px;
}
.input-form{
	display: flex;
	align-items: center;
}
.input-form_input{
	width: 1265px;
}
.input-form_button {
	margin: 10px;
}
</style>
</head>
<body>
	<main class="main-main">
		<div class="input-form">
			<div class="input-form_input">
				<input class="form-control" type="text" placeholder="메모 작성" aria-label="default input example">
			</div>
			<div class="input-form_button">
				<button type="button" class="btn btn-success">작성</button>
			</div>
		</div>
		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<th scope="col" width="50">#</th>
					<th scope="col" width="900">할 일</th>
					<th scope="col" width="100">작성시간</th>
					<th scope="col" width="100">완료</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>
						<button type="button" class="btn btn-success">삭제</button>
					</td>
				</tr>

			</tbody>
		</table>

	</main>


</body>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>