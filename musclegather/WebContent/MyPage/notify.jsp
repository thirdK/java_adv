<%@page import="dto.GymDTO"%>
<%@page import="dao.GymDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	//session.setAttribute("이름", user_no);
//String user_no = session.getAttribute(name);
String user_no = "4";
ArrayList<String> toList = (new UserDAO()).getToList(user_no);
ArrayList<String> fromList = (new UserDAO()).getFromList(user_no);
%>
<body>
	<div class="notify">
		<div class="notify_row">
			<div>내가 보낸 목록</div>
		</div>
		<%
			for (String to : toList) {
				GymDTO gym = (new GymDAO()).getGym(to);
		%>
		<div class="notify_row">
			<a href="gym의 프로필로"><%=gym.getGym_name()%></a>에게 이력서를 보냈습니다.
		</div>
		<%
			}
		%>
		
		
		<div class="notify_row">
			<div>내가 받은 목록</div>
		</div>
		<%
			for (String from : fromList) {
				GymDTO gym = (new GymDAO()).getGym(from);
		%>
		<div class="notify_row">
			<a href="gym의 프로필로"><%=gym.getGym_name()%></a>에게서 알림이 왔습니다.
		</div>
		<%
			}
		%>
		
	</div>
</body>
</html>