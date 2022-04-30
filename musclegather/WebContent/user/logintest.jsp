<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <link type="text/css" rel="stylesheet" href="/css/default.css" />
    <link type="text/css" rel="stylesheet" href="../css/admin.css" />

    <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../js/default.js"></script>
    <script type="text/javascript">
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

<%
 String user_email = request.getParameter("user_email");
 if (user_email == null){
	 user_email = "";
 }
 %>      

<body>
    <main class="idxMain">
        <section class="indexSection">
            <div class="logofont">
                <h1>login</h1>
            </div>
            
	            <div class="formCell">
	                <form action="logindbtest.jsp" method="POST" id="formtag1">
				
				    <div>
				      <input type="email" name="user_email" id="user_email" value="<%=user_email%>" placeholder="아이디(이메일)">
				    </div>
				    
				    <div>
				 	<input type="password" name="user_pw" id="user_pw" placeholder="비밀번호">
				    </div>
				
				    <div class="checkbox">
				    	<label>
				        	로그인 기억 <input type="checkbox" name="remember" id="remember"> 
				   	 	</label>
				    </div>
				    
				    <div>
				    <button type="submit" id=loginbtn>로그인</button>
				    <button type="button" id=loginbtn onclick="location.href='#'">회원가입</button>
				    </div>
				  </form>
	            </div>
	            <div class="foottext">
	                NUT_EXCEPTION?
	            </div>
        </section>
    </main>
</body>

</html>