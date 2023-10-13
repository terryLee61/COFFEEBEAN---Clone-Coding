<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- main css -->
<link rel="stylesheet" href="resources/style/main.css">
</head>
<body>
	<!-- header 시작 -->
	<jsp:include page="header"></jsp:include>
	<!-- header 끝 -->
	<section id="wrap">
		<div class="con1">
			<img src="resources/img/main_img.jpg" alt="">
		</div>
		<div class="main_wrap">
			CAROUSEL AREA
		</div>
		<div class="insta_area">
			INSTA AREA
			<h2>#커피빈코리아</h2>
			<ul>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">6</a></li>
				<li><a href="#">7</a></li>
				<li><a href="#">8</a></li>
				<li><a href="#">9</a></li>
				<li><a href="#">10</a></li>
				<li><a href="#">11</a></li>
				<li><a href="#">12</a></li>
			</ul>
		</div>
	</section>
	<!-- footer 시작 -->
	<jsp:include page="footer"></jsp:include>
	<!-- footer 끝 -->
</body>
</html>