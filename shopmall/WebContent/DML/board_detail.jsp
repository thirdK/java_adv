<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "dbconnclose.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 보기</title>
</head>
<body>
<%
int id = Integer.parseInt(request.getParameter("id"));
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rset = null;
conn = DbConnClose.getConnection();
String sql = "SELECT * FROM board WHERE (board_id = ?)";
pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,id);
rset = pstmt.executeQuery();
rset.next();
String board_id = rset.getString("board_id");
String board_name = rset.getString("board_name");
String board_title = rset.getString("board_title");
String board_content = rset.getString("board_content");
String board_join_date = rset.getString("board_join_date");
%>

<table>
<caption>게시판 상세보기</caption>

<tr>
<th>&nbsp; 이름  &nbsp;</th>
<td><%=board_name %></td>
</tr>
<tr>
<th>&nbsp; 제목 &nbsp;</th>
<td><%=board_title %></td>
</tr>
<tr>
<th>&nbsp;내용&nbsp;</th>
<td><%=board_content %>
</td>
</tr>
<tr>
<th>&nbsp;작성일&nbsp;</th>
<td><%=board_join_date %>
</td>
</tr>

</table>


</body>
</html>