<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a id="custom-login-btn" href="javascript:kakaoLogin()" >
  <img
    src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
    width="222"
    alt="카카오 로그인 버튼"/>
</a>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	Kakao.init("f706e0719e45256070f1d933f2e70af4");
	function kakaoLogin(){
		window.Kakao.Auth.login({
			scope:'profile_nickname, account_email, gender, birthday',
			success : function(authObj) {
				console.log(authObj);
				window.Kakao.API.request({
					url:'/v2/user/me',
					success: res => {
						const kakaoAccount = res.kakao_account;
						location.href='kakaologindb.jsp?gender=' + kakaoAccount.gender
								+ '&birthday='+kakaoAccount.birthday
								+ '&email='+kakaoAccount.email
								+ '&nickname='+kakaoAccount.profile.nickname;
 						console.log(kakaoAccount);
						alert("로그인 성공")
					}
				})
			}
		});
	}
</script>
</body>
</html>