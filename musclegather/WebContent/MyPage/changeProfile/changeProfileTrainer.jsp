<%@page import="dao.TrainerDAO"%>
<%@page import="dto.TrainerDTO"%>
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
	String user_no = "3";
TrainerDTO trainer = (new TrainerDAO()).getTrainer(user_no);
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

						<form action="changeProfileTrainerDB.jsp" enctype="multipart/form-data" method="post">
							<input type="text" name="user_no" value="<%=user_no%>" hidden="true">
							<div class="profile_row">
								<div>사진</div>
							</div>
							<div class="profile_row">

								<%
									if (trainer.getTrainer_images() != null && !trainer.getTrainer_images().equals("/")) {
									System.out.println(trainer.getTrainer_images());
								%>
								<div>
									<img src="/images/<%=trainer.getTrainer_images()%>">
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
									정보를 공개합니다.
									<input type="checkbox" name="trainer_secret" value="true">
								</div>
							</div>
							<div class="profile_row">
								<div>
									<input type="file" name="trainer_images" accept="image/jpeg, image/png">
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
<script src="areaList.js?ver=1"></script>
<script>
	var sidoArea = document.getElementById('sido1');
	var gugunArea = document.getElementById('gugun1');
	var addrArea = document.getElementById('trainer_addr');
	
	sidoArea.onchange = function() {
		addrArea.value = sidoArea.value + " ";
	}
	gugunArea.onchange = function() {
		var len = addrArea.value.length;
		if(addrArea.value.charAt(len) == " "){
			addrArea.value += gugunArea.value;
		} else{
			addrArea.value = addrArea.value.split(" ")[0] + " " + gugunArea.value;
		}
	}
</script>

</html>