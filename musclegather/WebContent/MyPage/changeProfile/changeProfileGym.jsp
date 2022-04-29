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
<title>업체 프로필 수정</title>
<link type="text/css" rel="stylesheet" href="/src/styles/default.css" />
<link type="text/css" rel="stylesheet" href="/css/screens/changeProfileGym.css?ver=1" />
<link type="text/css" rel="stylesheet" href="/css/components/mySideMenu.css"/>

<script type="text/javascript" src="/src/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/src/js/default.js"></script>
<style>
</style>
</head>
<%
	String user_no = "7";
GymDTO gym = (new GymDAO()).getGym(user_no);
StringTokenizer st = new StringTokenizer(gym.getGym_images(), "/");
String name = "";
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
		<div class="flex-my_side_menu">
				<div class="my_side_menu">
					<%@include file="/MyPage/sideBox.jspf"%>
				</div>
			<div class="mainWrap">
				<section class="sec1 sec_plus">
					<!-- 컨탠츠 구역 -->
					<!-- ========================================================= -->
					<div id="big_image"></div>
					<div class="profile_row">
						<div>
							<h1>사진</h1>
						</div>
					</div>
					<div class="profile_row images_box">

						<%
							
						if (gym.getGym_images() != null && !gym.getGym_images().equals("/")) {
							while (st.hasMoreTokens()) {
						%>
						<div class="image_box">
							<img src="/images/<%=name = st.nextToken()%>" id="<%=name%>" width="200px" height="200px" onclick="expansion('<%=name%>');">
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
					<!-- ========================================================= -->
				</section>
				<section class="sec2">
					<div class="changeProfileGym">
						<form class="frm" action="changeProfileGymDB.jsp" enctype="multipart/form-data" method="post">
							<div class="title">
								<h1>추가 프로필 입력</h1>
							</div>
							<input type="text" name="user_no" value="<%=user_no%>" hidden="true">
							
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

								<div class="input_addr">
									<input type="text" name="gym_addr" id="sample6_address" placeholder="주소" value="<%=gym.getGym_addr()%>">
									<input type="button" onclick="execDaumPostcode()" value="주소찾기">
								</div>
								<div>
									<input type="text" name="gym_zipcode" id="sample6_postcode" placeholder="우편번호" value="" hidden="true">
									<br>
									<input type="text" name="gym_addrdetail" id="sample6_detailAddress" placeholder="상세주소" value="" hidden="true">
									<input type="text" id="sample6_extraAddress" placeholder="참고항목" hidden="true">
								</div>
							</div>

							<div class="profile_row">
								<div id="map" style="width: 97%; height: 400px;"></div>
							</div>

							<div class="profile_row insert_img">
								<div>
									<input type="file" name="gym_images" accept="image/jpeg, image/png" multiple="multiple">
								</div>
							</div>
							<div class="profile_row flex-right">
								<div>
									정보를 공개합니다.
									<input type="checkbox" name="gym_secret" value="true">
									<button>저장하기</button>
								</div>
							</div>
							
						</form>
					</div>
				</section>
			</div>
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

<script type="text/javascript">
	function expansion(name) {
		let img = document.getElementById(name);
		let big = document.getElementById('big_image');
		big.setAttribute("class", "on");
		big.innerHTML = '<div><img src="/images/' + name
				+ '" onclick="back()"></div>';

	}

	function back() {
		let big = document.getElementById('big_image');
		big.classList.remove('on');
	}
</script>

</html>