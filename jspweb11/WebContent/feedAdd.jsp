<%@page import="DAO.FeedDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<%
FeedDAO dao = new FeedDAO();
String uid = request.getParameter("uid");
String ucon = request.getParameter("ucon");
if(dao.insert(uid, ucon)){
	response.sendRedirect("main.jsp");
} else {
	out.print("글 작성중 에러 발생");
}
%>