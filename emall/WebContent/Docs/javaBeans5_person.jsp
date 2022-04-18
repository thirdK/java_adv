
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="person" class="study.Person" scope="request"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
아이디 : <%=person.getId() %>
이  름 : <%=person.getName() %>

<%
	person.setId(20182005);
	person.setName("이몽룡");
%>
<jsp:include page="javaBeans4_person.jsp"/>


</body>
</html>