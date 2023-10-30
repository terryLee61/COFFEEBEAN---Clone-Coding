<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/style/form.css">

</head>
<body>
 <!-- header 시작 -->
	<jsp:include page="header_form"></jsp:include>
    <!-- header 끝 -->
    
    <section id="wrap">
        <!-- 회원가입 폼 -->
        <div class="form_wrap">
            <form action="Join" method="post" id="form">
            	<h1>회원가입</h1>
            
                <!-- 아이디 -->
                <span>아이디: </span>
                <input type="text" name="id" id="id" placeholder="아이디">
                
                <!-- 비밀번호 -->
                <span>비밀번호: </span>
                <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요.">
                
                <!-- 이름 -->
                <span>이름: </span>
				<input type="text" name="name" id="name">
                
                <!-- 이메일 -->
                <span>이메일: </span>
                <input type="text" name="email" id="email">
                
                <input type="submit" value="가입">
            </form>
        </div>
    </section>
    
   <!-- footer 시작 -->
	<jsp:include page="footer"></jsp:include>
	<!-- footer 끝 -->
	
</body>
</html>