<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id = "person" class="study.Person" scope="request"/>

아이디 : <jsp:getProperty property="id" name="person"/>
이름 : <jsp:getProperty property="name" name="person"/>
</body>
</html>