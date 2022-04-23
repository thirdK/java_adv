<%@page import="dao.UserDAO"%>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//세션으로 처리하기
String user_no = "2";
String pw = request.getParameter("user_pw");
UserDAO dao = new UserDAO();

if(dao.checkPw(user_no, pw)){
	dao.deleteUserInfo(user_no);
%>
	<script type="text/javascript">
	(function(){
		alert("회원탈퇴가 완료되었습니다.");
		//홈페이지로 이동시키기
	})();
	</script>
<%
} else {
%>
<script type="text/javascript">
	(function(){
		alert("비밀번호가 일치하지 않습니다.");
		history.back();
	})();
	</script>
<%
}
%>

<script type="text/javascript">
	function Success(){
		alert("회원탈퇴가 완료되었습니다.");
	};
	function fail(){
		alert("비밀번호가 일치하지 않습니다.");
	};
</script>