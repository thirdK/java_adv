<%@page import="dto.ChatDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dao" class="dao.ChatDAO"/>
<jsp:useBean id="dto" class="dto.ChatDTO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	out.print(dao.findChatRoom("2"));
	ArrayList<ChatDTO> chats = dao.getChatList("1");
	for(ChatDTO chat : chats){
		out.print(chat.getChat_content());
		out.print("<br>");
	}
%>
</body>
</html>