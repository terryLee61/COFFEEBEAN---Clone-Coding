<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
		<script type="text/javascript" src="resources/script/jquery.min.js"></script>


	</head>

	<body>
		<!-- header 시작 -->
		<jsp:include page="header_form"></jsp:include>
		<!-- header 끝 -->

		<section id="wrap">
			<div class="form_wrap">
				<form action="Login" method="post" id="form">
					<!-- <fieldset> -->
					<!-- <legend>로그인</legend> -->
					<label for="id">아이디: </label>
					<input type="text" name="id" id="id" placeholder="아이디">
					<label for="password">패스워드: </label>
					<input type="password" name="password" id="password" placeholder="비밀번호">
					<input type="submit" name="login_btn" id="login_btn" value="로그인" onclick="checkValue()">
					<input type="checkbox" name="check" id="check" value="remember" style="width: 20px; height: 20px;">
					<label for="check">아이디저장</label><br>
					<script>
						// 아이디 저장 함수
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
					</script>
					<!-- </fieldset> -->
				</form>
			</div>
		</section>

		<!-- footer 시작 -->
		<jsp:include page="footer"></jsp:include>
		<!-- footer 끝 -->
		<script>
			function checkValue() {
				var id = document.getElementById("id").value;
				var password = document.getElementById("password").value;

				if (id === "" || password === "") {
					alert("아이디와 비밀번호를 입력하세요.");
					return false; // 폼 제출 중지
				}

				// 유효성 검증에 통과했을 경우
				return true; // 폼 제출 진행
			}

		</script>
	</body>

	</html>