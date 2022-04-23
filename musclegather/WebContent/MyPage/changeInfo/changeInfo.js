

/**
 * 회원가입 유효성 검사
 */

var form = document.frm; // name이 frm인 form을 가져옴
var flag = false;

function check() {
	// value는 일반적으로는 해당 이름이 가진 값을 가져오지만
	// 조건식 안에서는 값이 존재하면 true 없으면 false를 반환한다

	if (!form.user_name.value) {
		alert("이름을 입력해주세요.");
		form.user_name.focus();
		return;
	}

	if (!form.user_password.value) {
		alert("비밀번호를 입력해주세요");
		form.user_password.focus();
		return;
	}
	
	if (!form.user_phone1.value || !form.user_phone2.value || !form.user_phone3.value) {
		alert("휴대폰 번호를 입력해주세요");
		form.user_phone2.focus();
		return;
	}
	
	if (!form.user_addr.value) {
		alert("주소를 입력해주세요");
		form.user_addr.focus();
		return;
	}
	

	// 비밀번호 변경 칸에 값이 있으면(비밀번호를 변경하려고 하면) 실행됨
	if (frm.user_password_change.value) {
		// 8자리 이상, 소문자, 숫자, 특수문자 모두 포함되어 있는 지 검사
		let reg = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*?-]).{8,}$/;
		let hangleCheck = /[ㄱ-ㅎ | ㅏ-ㅣ |가-힣]/
		if (!reg.test(form.user_password_change.value)) {
			alert("변경하려는 비밀번호는 8자리 이상이어야 하며, 영문/숫자/특수문자(!@#$%^&*?-+) 모두 포함해야 합니다.");
			form.user_password_change.focus();
			return;
		}
		// 같은 문자를 4번 사용할 수 없다.
		if (/(\w)\1\1\1/.test(form.user_password_change.value)) {
			alert("변경하려는 비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다.");
			form.user_password_change.focus();
			return;
		}


		// 비밀번호에 한글이 있으면 안된다.
		if (hangleCheck.test(form.user_password_change.value)) {
			alert("변경하려는 비밀번호에 한글을 사용할 수 없습니다.");
			form.user_password_change.focus();
			return;
		}

		// 비밀번호에 공백을 포함할 수 없다.
		if (form.user_password_change.value.search(/\s/) != -1) {
			alert("변경하려는 비밀번호에 공백 없이 입력해주세요.");
			form.user_password_change.focus()
			return;
		}

		if (form.user_password_change.value != form.user_password_change_r.value) {
			alert("변경하려는 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			form.user_password_change.focus();
			return;
		}
		flag = true;
	}
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "pw_ok.jsp?pw="
			+ document.getElementById("input-user_password").value + "&no="
			+ document.getElementById("input-user_no").value, true);
	xhr.send();

	xhr.onreadystatechange = function() {
		if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
			console.log(xhr.responseText);
			document.getElementById("result").innerHTML = xhr.responseText.trim();

			if (xhr.responseText.search("합") != -1 && !form.user_password_change.value && !form.user_password_change_r.value) {
				form.submit();
			} else if(xhr.responseText.search("합") != -1 && flag){
				form.submit();
			}
		}
	}
}
/*
function checkPw() {
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "pw_ok.jsp?pw="
			+ document.getElementById("input-user_password").value + "&no="
			+ document.getElementById("input-user_no").value, true);
	xhr.send();

	xhr.onreadystatechange = function() {
		if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
			console.log(xhr.responseText);
			document.getElementById("result").innerHTML = xhr.responseText.trim();

			if (xhr.responseText.search("합") != -1 && !form.user_password_change.value && !form.user_password_change_r.value) {
				form.submit();
			}
		}
	}
}
*/

function combineInfo(){
	var phone = form.user_phone1.value +"-"+ form.user_phone2.value + "-" +form.user_phone3.value;
	document.getElementById('input-phone').setAttribute('value', phone);
	if(form.user_password_change.value){
		var pw = form.user_password_change.value;
	}else {
		var pw = form.user_password.value;
	}
	document.getElementById('input-pw').setAttribute('value', pw);
}