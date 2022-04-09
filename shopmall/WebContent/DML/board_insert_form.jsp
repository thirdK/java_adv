<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<form method="post" action="board_insert_db.jsp">
		<table>
			<caption>회원 정보 입력</caption>
			<tr style="border-syle: hidden hidden solid hidden">
				<td colspan="2" style="background-color: white; text-align: right;">* 부분은 필수 입력사항입니다.</td>
			</tr>

			<tr>
				<th>&nbsp; *이름 &nbsp;</th>
				<!-- &nbsp;는 띄어쓰기 한칸을 의미함 html에서 띄어쓰기 연속해서 넣어도 1개만 인식하므로 &nbsp;를 사용 -->
				<td>
					<input type="text" name="board_name" value ="홍길동" required>
				</td>
			</tr>
			
			
			<tr>
				<th>&nbsp; 제목 &nbsp;</th>
				<!-- &nbsp;는 띄어쓰기 한칸을 의미함 html에서 띄어쓰기 연속해서 넣어도 1개만 인식하므로 &nbsp;를 사용 -->
				<td>
					<input type="text" name="board_title">
				</td>
			</tr>

			<tr>
				<th>&nbsp; 내용 &nbsp;</th>
				<td>
				<textarea rows="20" cols="50" name="board_content"></textarea>
				</td>
			</tr>

			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="submit" value="게시물 등록">
				</td>
			</tr>

		</table>
	</form>
</body>
</html>