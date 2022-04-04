<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="inputData.jsp">
		<table>
			<tr>
				<th align="left">번호</th>
				<th align="left">작성자</th>
				<th align="left">날짜</th>
			</tr>
			<tr>
				<td><input type="text" name="num" size="5"></td>
				<td><input type="text" name="name"></td>
				<td><input type="date" name="date"></td>
			</tr>
			<tr>
				<td colspan="3"><textarea rows="10" cols="60" name="content"></textarea> </td>
			</tr>
			<tr>
				<td colspan="3" align="right"><button>완료</button> </td>
			</tr>
		</table>
	</form>
</body>
</html>