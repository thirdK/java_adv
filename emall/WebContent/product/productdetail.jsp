<%@page import="java.util.StringTokenizer"%>
<%@page import="jdbc.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세정보</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<%@include file="/_header.jsp"%>

	<%!//선언문
	String title = "상품 목록";%>
	<div class="alert alert-secondary" role="alert" id="div-welcome1">
		<div class="container">
			<h1 class="display-3"><%=title%></h1>
		</div>
	</div>
	<%
	String pid = request.getParameter("pid");
	ProductDTO product = (new ProductDAO()).getDetail(pid);
	//DB에서 가져온 정보를 product객체에 담는다.
	
	String test = product.getPimage();
	StringTokenizer st = new StringTokenizer(test, "/");
	//product에서 pimage를 가져온다 
	//pimage는 [이미지 이름] + [구분자 "/"]로 연결되어 있으므로 StringTokenizer로 분리시킨다.
	%>
	
	<div class="container">
		<div class="row">
			<div class="col-ma-5">
				
				<%while(st.hasMoreTokens()){ %>
				
				<!-- StringTokenizer형태인 st객체에 Token이 남아있다면 반복한다. -->
				<img src="/images/<%=st.nextToken()%>"  style="width:100%">
				<!-- 반복되는 코드는 이미지를 차례대로 출력한다. -->
				<%} %>
				
				<div class="col-ma-6">
					<h3><%=product.getPname() %></h3>
					<p><%=product.getPdesc() %></p>	
					<p><b>상품코드 : <%=product.getPid() %></b>			
					<p><b>상품가격 : <%=product.getPprice() %></b>	
					<a href="orderconfirm.jsp?pid=<%=product.getPid()%>&pprice=<%=product.getPprice()%>&pname=<%=product.getPname() %>" class="btn btn-secondary" role="button">상품주문</a>		
					<a href="productlist.jsp" class="btn btn-secondary">상품목록</a>		
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
<%@include file="/_footer.jsp"%>
</body>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>