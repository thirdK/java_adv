<%@page import="dao.GymDAO"%>
<%@page import="dto.GymDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		ArrayList<GymDTO> gyms = new ArrayList<>();
		gyms = new GymDAO().getList();
	%>
	<table>
		<%
			for (GymDTO gym : gyms) {
		%>
		<tr>
			<td>
				<hr>
			</td>
		</tr>

		<tr>
			<td><%=gym.getGym_no()%></td>
		</tr>
		<tr>
			<td><%=gym.getGym_name()%></td>
		</tr>
		<tr>
			<td><%=gym.getGym_content()%></td>
		</tr>
		<tr>
			<td><%=gym.getGym_addr()%></td>
		</tr>
		<tr>
			<td><%=gym.getGym_salary()%></td>
		</tr>
		<tr>
			<td><%=gym.getGym_secret()%></td>
		</tr>
		<tr>
			<td><%=gym.getGym_regdate()%></td>
		</tr>
		<tr>
			<td><%=gym.getGym_images()%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>