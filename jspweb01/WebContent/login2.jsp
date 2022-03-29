<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
		String uid = request.getParameter("id");
	String res = "<h3>User ID : " + uid + "</h3>"; 
	//스크립틀릿은 Servlet처럼 내부에 html사용 가능하다. 어차피 서블릿으로 변환되기 때문
	out.print(res);	//System.out.println(res);
					//JSP에서는 System을 쓰지 않는다. println ln도 사용하지 않는다.
	%>
</body>
</html>