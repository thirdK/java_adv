<%
	// DB 연결 종료
	if (rset != null) rset.close();
	if (pstmt != null) pstmt.close();
	if (conn != null) conn.close();
	
%>