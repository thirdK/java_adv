<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 유효성 검사는 사용자가 입력한 데이터 값이 서버로 전송되기 전에 규칙에 맞는지 검사하여 검증하는 것ㄱ
사용자가 실수로 유효하지 않은 데이터 값을 입력하게 되면 부적합 하다고 판단하여 다시 입력하도록 알려준다.

아이디 검사, 패스워드 검사, 빈칸 여부 검사.... -->

	<form name="loginForm" action="#">
		아이디 :
		<input type="text" name="id">
		비 번 :
		<input type="password" name="pw">
		<input type="button" onclick="CheckForm()" value="제출">

	</form>


</body>
<script type="text/javascript">
	function CheckForm() {
		/* alert("아이디 : " + document.loginForm.id.value + "\n" + "비  번 : "
				+ document.loginForm.pw.value); */

		if (document.loginForm.id.value.length < 3 || document.loginForm.id.value.length > 20) {
			alert("아이디가 너무 작거나 큽니다.");
			document.loginForm.id.focus();
			return;
		}
		if (document.loginForm.pw.value.length < 2){
			alert("비번은 2글자 이상으로 입력하세요");
			document.loginForm.pw.focus();
			return;
		}
		document.loginForm.submit();		
	}
</script>
</html>