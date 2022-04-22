<%@page import="jdbc.OrderDTO"%>
<%@page import="jdbc.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 관리</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<%@ include file="../_header.jsp" %>
<%!//선언문
	String title = "주문 게시판";%>
	<div class="alert alert-secondary" role="alert" id="div-welcome1">
		<div class="container">
			<h1 class="display-3"><%=title%></h1>
		</div>
	</div>

	<div align = "right">
	<a href="orderstatus.jsp?status=1">[입금전]</a> 
	<a href="orderstatus.jsp?status=2">[입금완료]</a> 
	<a href="orderstatus.jsp?status=3">[배송중]</a> 
	<a href="orderstatus.jsp?status=4">[배송완료]</a>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">주문번호</th>
				<th scope="col">제품번호</th>
				<th scope="col">구매자</th>
				<th scope="col">작성일시</th>
				<th scope="col">가격</th>
				<th scope="col">구매일</th>
				<th scope="col">평점</th>
				<th scope="col">후기</th>
				<th scope="col">상태</th>
			</tr>
		</thead>
		<tbody>
		<%
			ArrayList<OrderDTO> orders = (new OrderDAO()).getList();
			for(OrderDTO order : orders){
		%>
		<tr>
				<th scope="row"><%=order.getOid() %></th>
				<td><%=order.getOpid() %></td>
				<td><%=order.getOuid() %></td>
				<td><%=order.getOpname() %></td>
				<td><%=order.getOprice() %></td>
				<td><%=order.getOdate() %></td>
				<td><%=order.getOgrade() %></td>
				<td><%=order.getOcomm() %></td>
				<td><a href="orderdelivery.jsp?oid=<%=order.getOid()%>>">[발송]</a></td>
			</tr>
		<%} %>
		
			
			
		</tbody>

	</table>
<%@ include file="../_footer.jsp" %>
</body>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>