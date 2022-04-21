<%@page import="dao.GymDAO"%>
<%@page import="dto.GymDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	

	<%
		String no = request.getParameter("no");
		int n = Integer.parseInt(no);
	%>
	
	<%
		GymDTO gym = new GymDAO().getGym(n);
	%>
	<table>
		<tr>
			<td><%=gym.getUser_no()%></td>
		</tr>
		<tr>
			<td><%=gym.getUser_name()%></td>
		</tr>
		<tr>
			<td><%=gym.getUser_pw()%></td>
		</tr>
		<tr>
			<td><%=gym.getUser_birth()%></td>
		</tr>
		<tr>
			<td><%=gym.getUser_zipcode()%></td>
		</tr>
		<tr>
			<td><%=gym.getUser_addr()%></td>
		</tr>
		<tr>
			<td><%=gym.getUser_addrdetail()%></td>
		</tr>
		<tr>
			<td><%=gym.getUser_gender()%></td>
		</tr>
		<tr>
			<td><%=gym.getUser_email()%></td>
		</tr>
		<tr>
			<td><%=gym.getUser_phone()%></td>
		</tr>
		<tr>
			<td><%=gym.getUser_admin()%></td>
		</tr>
		<tr>
			<td><%=gym.getUser_kakao()%></td>
		</tr>
		<tr>
			<td><%=gym.getUser_auth()%></td>
		</tr>
		<tr>
			<td><%=gym.getUser_status()%></td>
		</tr>


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
	</table>
</body>
</html>