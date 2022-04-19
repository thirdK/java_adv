<%@page import="dto.UserDTO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		UserDTO user = new UserDAO().getUser(2);
	%>
	<table>
		<tr>
			<td><%=user.getUser_no()%></td>
		</tr>
		<tr>
			<td><%=user.getUser_name()%></td>
		</tr>
		<tr>
			<td><%=user.getUser_pw()%></td>
		</tr>
		<tr>
			<td><%=user.getUser_birth()%></td>
		</tr>
		<tr>
			<td><%=user.getUser_zipcode()%></td>
		</tr>
		<tr>
			<td><%=user.getUser_addr()%></td>
		</tr>
		<tr>
			<td><%=user.getUser_addrdetail()%></td>
		</tr>
		<tr>
			<td><%=user.getUser_gender()%></td>
		</tr>
		<tr>
			<td><%=user.getUser_email()%></td>
		</tr>
		<tr>
			<td><%=user.getUser_phone()%></td>
		</tr>
		<tr>
			<td><%=user.isUser_admin()%></td>
		</tr>
		<tr>
			<td><%=user.isUser_kakao()%></td>
		</tr>
		<tr>
			<td><%=user.getUser_auth()%></td>
		</tr>
		<tr>
			<td><%=user.isUser_status()%></td>
		</tr>
	</table>
</body>
</html>