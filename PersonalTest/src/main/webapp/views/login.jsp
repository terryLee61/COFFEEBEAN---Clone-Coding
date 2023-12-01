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
				
					<!-- </fieldset> -->
				</form>
			</div>
		</section>

		<!-- footer 시작 -->
		<jsp:include page="footer"></jsp:include>
		<!-- footer 끝 -->
	
	</body>
<script src="resources/script/login.js"></script>
	</html>