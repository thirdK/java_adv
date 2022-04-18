
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="person" class="study.Person" scope="request"/>
<jsp:setProperty property="id" name="person" value="20001234"/>
<jsp:setProperty property="name" name="person" value="홍길동"/>

아이디 : <% out.print(person.getId()); %>
이름 : <% out.print(person.getName()); %>


</body>
</html>