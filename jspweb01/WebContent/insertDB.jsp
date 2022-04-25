<%@page import="jdbc.StudentDAO"%>
<%@page import="jdbc.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%

String no = request.getParameter("no");
String dept = request.getParameter("dept");
String name = request.getParameter("name");
String addr = request.getParameter("addr");
String phone = request.getParameter("phone");
System.out.println(no);

	StudentDAO dao = new StudentDAO();
	if(dao.insert(no, dept, name, addr, phone)){
		response.sendRedirect("insert_process.jsp");
	}
%>