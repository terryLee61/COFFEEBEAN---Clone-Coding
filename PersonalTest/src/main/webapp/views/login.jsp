<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            	<span>로그인</span>
            	<input type="text" name="id" id="id" placeholder="아이디">
            	<input type="password" name="password" id="password" placeholder="비밀번호">
				<input type="submit" name="login_btn" id="login_btn" value="로그인" onclick="checkValue()">
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