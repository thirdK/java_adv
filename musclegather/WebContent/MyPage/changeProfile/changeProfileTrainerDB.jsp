<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String user_no = request.getParameter("user_no");//세션 써도 될듯?
String trainer_title = request.getParameter("trainer_title");
String trainer_content = request.getParameter("trainer_content");
String trainer_secret = request.getParameter("trainer_secret");
String trainer_addr = request.getParameter("trainer_addr");
String trainer_images;

System.out.println(user_no);
System.out.println(trainer_title);
System.out.println(trainer_content);
System.out.println(trainer_secret);
System.out.println(trainer_addr);
%>