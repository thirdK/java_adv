<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- form

action : 폼에 입력받은 데이터를 처리할 jsp 를 설정
method : 전송될 방식을 설정 get / post
enctype: 전송되는 콘텐츠 유형을 설정(사진전송)

type
	text	 	기본값으로 한줄 텍스트를 입력 받을 때 사용
	radio	 	여러개 제시된 값들 중 단 하나만 선택
	checkbox	여러개 제시된 값들 중 여러개 선택
	password	암호 입력
	hidden		보이지 않게 숨겨서 값을 전송할 때 사용
	file		파일, 사진을 업로드 위한 파일 선택용으로 사용
	button		버튼 모양으로 출력
	reset		입력된 내용을 모두 초기화
	submit		입력 된 값들을 모두 서버로 전송 -->
	<form action="form1db.jsp">
		취 미 : 독서
		<input type="checkbox" name="hobby" value="독서" ckecked>
		운동
		<input type="checkbox" name="hobby" value="운동">
		영화
		<input type="checkbox" name="hobby" value="영화">
		
		<br>
		<textarea cols="30" rows="5"></textarea>
		<br>
		<input type="submit" value="전송">
		<input type="reset" value="취소">
	</form>
</body>
</html>











