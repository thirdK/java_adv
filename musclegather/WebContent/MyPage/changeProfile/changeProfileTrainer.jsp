<%@page import="dao.TrainerDAO"%>
<%@page import="dto.TrainerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>트레이너 프로필 수정</title>
<link type="text/css" rel="stylesheet" href="/src/styles/default.css" />
<link type="text/css" rel="stylesheet" href="/css/screens/changeProfileTrainer.css" />
<link type="text/css" rel="stylesheet" href="/css/components/mySideMenu.css" />

<script type="text/javascript" src="/src/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/src/js/default.js"></script>
<style>
</style>


</head>
<%
String user_no = (String) session.getAttribute("user_no");
String user_email = (String) session.getAttribute("user_email");
TrainerDTO trainer = null;
String imgName = "";


if(user_email != null || user_no != null){
	session.setAttribute("user_no", user_no); 
	session.setAttribute("user_email", user_email); 
	trainer = (new TrainerDAO()).getTrainer(user_no);
} else {
	out.print("<script>alert('로그인 해주세요');</script>");
	out.print("<script>document.location.href='/user/login.jsp'</script>");
	return;
}

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
								if (trainer.getTrainer_images() != null && !trainer.getTrainer_images().equals("/")) {
							%>
							<div class="image_box">
								<img src="/images/<%=imgName = trainer.getTrainer_images()%>" id="<%=imgName%>" width="200px" height="200px" onclick="expansion('<%=imgName%>');">
							</div>
							<%
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
						<div class="changeProfileTrainer">

							<form class="frm" action="changeProfileTrainerDB.jsp" enctype="multipart/form-data" method="post">
								<div class="title">
									<h1>추가 프로필 입력</h1>
								</div>
								<input type="text" name="user_no" value="<%=user_no%>" hidden="true">

								<div class="profile_row">
									<div>제목</div>
								</div>
								<div class="profile_row">
									<div>
										<input type="text" name="trainer_title" value="<%=trainer.getTrainer_title()%>">
									</div>
								</div>
								<div class="profile_row">
									<div>희망 지역</div>
								</div>
								<div class="profile_row">
									<div>
										<input type="text" name="trainer_addr" id="trainer_addr" value="<%=trainer.getTrainer_addr()%>" readonly="readonly">
									</div>
									<div class="select_row">
										<select name="sido1" id="sido1"></select>
										<select name="gugun1" id="gugun1"></select>
									</div>
								</div>
								<div class="profile_row">
									<div>주요 경력 및 기타 소개 작성</div>
								</div>

								<div class="profile_row">
									<div>
										<textarea rows="20" cols="30" name="trainer_content"><%=trainer.getTrainer_content()%></textarea>
									</div>
								</div>

								<div class="profile_row">
									<div>
										<input type="file" name="trainer_images" accept="image/jpeg, image/png">
									</div>
								</div>

								<div class="profile_row flex-right">
									<div>
										정보를 공개합니다.
										<input type="checkbox" name="trainer_secret" value="true">
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
<script src="areaList.js?ver=2"></script>
<script>
	var sidoArea = document.getElementById('sido1');
	var gugunArea = document.getElementById('gugun1');
	var addrArea = document.getElementById('trainer_addr');

	sidoArea.onchange = function() {
		addrArea.value = sidoArea.value + " ";
	}
	gugunArea.onchange = function() {
		var len = addrArea.value.length;
		if (addrArea.value.charAt(len) == " ") {
			addrArea.value += gugunArea.value;
		} else {
			addrArea.value = addrArea.value.split(" ")[0] + " "
					+ gugunArea.value;
		}
	}

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