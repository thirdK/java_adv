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
		제목 : <input type="text" name = "title">
		<input type="button" onclick="CheckForm()" value="제출">

	</form>


</body>
<script type="text/javascript">
	function CheckForm() {
		var regExp = /Java/i;	//var regExp = new RegExp('java', 'i');
		
		var str = document.loginForm.title.value;
		var result = regExp.exec(str);
		
		alert(result[0]);
		
		document.loginForm.submit();		
	}
</script>
</html>