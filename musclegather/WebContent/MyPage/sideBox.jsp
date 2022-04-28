<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="/css/components/sideBox.css">

</head>
<body>
	<div class="side_box">
		<div onclick="location.href='/MyPage/changeInfo/changeInfo.jsp';">정보 수정</div>
		<div onclick="location.href='/MyPage/changeProfile/changeProfileGym.jsp';">tr정보 수정</div>
		<div onclick="location.href='/MyPage/changeProfile/changeProfileTrainer.jsp';">Gym정보 수정</div>
		<div onclick="location.href='/MyPage/notifyList/notifyList.jsp';">알림</div>
		<div onclick="location.href='/MyPage/deleteAccount/deleteAccount.jsp';">회원 탈퇴</div>
	</div>
</body>
</html>