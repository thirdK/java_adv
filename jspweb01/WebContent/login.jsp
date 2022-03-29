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
//이 영역은 자바 영역이다.
String uid = request.getParameter("id");
String upw = request.getParameter("password");
%>

<h3>User ID : <%=uid %></h3>
<h3>User PS : <%=upw %></h3>
<h5>by 32임태종</h5>
</body>
</html>