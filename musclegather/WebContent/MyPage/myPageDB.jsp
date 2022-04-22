<%@page import="dao.UserDAO"%>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="dto.UserDTO"/>
<jsp:useBean id="dao" class="dao.UserDAO"/>
<jsp:setProperty property="*" name="user"/>

<%
dao.changeUserInfo(user);
%>