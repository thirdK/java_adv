<%@page import="dao.JoinDAO"%>
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

<body>
	<div class="notify">
		
		<div class="toList">
			<jsp:include page="testpaging1.jsp"/>
		</div>
		<div class="toList">
			<jsp:include page="testpaging2.jsp"/>
		</div>
		
	
		
	</div>
</body>
</html>