<%@page import="java.util.StringTokenizer"%>
<%@page import="dao.GymDAO"%>
<%@page import="dto.GymDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>grid pach</title>
<link type="text/css" rel="stylesheet" href="/src/styles/default.css" />

<script type="text/javascript" src="/src/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/src/js/default.js"></script>
<style>
</style>
</head>
<%
	String user_no = "7";
GymDTO gym = (new GymDAO()).getGym(user_no);
StringTokenizer st = new StringTokenizer(gym.getGym_images(), "/");
%>
<body>
	<div class="wrap">
		<!-- header-->
		<header id="header">
			<%@ include file="/html/pieceHeader.jsp"%>
		</header>

		<!-- hidden nav-->
		<nav id="nav"></nav>

		<!-- hidden sideBar-->
		<aside id="sideBarA" class="">
			<div class="sideWrap">sideA</div>
		</aside>

		<aside id="sideBarB" class="">
			<div class="sideWrap">sideB</div>
		</aside>

		<main>
			<div class="mainWrap">
				<section class="sec1">
					<!-- 컨탠츠 구역 -->
					<!-- ========================================================= -->
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
									<input type="text" name="gym_name" id="gym_name" value="<%=gym.getGym_name()%>">
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

							<div class="profile_row">
								<div>
									<p>급여</p>
								</div>
								<div>
									<input type="text" name="gym_salary" value="<%=gym.getGym_salary()%>">
								</div>
							</div>


							<div class="profile_row">
								<div>주소</div>
							</div>
							<div class="profile_row">

								<div>
									<input type="text" name="gym_zipcode" id="sample6_postcode" placeholder="우편번호" value="" hidden="true">
									<input type="button" onclick="execDaumPostcode()" value="주소 찾기">
									<br>
									<input type="text" name="gym_addr" id="sample6_address" placeholder="주소" value="<%=gym.getGym_addr()%>">
									<br>
									<input type="text" name="gym_addrdetail" id="sample6_detailAddress" placeholder="상세주소" value="" hidden="true">
									<input type="text" id="sample6_extraAddress" placeholder="참고항목" hidden="true">
								</div>
							</div>

							<div class="profile_row">
								<div id="map" style="width: 500px; height: 400px;"></div>
							</div>

							<div class="profile_row">
								<div>
									<input type="file" name="gym_images" accept="image/jpeg, image/png" multiple="multiple">
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
									<button>저장하기</button>
								</div>
							</div>
						</form>
					</div>
					<!-- ========================================================= -->
				</section>
				<section class="sec2"></section>
			</div>
		</main>

		<footer id="footer">
			<%@ include file="/html/pieceFooter.jsp"%>
		</footer>

		<!-- side butten -->
		<article id="sideBtn">
			<div class="sideLinkWrap">
				<label id="" for=""> <span></span> <span></span> <span></span> <span></span>
				</label>
			</div>
		</article>
	</div>

</body>

<!-- f706e0719e45256070f1d933f2e70af4 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f706e0719e45256070f1d933f2e70af4&libraries=services"></script>
<script src="mapAPI.js"></script>
<script src="addressAPI.js"></script>

</html>