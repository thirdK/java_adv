<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/*

자바 빈즈 작성 규칙 
1. 클래스를 만들때는 java.io.Serializable 인터페이스를 구현해야한다. //생략가능
2. 인수가 없는 기본 생성자가 있어야 한다.
3. 모든 멤버 변수는 private으로 설정해야 한다.
4. Getter()/Setter()메서드가 모든 변수에 존재 해야한다. 

<jsp:useBean id="member" class="com.dto.MemberBean" scope="page"/>

MemberBean member = (MemberBean) request.getAttribute("member");
if(member == null){
	member = new MemberBean();
	request.setAttribute("member", member);
}

*/
%>

<jsp:useBean id="date" class="java.util.Date"/>
<!-- 자바 빈즈로 Date 클래스를 사용하도록 useBean 액션태그를 작성 -->
<%
	out.print("오늘의 날짜와 시각");	
	//문자열 출력
%>
<%=date %>
<!--  useBean 액션 태그에 id속성값으로 현재 날짜와 시각을 출력하도록 표현문 태그 작성 -->


</body>
</html>