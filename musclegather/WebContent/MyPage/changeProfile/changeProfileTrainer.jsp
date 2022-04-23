<%@page import="dao.TrainerDAO"%>
<%@page import="dto.TrainerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String user_no = "4";
	TrainerDTO trainer = (new TrainerDAO()).getTrainer(user_no);
%>
<body>
	<div class="changeProfile">
	<h1>추가 프로필 입력</h1>
	
		<form action="changeProfileTrainerDB.jsp">
			<input type="text" name="user_no" value="<%=user_no %>" hidden="true">
			<div class="profile_row">
				<div>제목</div>
			</div>
			<div class="profile_row">
				<div>
					<input type="text" name="trainer_title" value="<%=trainer.getTrainer_title() %>">
				</div>
			</div>
			<div class="profile_row">
				<div>주요 경력 및 기타 소개 작성</div>
			</div>

			<div class="profile_row">
				<div>
					<textarea rows="20" cols="30" name="trainer_content"><%=trainer.getTrainer_content() %></textarea>
				</div>
			</div>

			<div class="profile_row">
				<div>
					정보를 공개합니다. <input type="checkbox" name="trainer_secret" value="true"> 
				</div>
			</div>
			<div class="profile_row">
				<div>
					<input type="file" name="trainer_images" >
				</div>
			</div>
			
			<div class="profile_row">
				<div>
					<button>저장하기</button>
				</div>
			</div>
		</form>
	</div>
	
</body>
</html>