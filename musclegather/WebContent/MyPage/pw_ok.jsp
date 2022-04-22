<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="dao.UserDAO" id="dao"/>
<%
	String pw = request.getParameter("pw");
	String no = request.getParameter("no");
	if(dao.checkPw(no, pw)){
		out.print("비밀번호가 일치합니다.");
	} else{
		out.print("비밀번호가 일치하지 않습니다.");
	}
%>