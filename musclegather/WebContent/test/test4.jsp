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
	gyms = new GymDAO().getGymList();
	%>
	<form id="frm" action="link.jsp" method="post">
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
				<td><%=gym.getGym_no()%>
					
				</td>
			</tr>
			<tr>
				<td>
					<a href="link.jsp?no=<%=gym.getUser_no()%>"><%=gym.getGym_name()%></a>
				</td>
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
	</form>
</body>
<script type="text/javascript">
	function btn() {

		frm.submit();
	}
</script>
</html>