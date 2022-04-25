<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<body>
	<form name="frm" action="insertDB.jsp" method="POST">
		<table>
			<tr>
				<td>학번<td>
				<td>
					<input type="text" name="no">
				</td>
			</tr>
			<tr>
				<td>학과<td>
				<td>
					<input type="text" name="dept">
				</td>
			</tr>
			<tr>
				<td>이름<td>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<td>주소<td>
				<td>
					<input type="text" name="addr">
				</td>
			</tr>
			<tr>
				<td>연락처<td>
				<td>
					<input type="text" name="phone">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button>전송</button>
				</td>
			</tr>
		</table>

	</form>
</body>

</html>