<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 삭제</title>
</head>
<body>

<h3>세션 속성 확인</h3>
세션 아이디 : <%=session.getAttribute("id") %> <br>
세션 네임 : <%=session.getAttribute("name") %> <br>

<%
	session.removeAttribute("id");
	session.removeAttribute("name");
	out.print("세션 속성을 삭제하였습니다.");
%>

<h3>세션 속성 확인</h3>
세션 아이디 : <%=session.getAttribute("id") %> <br>
세션 네임 : <%=session.getAttribute("name") %> <br>

<p><a href="session_create.jsp">[세션 생성]</a></p>
<p><a href="session_check.jsp">[세션 확인]</a></p>
</body>
</html>