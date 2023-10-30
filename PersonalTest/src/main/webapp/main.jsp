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

 <!-- Stylesheets -->
 <link href='https://fonts.googleapis.com/css?family=Lato:300,400,700,400italic,300italic' rel='stylesheet' type='text/css'>
 <link rel="stylesheet" href="resources/style/docs.theme.min.css">

 <!-- Owl Stylesheets -->
 <!-- <link rel="stylesheet" href="resources/style/owl.carousel.min.css"> -->
 <!-- 슬라이드 하단 dot -->
 <!-- <link rel="stylesheet" href="resources/style/owl.theme.default.min.css"> -->

    <!-- javascript -->
    <!-- <script src="resources/script/jquery.min.js"></script> -->
    <!-- <script src="resources/script/owl.carousel.js"></script> -->

<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Carousel CSS 추가 -->
<link rel="stylesheet" type="text/css" href="resources/style/carousel.css">

<!-- Carousel JavaScript 추가 -->
<script src="resources/script/carousel.js"></script>

</head>
<body>
	<!-- header 시작 -->
	<jsp:include page="header"></jsp:include>
	<!-- header 끝 -->
	<section id="wrap">
		<div class="con1">
			<a href="#"><img src="resources/img/main_img.jpg" alt=""></a>
		</div>
		<div class="main_wrap">
			<h2 class="main_title">MD's Pick</h2>
				<div class="product_slide">
					<div class="product_list">
						<!-- 제품사진 -->
						<p class="photo">
						<a href="#">
							<img src="resources/img/coffee.jpg" alt="">
							<!-- 제품설명 -->
						</p>
							<p class="txt_box">
								<span class="name">제품설명1</span>
								<span class="date">유통기한: </span>
								<span class="ori_price">제품가격1</span>
								<span class="fixed_price">제품가격2</span>
							</p>
						</a>
					</div>
					<div class="product_list">
						<!-- 제품사진 -->
						<p class="photo">
						<a href="#">
							<img src="resources/img/coffee.jpg" alt="">
							<!-- 제품설명 -->
						</p>
							<p class="txt_box">
								<span class="name">제품설명1</span>
								<span class="date">유통기한: </span>
								<span class="ori_price">제품가격1</span>
								<span class="fixed_price">제품가격2</span>
							</p>
						</a>
					</div>
					<div class="product_list">
						<!-- 제품사진 -->
						<p class="photo">
						<a href="#">
							<img src="resources/img/coffee.jpg" alt="">
							<!-- 제품설명 -->
						</p>
							<p class="txt_box">
								<span class="name">제품설명1</span>
								<span class="date">유통기한: </span>
								<span class="ori_price">제품가격1</span>
								<span class="fixed_price">제품가격2</span>
							</p>
						</a>
					</div>
					<div class="product_list">
						<!-- 제품사진 -->
						<p class="photo">
						<a href="#">
							<img src="resources/img/coffee.jpg" alt="">
							<!-- 제품설명 -->
						</p>
							<p class="txt_box">
								<span class="name">제품설명1</span>
								<span class="date">유통기한: </span>
								<span class="ori_price">제품가격1</span>
								<span class="fixed_price">제품가격2</span>
							</p>
						</a>
					</div>
				</div>
			<h2 class="main_title">What's new</h2>
				<div class="promotion_slide">
					<div class="slide_box">
						<ul class="slide_container">
							<li class="silde_con"><img src="resources/img/coffee.jpg" alt="">1</li>
							<li class="silde_con"><img src="resources/img/coffee2.jpg" alt="">2</li>
							<li class="silde_con"><img src="resources/img/coffee3.jpg" alt="">3</li>
							<li class="silde_con"><img src="resources/img/coffee.jpg" alt="">4</li>
							<li class="silde_con"><img src="resources/img/coffee2.jpg" alt="">5</li>
							<li class="silde_con"><img src="resources/img/coffee3.jpg" alt="">6</li>
						</ul>
					</div>
				</div>
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