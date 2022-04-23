<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<div class="deleteAccount">
		<form action="deleteAccountDB.jsp" method="POST">
			<div>
				<p>회원 탈퇴를 요청하려면 비밀번호를 입력하세요</p>
			</div>
			<div>
				<input type="password" name="user_pw">
			</div>
			<div>
				<button>회원탈퇴</button>
			</div>
		</form>
	</div>
</body>
</html>