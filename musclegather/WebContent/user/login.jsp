<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
<title>로그인</title>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script>
$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = getCookie("userInputId");
    $("input[id='user_email']").val(userInputId); 
     
    if($("input[id='user_email']").val() != ""){ 
       // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#remember").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#remember").change(function(){ // 체크박스에 변화가 있다면,
        if($("#remember").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[id='user_email']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[id='user_email']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#remember").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[id='user_email']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
 
    //쿠키를 위한 함수 
    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays==null)?"":";expires="+exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }
     
    function deleteCookie(cookieName){
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }
     
    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }
});
</script>
</head>

 <body class="text-center">
   <!-- CSS only -->
		<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous">
 
 <%
 String user_email = request.getParameter("user_email");
 if (user_email == null){
	 user_email = "";
 }
 %>      
      
          
<main class="form-signin">
  <form action="logindb.jsp" method="POST">
    <h1 class="h3 mb-3 fw-normal">로그인🔑</h1>

    <div class="form-floating">
      <input type="email" name="user_email" class="form-control" id="user_email" value="<%=user_email%>">
      <label for="floatingInput">이메일</label>
    </div>
    <div class="form-floating">
      <input type="password" name="user_pw" class="form-control" id="floatingPassword">
      <label for="floatingPassword">비밀번호</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" name="remember" id="remember"> 로그인 기억
      </label>
    </div>
    
    <div>
    <button class="w-100 btn btn-lg btn-dark" type="submit" id=loginbtn>로그인</button>
    </div>
    
    <div>
    <button class="w-100 btn btn-lg btn-dark" type="submit" id=loginbtn onclick="location.href='#'">회원가입</button>
    </div>
    <a href="/MyPage/changeInfo/changeInfo.jsp">aa</a>
  </form>
</main>




   <!-- JavaScript Bundle with Popper -->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"></script>




    
  </body>
</html>