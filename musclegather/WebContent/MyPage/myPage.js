//주소찾기 API의 함수
function execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을
						// 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("sample6_extraAddress").value = extraAddr;

					} else {
						document.getElementById("sample6_extraAddress").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample6_detailAddress").focus();
				}
			}).open();
}

/**
 * 회원가입 유효성 검사
 */

var flag = false;
var form = document.frm; // name이 frm인 form을 가져옴
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
	
	if (!form.user_password.value) {
		alert("비밀번호를 입력해주세요");
		form.user_password.focus();
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
	}
	
	var phone = form.user_phone1.value +"-"+ form.user_phone2.value + "-" +form.user_phone3.value;
	document.getElementById('input-phone').setAttribute('value', phone);
	if(form.user_password_change.value){
		var pw = form.user_password_change.value;
	}else {
		var pw = form.user_password.value;
	}
	document.getElementById('input-pw').setAttribute('value', pw);
	
	form.submit();
}

function checkPw() {
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "pw_ok.jsp?pw="
			+ document.getElementById("input-user_password").value + "&no="
			+ document.getElementById("input-user_no").value, true);
	xhr.send();

	xhr.onreadystatechange = function() {
		if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
			console.log(xhr.responseText);
			document.getElementById("result").innerHTML = xhr.responseText
					.trim();

			if (xhr.responseText.search("합") != -1 && !form.user_password_change.value && !form.user_password_change_r.value) {
				form.submit();
			}
		}
	}
}