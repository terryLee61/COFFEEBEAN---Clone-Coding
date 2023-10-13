$('#id').on('change', e => {
	const id = $('#id').val();

	if (id !== "") {
		$('#error-pid').hide();
	}
});

$('#password').on('change', e => {
	const pwd = $('#password').val();

	if (pwd !== "") {
		$('#error-password').hide();
	}
});

function checkValue(htmlform) {
	const id = htmlform.id.value;
	const password = htmlform.password.value;

	if (id === "") {
		alert("아이디를 입력하세요.");
		htmlform.id.focus();
		return false; // 폼 제출을 중지합니다.
	} else if (password === "") {
		alert("비밀번호를 입력하세요.");
		htmlform.password.focus();
		return false; // 폼 제출을 중지합니다.
	} else {
		alert("성공입니다.")
		return true;
	}

	/*if(check === true) {		
		alert("로그인에 성공했습니다.");
		htmlform.submit();
	}*/
}