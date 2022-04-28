<%@page import="dao.JoinDAO"%>
<%@page import="dto.GymDTO"%>
<%@page import="dao.GymDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>알림 페이지</title>
<link type="text/css" rel="stylesheet" href="/src/styles/default.css" />
<link type="text/css" rel="stylesheet" href="/css/screens/notifyList.css?ver=1" />

<script type="text/javascript" src="/src/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/src/js/default.js"></script>
<style>
</style>
</head>
<%
	//session.setAttribute("이름", user_no);
//String user_no = session.getAttribute(name);
String user_no = "4";
ArrayList<String> toList = null;
ArrayList<String> fromList = null;
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
				<section class="sec1 sec_plus">
					<!-- 컨탠츠 구역 -->
					<!-- ========================================================= -->
					<div class="notify">
						<%@ include file="paging_prepare.jspf"%>
						<div class="toList">
							<div class="notify_row">
								<div>
									<h1>내가 보낸 목록</h1>
								</div>
							</div>
							<%
								for (String to : toList) {
								GymDTO gym = (new GymDAO()).getGym(to);
							%>
							<div class="notify_row">
								<div>
									<a href="gym의 프로필로"><%=gym.getGym_name()%></a>
									에게 이력서를 보냈습니다.
								</div>
							</div>
							<%
								}
							%>
						</div>
						<div class="to_block">
							<%@ include file="paging_block1.jspf"%>
						</div>




					</div>
					<!-- ========================================================= -->
				</section>
				<section class="sec2 sec_plus">
					<div class="notify">
						<div class="fromList">
							<div class="notify_row">
								<div>
									<h1>내가 받은 목록</h1>
								</div>
							</div>
							<%
								for (String from : fromList) {
								GymDTO gym = (new GymDAO()).getGym(from);
							%>
							<div class="notify_row">
								<div>
									<a href="gym의 프로필로"><%=gym.getGym_name()%></a>
									에게서 알림이 왔습니다.
								</div>
							</div>
							<%
								}
							%>
						</div>
						<div class="from_block">
							<%@ include file="paging_block2.jspf"%>
						</div>
					</div>
				</section>
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