<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! 
String str = "Hello JSP";

String getString(String data){
	return data;
}
%>
<h1>결과 : <%=getString(str)%></h1>

</body>
</html>