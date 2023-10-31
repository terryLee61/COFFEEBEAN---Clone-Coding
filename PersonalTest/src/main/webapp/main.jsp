<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<!-- main css -->
			<link rel="stylesheet" href="resources/style/main.css">

			<!-- Stylesheets -->
			<link href='https://fonts.googleapis.com/css?family=Lato:300,400,700,400italic,300italic' rel='stylesheet'
				type='text/css'>
			<!-- <link rel="stylesheet" href="resources/style/docs.theme.min.css"> -->

			<script type="text/javascript" src="resources/script/jquery.min.js"></script>
			<script type="text/javascript" src="resources/script/slick.min.js"></script>

			<link rel="stylesheet" href="resources/style/slick.css" />
			<link rel="stylesheet" href="resources/style/slick-theme.css" />



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
								<span class="ori_price">15,000원</span>
								<span class="fixed_price">12,000원</span>
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
								<span class="ori_price">12,000원</span>
								<span class="fixed_price">9,000원</span>
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
								<span class="ori_price">18,000원</span>
								<span class="fixed_price">15,000원</span>
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
								<span class="ori_price">21,000원</span>
								<span class="fixed_price">18,000원</span>
							</p>
							</a>
						</div>
					</div>
					<h2 class="main_title">What's new</h2>
					<div class="promotion_slide">
						<div class="slide_box">
							<div class="autoplay">
								<div><img src="resources/img/coffee.jpg" alt="">1</div>
								<div><img src="resources/img/coffee2.jpg" alt="">2</div>
								<div><img src="resources/img/coffee3.jpg" alt="">3</div>
								<div><img src="resources/img/coffee.jpg" alt="">4</div>
								<div><img src="resources/img/coffee2.jpg" alt="">5</div>
								<div><img src="resources/img/coffee3.jpg" alt="">6</div>
								<div><img src="resources/img/coffee.jpg" alt="">7</div>
								<div><img src="resources/img/coffee2.jpg" alt="">8</div>
								<div><img src="resources/img/coffee3.jpg" alt="">9</div>
							</div>
							<span class="control-buttons">
								<button type="button" class="play">재생</button>
								<button type="button" class="stop">정지</button>
							</span>
						</div>
					</div>
					<script>
						$(document).ready(function () {

							$('.autoplay').slick({
								slidesToShow: 3,
								slidesToScroll: 3,
								autoplay: true,
								autoplaySpeed: 2000,
								dots: true
							});


							// 재생/정지 버튼 컨트롤
							$('.play').click(function () {
								$('.autoplay').slick('slickPlay');
							});
							$('.stop').click(function () {
								$('.autoplay').slick('slickPause');
							});

							// ".control-buttons" 내의 버튼을 ".slick-dots" 클래스 내로 이동
							var controlButtons = $('.control-buttons');
							controlButtons.appendTo('.slick-dots');
						});
					</script>
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