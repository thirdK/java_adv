<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.frm {
	width: 300px;
	height: 300px;
	background-color: gray;
	display: flex;
	flex-direction: column; justify-content : center;
	align-items: center;
	justify-content: center;
}

#con-lists {
	width: 200px;
	height: 200px;
	border: solid 1px;
}

.no {
	width: 20px;
}

.no>input {
	width: 100%;
	text-align: center;
}
</style>
</head>
<!--  
ajax를 사용한다. -> 시간마다 체크해서 화면에 리스트를 올려줘야함
-->
<body>
	<div class="frm">
		<div id="con-lists"></div>
		<div class="no">
			<input type="text" name="user_no" value="2">
		</div>
		<div>
			<input type="text" name="content">
		</div>
		<div>
			<input type="button" value="전송">
		</div>
	</div>
</body>
</html>