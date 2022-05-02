<%@page import="dao.JoinDAO"%>
<%@page import="dto.GymDTO"%>
<%@page import="dao.GymDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="gdao" class="dao.GymDAO"/>
<jsp:useBean id="tdao" class="dao.TrainerDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>알림 페이지</title>
<link type="text/css" rel="stylesheet" href="/src/styles/default.css" />
<link type="text/css" rel="stylesheet" href="/css/screens/notifyList.css?ver=2" />
<link type="text/css" rel="stylesheet" href="/css/components/mySideMenu.css"/>

<script type="text/javascript" src="/src/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/src/js/default.js"></script>
<style>
</style>
</head>
<%
	//session.setAttribute("이름", user_no);
//String user_no = session.getAttribute(name);
String user_no = (String) session.getAttribute("user_no");
String user_email = (String) session.getAttribute("user_email");
ArrayList<String> toList = null;
ArrayList<String> fromList = null;

if(user_email != null || user_no != null){
	session.setAttribute("user_no", user_no); 
	session.setAttribute("user_email", user_email); 
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
				<%
					if(gdao.GymFind(user_no)){
				%>
					<%@include file="gymUserNotify.jspf" %>
				<%} else if(tdao.TrainerFind(user_no)){%>
					<%@include file="trainerUserNotify.jspf" %>
				<%} %>
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