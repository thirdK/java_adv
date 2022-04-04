<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 지시문</title>
</head>
<body>
<%@ include file="header.jsp" %>
<p>include 지시문</p>
<%@ include file="inc_sum_for.jsp" %>
<%
	sum+=4;
%>
<br>
<%=sum %>

<%@ include file="footer.jsp" %>
</body>
</html>