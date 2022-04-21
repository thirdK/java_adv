<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="kakaomap2.jsp">
		<div>
			위도 : <input type="text" name="lat">
		</div>
		<div>
			경도 : <input type="text" name="lng">
		</div>
		<div>
			위치 : <input type="text" name="msg">
		</div>
		<div>
			<button>전송</button>
		</div>
	</form>
	<form action="kakaomap3.jsp">
		<div>
			주소 : <input type="text" name="addr">
		</div>
		<div>
			메세지 : <input type="text" name="msg">
		</div>
		<div>
			<button>전송</button>
		</div>
	</form>
</body>
</html>