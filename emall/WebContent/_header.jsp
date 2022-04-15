<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
@font-face {
	font-family: 'LeferiPoint-BlackA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-BlackA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'LeferiPoint-BlackA';
}
</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Ninth navbar example">
	<div class="container-fluid">
		<a class="navbar-brand" href="/welcome.jsp">이몰</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="/product/productlist.jsp">상품목록</a></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 회원 </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="/user/login.jsp">로그인</a></li>
						<li><a class="dropdown-item" href="/user/logout.jsp">로그아웃</a></li>
						<li><a class="dropdown-item" href="#">주문목록</a></li>
						<li><a class="dropdown-item" href="/user/useradd.jsp">회원가입</a></li>
						<li><a class="dropdown-item" href="#">회원탈퇴</a></li>
					</ul></li>

				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 관리 </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="#">회원관리</a></li>
						<li><a class="dropdown-item" href="#">제품관리</a></li>
						<li><a class="dropdown-item" href="#">판매관리</a></li>
						<li><a class="dropdown-item" href="#">게시판관리</a></li>
					</ul></li>

				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false"> 게시판 </a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<li><a class="dropdown-item" href="#">공지사항</a></li>
						<li><a class="dropdown-item" href="#">질문답변</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>