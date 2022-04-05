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
	out.print("세션 생성시간 = " + session.getCreationTime() + "초<br>");
	out.print("클라이언트의 해당 세션 마지막 접근시간 = " + session.getLastAccessedTime() + "초<br>");
	out.print("클라이언트의 세션 유지 시간 = " + (session.getLastAccessedTime()-session.getCreationTime()) + "초<br>");
	out.print("세션의 유효시간 = " + session.getMaxInactiveInterval() + "초(매개변수 생략시 30분이 기본)<p>");
	
	session.removeAttribute("cust_id");
	session.removeAttribute("cust_name");
	
	out.print("로그 아웃 하셨습니다.");
%>

<p><a href="login_form.jsp">[로그 인]</a></p>
</body>
</html>