// 아이디 저장 함수 (수정중)
function saveId() {
    var checkbox = document.getElementById("check");
    var idInput = document.getElementById("id");

    if (checkbox.checked) {
        var idValue = idInput.value;
        var now = new Date();
        var expirationDate = new Date(now.getTime() + (365 * 24 * 60 * 60 * 1000)); // 쿠키 만료 날짜를 현재 시간으로부터 1년 뒤로 설정

        document.cookie = "savedId=" + idValue + "; expires=" + expirationDate.toUTCString(); // 쿠키에 저장
    } else {
        document.cookie = "savedId=; expires=Thu, 01 Jan 1970 00:00:00 GMT"; // 저장된 쿠키 삭제
    }
}


// 쿠키 값 가져오기
function getCookieValue(cookies, name) {
    var cookieName = name + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var cookieArray = decodedCookie.split(';');

    for (var i = 0; i < cookieArray.length; i++) {
        var cookie = cookieArray[i].trim();
        if (cookie.indexOf(cookieName) === 0) {
            return cookie.substring(cookieName.length, cookie.length);
        }
    }
    return "";
}

// 아이디 비밀번호 입력 alert

function checkValue() {
    var id = document.getElementById("id").value;
    var password = document.getElementById("password").value;

    if (id === "" || password === "") {
        alert("아이디와 비밀번호를 입력하세요.");
        return false;
    }

    return true; 
}