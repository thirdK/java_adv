<%@page import="java.util.StringTokenizer"%>
<%@page import="dao.GymDAO"%>
<%@page import="dto.GymDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String user_no = "7";
GymDTO gym = (new GymDAO()).getGym(user_no);
StringTokenizer st = new StringTokenizer(gym.getGym_images(), "/");
%>
<body>
	<div class="changeProfile">
		<h1>추가 프로필 입력</h1>

		<form action="changeProfileGymDB.jsp" enctype="multipart/form-data" method="post">
			<input type="text" name="user_no" value="<%=user_no%>" hidden="true">
			<div class="profile_row">
				<div>사진</div>
			</div>
			<div class="profile_row">

				<%
					if (gym.getGym_images() != null && !gym.getGym_images().equals("/")) {
						while (st.hasMoreTokens()) {
						%>
							<div>
								<img src="/images/<%=st.nextToken()%>">
							</div>
						<%
						}
				} else {
				%>
				<div>
					<p>등록된 사진이 없습니다.</p>
				</div>
				<%
					}
				%>

			</div>
			<div class="profile_row">
				<div>업체명</div>
			</div>
			<div class="profile_row">
				<div>
					<input type="text" name="gym_name" value="<%=gym.getGym_name()%>">
				</div>
			</div>
			<div class="profile_row">
				<div>주소</div>
			</div>
			<div class="profile_row">
				<div>
					<input type="text" name="gym_addr" value="<%=gym.getGym_addr()%>">
				</div>
			</div>
			<div class="profile_row">
				<div>기타 소개 작성</div>
			</div>

			<div class="profile_row">
				<div>
					<textarea rows="20" cols="30" name="gym_content"><%=gym.getGym_content()%></textarea>
				</div>
			</div>

			<!-- 연봉!! -->
			<div class="profile_row">
				<div>
					<p>연봉</p>
				</div>
				<div>
					<input type="text" name="gym_salary" value="<%=gym.getGym_salary()%>">
				</div>
			</div>

			<div class="profile_row">
				<div>
					정보를 공개합니다.
					<input type="checkbox" name="gym_secret" value="true">
				</div>
			</div>
			<div class="profile_row">
				<div>
					<input type="file" name="gym_images" accept="image/jpeg, image/png" multiple="multiple">
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