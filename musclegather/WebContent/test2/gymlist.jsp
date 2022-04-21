<%@page import="dao.GymDAO"%>
<%@page import="dto.GymDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
   <%!// 선언문
   String title = "구인 목록";%>
   <!-- CSS only -->
   <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous">


   <div class="alert alert-secondary" role="alert">
      <div class="container">
         <h1 class="display-3">
            <%=title%>
         </h1>
      </div>
   </div>

   <div class="container">
      <div class="row" align="center">
      
      <%
         ArrayList<GymDTO> products = (new GymDAO()).getGymList();
         
         for (GymDTO product : products) {
        	 System.out.println(product.getGym_name());
      %>
      
<%--          <div class="col-md-4">
            <img src="/images/<%=product.getPimage()%>" style="width: 100%">
               <h3><%=product.getPname() %></h3>
               <p><%=product.getPprice() %>원
               <p><a href="productdetail.jsp?pid=<%=product.getPid() %>" class="btn btn-secondary" role="button">상세정보</a>
         </div> --%>

         <div class="col-md-4">
        	 <p>번호 : <%=product.getGym_no()%></p>
        	 <p><a href="gymdetail.jsp?gym_no=<%=product.getUser_no() %>"><%=product.getGym_name() %></a>
        	 <p>이름 : <%=product.getGym_name()%></p>
        	 <p>소개 : <%=product.getGym_content()%></p>
        	 <p>주소 : <%=product.getGym_addr()%></p>
        	 <p>급여 : <%=product.getGym_salary()%></p>
  	</div>

      <% } %>

      </div>
      <hr>
   </div>




   <!-- JavaScript Bundle with Popper -->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"></script>
</body>
</html>