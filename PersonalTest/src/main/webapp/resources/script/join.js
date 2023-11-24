// 아이디 중복체크
var idCheck = false;

// 이메일 인증 여부
var AuthChk = false;

// 아이디 중복체크
function checkIdDuplicate() {
    var memberId = document.getElementById("id").value;

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "IdDup", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.isDuplicate) {
                alert("이미 존재하는 아이디 입니다.")
            } else if (memberId == "") {
                alert("아이디를 입력하세요.")
            } else {
                alert("사용할 수 있는 아이디 입니다.")
                idCheck = true; // 중복체크 완료 후 플래그를 true로 설정
            }
        }
    };
    xhr.send("id=" + encodeURIComponent(memberId));
}




// 이메일 중복체크
function checkEmailDuplicate() {
    var memberEmail = document.getElementById("email").value;

    // HTML5에서 제공하는 이메일 유효성 검사
    if (document.getElementById("email").validity.valid) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "EmailDup", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                if (response.isDuplicate) {
                    alert("이미 존재하는 이메일 입니다.")
                    console.log("email:" + memberEmail);
                } else if (memberEmail == "") {
                    alert("이메일을 입력하세요")
                } else {
                    console.log("email:" + memberEmail);
                    alert("사용할 수 있는 이메일 입니다.")
                }
            }
        };
        xhr.send("email=" + encodeURIComponent(memberEmail));
    } else {
        alert("유효하지 않은 이메일 형식입니다.");
    }
}

// 이메일 인증 전송
function sendEmailAuth() {
    var recipientEmail = document.getElementById("email").value; // 이메일 주소 가져오기

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "SendEmail", true); // SendEmail은 이메일을 보내는 서블릿 URL입니다. 해당 URL을 실제로 사용하는 서블릿으로 변경해야 합니다.
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                alert("이메일을 성공적으로 보냈습니다.");
            } else {
                alert("이메일 보내기에 실패했습니다.");
            }
        }
    };
    xhr.send("recipientEmail=" + encodeURIComponent(recipientEmail));
}

// 이메일 인증번호 입력
function checkEmailAuth() {
    var enteredCode = document.getElementById("email_num").value; // 사용자가 입력한 인증번호

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "ChkEmail", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.isValid) {
                AuthChk = true;
                alert("인증되었습니다.");
                // 인증 성공 시 수행할 작업을 여기에 추가하세요
            } else {
                alert("인증번호가 일치하지 않습니다.");
            }
        }
    };
    xhr.send("enteredCode=" + encodeURIComponent(enteredCode));
}


    // 여기서 이메일 인증 여부를 확인하고, 인증을 하지 않았다면 가입을 막을 수 있습니다.
    if (idCheck && !AuthChk) { // 아이디 중복체크 완료 후, 이메일 인증을 하지 않은 경우
        // 이벤트를 막고, 이메일 인증을 수행합니다.
        event.preventDefault();
        alert('이메일을 인증해 주세요.')
    }

// 가입 버튼 클릭 시 실행되는 함수
document.getElementById('form').addEventListener('submit', function (event) {
    if (!idCheck) { // 아이디 중복체크가 실행되지 않은 경우
        event.preventDefault(); // 이벤트 막기
        alert('아이디 중복을 확인해 주세요.');
    } else if (!AuthChk) { // 아이디 중복체크가 완료되었으나 이메일 인증을 하지 않은 경우
        event.preventDefault(); // 이벤트 막기
        alert('이메일을 인증해 주세요.');
    }
});


// 이메일 인증 API

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;

                document.getElementById("engAddress").value = data.addressEnglish;

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if (roadAddr !== '') {
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if (data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if (data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }


    // 주소를 합치고 값을 전달하는 함수
    function combineAddress() {
        var roadAddress = document.getElementById("roadAddress").value;
        var detailAddress = document.getElementById("detailAddress").value;

        // roadAddress와 detailAddress를 합쳐 address 필드에 설정
        var address = roadAddress + ' ' + detailAddress;
        document.getElementById("address").value = address;
    }

    // 가입 버튼 클릭 시 실행되는 함수
    document.getElementById('form').addEventListener('submit', function (event) {
        // 주소를 합치는 함수 호출
        combineAddress();
    });