<%@page import="java.util.StringTokenizer"%>
<%@page import="dto.UserDTO"%>
<%@page import="dao.UserDAO"%>
<%@page import="dao.GymDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>회원정보 수정</title>
<link type="text/css" rel="stylesheet" href="/src/styles/default.css" />
<!-- 개인css -->
<link type="text/css" rel="stylesheet" href="/css/screens/changeInfo.css" />

<script type="text/javascript" src="/src/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/src/js/default.js"></script>
</head>
<%
	/* session.setAttribute("이름", user_no); */
/* String user_no = session.getAttribute(name); */
String user_no = "2"; //나중에 세션으로 받아야함

UserDTO user = new UserDAO().getUser(user_no);
StringTokenizer st = new StringTokenizer(user.getUser_phone(), "-");
String phone_selected = st.nextToken(); //첫번째 토큰은 010, 011....
String gender_checked = user.getUser_gender();
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
					<div class="changeInfo">
						<form class="frm" name="frm" action="changeInfoDB.jsp?user_no=<%=user_no%>" method="POST">
							<!-- 정보넘기기 위한 hidden 태그 -->
							<input type="text" id="input-user_no" hidden="true" value="<%=user.getUser_no()%>">
							<input type="text" id="input-phone" hidden="true" value="" name="user_phone">
							<input type="text" id="input-pw" hidden="true" value="" name="user_pw">
							<div class="info_row title">
								<h1>Muscle Gather</h1>
							</div>

							<div class="info_row">
								<div class="info_header">
									<label for="input-user_name">이름</label>
								</div>

								<div class="info_body">
									<input type="text" name="user_name" id="input-user_name" value="<%=user.getUser_name()%>">
								</div>
							</div>

							<div class="info_row">
								<div class="info_header">이메일</div>
								<div class="info_body"><%=user.getUser_email()%></div>
							</div>
							<div class="info_row">
								<div class="info_header">
									<label for="input-user_birth">생년월일</label>
								</div>
								<div class="info_body">
									<input type="date" name="user_birth" id="input-user_birth" value="<%=user.getUser_birth()%>">
								</div>
							</div>
							<div class="info_row">
								<div class="info_header">
									<label for="input-user_phone2">휴대폰</label>
								</div>
								<div class="info_phone">
									<select name="user_phone1">
										<option value="">선택</option>
										<option value="010" id="010">010</option>
										<option value="011" id="011">011</option>
									</select>
									<div>-</div>
									<div class="info_body_phone">
										<input type="text" name="user_phone2" id="input-user_phone2" class="input_phone" value="<%=st.nextToken()%>" size="4" maxlength="4">
									</div>
									<div>-</div>
									<div class="info_body_phone">
										<input type="text" name="user_phone3" class="input_phone" value="<%=st.nextToken()%>" size="4" maxlength="4">
									</div>
								</div>
							</div>
							<div class="info_row">
								<div class="info_header">성별</div>
								<div>
									남성
									<input type="radio" name="user_gender" value="M" id="gender_m">
									여성
									<input type="radio" name="user_gender" value="F" id="gender_f">
								</div>
							</div>

							<div class="info_row">
								<div class="info_header">우편번호</div>
								<div class="info_body">
									<div class="info_zipcode">
										<input type="text" name="user_zipcode" id="sample6_postcode" placeholder="우편번호" value="<%=user.getUser_zipcode()%>">
									</div>
									<div>
										<input type="button" onclick="execDaumPostcode()" value="찾기">
									</div>
								</div>
							</div>

							<div class="info_row">
								<div class="info_header">주소</div>
								<div class="info_body">
									<input type="text" name="user_addr" id="sample6_address" placeholder="주소" value="<%=user.getUser_addr()%>">
								</div>
							</div>
							<div class="info_row">
								<div class="info_header"></div>
								<div class="info_body">
									<input type="text" name="user_addrdetail" id="sample6_detailAddress" placeholder="상세주소" value="<%=user.getUser_addrdetail()%>">
								</div>
								<input type="text" id="sample6_extraAddress" placeholder="참고항목" hidden="true">
							</div>

							<div class="info_row">
								<div class="info_header">
									<label for="input-user_password">비밀번호</label>
								</div>
								<div class="info_body">
									<input type="password" name="user_password" id="input-user_password" placeholder="현재 비밀번호">
								</div>
							</div>
							<div class="info_row">
								<div class="info_header">
									<label for="input-user_password"></label>
								</div>
								<div id="result"></div>
							</div>
							<div class="info_row">
								<div class="info_header">
									<label for="input-user_password_change">비밀번호 <br>변경
									</label>
								</div>
								<div class="info_body">
									<input type="password" name="user_password_change" id="input-user_password_change" placeholder="새 비밀번호">
								</div>
							</div>
							<div class="info_row">
								<div class="info_header"></div>
								<div class="info_body">
									<input type="password" name="user_password_change_r" placeholder="새 비밀번호 확인">
								</div>
							</div>
							<div class="info_row input_button">
								<div>
									<input type="button" onclick="check(); combineInfo();" value="수정하기">
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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="./changeInfo.js"></script>
<script type="text/javascript" src="./addressAPI.js"></script>

<script type="text/javascript">

	//즉시 실행 함수
	(function() { //DB의 핸드폰 앞자리(010/011/...) 확인해서 페이지 진입때 selected한다. 
		var result = '<%=phone_selected%>';
		
		document.getElementById(result).setAttribute('selected', 'true');
	}());
	
	(function(){	//DB의 성별을 확인해서 페이지 진입때 checked한다.
		var result = '<%=gender_checked%>';
		
		if (result == "M") {
			document.getElementById('gender_m').setAttribute('checked', 'true');
		} else {
			document.getElementById('gender_f').setAttribute('checked', 'true');
		}
	})();
</script>

</html>