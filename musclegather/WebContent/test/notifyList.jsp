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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>grid pach</title>
    <link type="text/css" rel="stylesheet" href="/src/styles/default.css" />

    <script type="text/javascript" src="/src/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/src/js/default.js"></script>
    <style>

    </style>
</head>

<body>
<div class="wrap">
        <!-- header-->
        <header id="header">

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
	<div class="notify">
		
		<div class="toList">
			<jsp:include page="testpaging1.jsp"/>
		</div>
		<div class="toList">
			<jsp:include page="testpaging2.jsp"/>
		</div>
		
	
		
	</div>
	 <!-- ========================================================= -->
                </section>
                <section class="sec2">

                </section>
            </div>
        </main>

        <footer id="footer">

        </footer>

        <!-- side butten -->
        <article id="sideBtn">
            <div class="sideLinkWrap">
                <label id="" for="">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </label>
            </div>
        </article>
    </div>
</body>
</html>