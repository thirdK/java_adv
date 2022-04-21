<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/myPage.css">
<script type="text/javascript">
	session.setAttribute("email", user_email);
</script>
</head>
<body>
	<div class="myPage">
		<form>
			<div class="info_row">
				<div class="info_header">이름</div>
				<div>
					<input type="text" name="user_name" value="">
				</div>
			</div>
			<div class="info_row">
				<div class="info_header">이메일</div>
				<div>이메일 정보</div>
			</div>
			<div class="info_row">
				<div class="info_header">생년월일</div>
				<div>
					<input type="text" name="user_birth" value="">
				</div>
			</div>
			<div class="info_row">
				<div class="info_header">휴대폰</div>
				<div>
					<select name="user_phone1">
						<option value="010">010</option>
						<option value="011">011</option>
					</select>
					-
					<input type="text" name="user_phone2" value="">
					-
					<input type="text" name="user_phone3" value="">
				</div>
			</div>
			<div class="info_row">
				<div class="info_header">성별</div>
				<div>
					남성
					<input type="radio" name="user_gender" value="남">
					여성
					<input type="radio" name="user_gender" value="여">
				</div>
			</div>
			<div class="info_row">
				<div class="info_header">주소</div>
				<div></div>
			</div>
			<div class="info_row">
				<div class="info_header">비밀번호</div>
				<div>
					<div>
						<input type="password" name="user_password" placeholder="현재 비밀번호를 입력하세요">
					</div>
					<div>
						<input type="password" name="user_password_change" placeholder="변경할 비밀번호를 입력하세요">
					</div>
					<div>
						<input type="password" name="user_password_change_r" placeholder="변경할 비밀번호를 다시 입력하세요">
					</div>
				</div>
			</div>
			<div>
				<button>수정하기</button>
			</div>
		</form>
	</div>


</body>
</html>