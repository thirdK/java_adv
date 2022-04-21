<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/myPage.css">
</head>
<body>
	<div class="myPage">
		<form>
			<div class="row">
				<div>이름</div>
				<div>
					<input type="text" name="user_name" value="">
				</div>
			</div>
			<div class="row">
				<div>이메일</div>
				<div>이메일 정보</div>
			</div>
			<div class="row">
				<div>생년월일</div>
				<div>
					<input type="text" name="user_birth" value="">
				</div>
			</div>
			<div class="row">
				<div>휴대폰</div>
				<div>
					<input type="text" name="user_phone" value="">
				</div>
			</div>
			<div class="row">
				<div>성별</div>
				<div>남/여</div>
			</div>
			<div class="row">
				<div>주소</div>
				<div></div>
			</div>
			<div>
				<div>비밀번호</div>
				<div>
					<input type="password" name="user_password" placeholder="비밀번호를 입력하세요">
				</div>
				<div>
					<input type="password" name="user_password_change" placeholder="변경할 비밀번호를 입력하세요">
				</div>
				<div>
					<input type="password" name="user_password_change_r" placeholder="변경할 비밀번호를 다시 입력하세요">
				</div>
			</div>
			<div>
				<button>수정하기</button>
			</div>
		</form>
	</div>


</body>
</html>