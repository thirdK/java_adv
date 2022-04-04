<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward 액션태그</title>
</head>
<body>
<b>forward 액션태그</b>
<br>
<%
	String msg = "forward 액션태그 테스트";
%>

<jsp:forward page="inc_sum_for.jsp"/>
<p>forward 액션태그</p>
메세지 출력 : <%=msg %>
</body>
</html>