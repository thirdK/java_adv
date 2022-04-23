<%@page import="java.util.StringTokenizer"%>
<%@page import="dto.UserDTO"%>
<%@page import="dao.UserDAO"%>
<%@page import="dao.GymDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/myPage.css">

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
	<div class="myPage">
		<form name="frm" action="changeInfoDB.jsp?user_no=<%=user_no%>" method="POST">
			<!-- 정보넘기기 위한 hidden 태그 -->
			<input type="text" id="input-user_no" hidden="true" value="<%=user.getUser_no()%>">
			<input type="text" id="input-phone" hidden="true" value="" name="user_phone">
			<input type="text" id="input-pw" hidden="true" value="" name="user_pw">
			
			<div class="info_row">
				<div class="info_header">
					<label for="input-user_name">이름</label>
				</div>

				<div>
					<input type="text" name="user_name" id="input-user_name" value="<%=user.getUser_name()%>">
				</div>

			</div>
			<div class="info_row">
				<div class="info_header">이메일</div>
				<div><%=user.getUser_email()%></div>
			</div>
			<div class="info_row">
				<div class="info_header">
					<label for="input-user_birth">생년월일</label>
				</div>
				<div>
					<input type="date" name="user_birth" id="input-user_birth" value="<%=user.getUser_birth()%>">
				</div>
			</div>
			<div class="info_row">
				<div class="info_header">
					<label for="input-user_phone2">휴대폰</label>
				</div>
				<div>
					<select name="user_phone1">
						<option value="">선택</option>
						<option value="010" id="010">010</option>
						<option value="011" id="011">011</option>
					</select>
					-
					<input type="text" name="user_phone2" id="input-user_phone2" value="<%=st.nextToken()%>" size="4" maxlength="4">
					-
					<input type="text" name="user_phone3" value="<%=st.nextToken()%>" size="4" maxlength="4">
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
				<div class="info_header">주소</div>
				<div>
					<input type="text" name="user_zipcode" id="sample6_postcode" placeholder="우편번호" value="<%=user.getUser_zipcode()%>">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
					<br>
					<input type="text" name="user_addr" id="sample6_address" placeholder="주소" value="<%=user.getUser_addr()%>">
					<br>
					<input type="text" name="user_addrdetail" id="sample6_detailAddress" placeholder="상세주소" value="<%=user.getUser_addrdetail()%>">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">
				</div>
			</div>
			<div class="info_row">
				<div class="info_header">
					<label for="input-user_password">비밀번호</label>
				</div>
				<div>
					<input type="password" name="user_password" id="input-user_password" placeholder="현재 비밀번호를 입력하세요">
					<div id="result"></div>
				</div>

			</div>
			<div class="info_row">
				<div class="info_header">
					<label for="input-user_password_change">비밀번호 <br>변경
					</label>
				</div>
				<div>
					<div>
						<input type="password" name="user_password_change" id="input-user_password_change" placeholder="변경할 비밀번호를 입력하세요">
					</div>
					<div>
						<input type="password" name="user_password_change_r" placeholder="변경할 비밀번호를 다시 입력하세요">
					</div>
				</div>

			</div>
			<div>
				<input type="button" onclick="check(); combineInfo();" value="수정하기">
			</div>
		</form>
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