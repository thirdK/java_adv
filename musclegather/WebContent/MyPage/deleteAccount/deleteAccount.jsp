<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원탈퇴</title>
<link type="text/css" rel="stylesheet" href="/src/styles/default.css" />
<link type="text/css" rel="stylesheet" href="/css/screens/deleteAccount.css" />
<link type="text/css" rel="stylesheet" href="/css/components/mySideMenu.css"/>

<script type="text/javascript" src="/src/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/src/js/default.js"></script>
<style>
</style>

</head>
<%
	String user_no = "2";
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
					<section class="sec1">
						<!-- 컨탠츠 구역 -->
						<!-- ========================================================= -->
						<div class="deleteAccount">
							<form class="frm" action="deleteAccountDB.jsp" method="POST">
								<div>
									<div>
										<h1>회원 탈퇴를 요청하려면 비밀번호를 입력하세요</h1>
									</div>
									<div>
										<input type="password" name="user_pw">
									</div>
									<div>
										<button>회원탈퇴</button>
									</div>
								</div>
							</form>
						</div>
						<!-- ========================================================= -->
					</section>
					<section class="sec2"></section>
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
</html>