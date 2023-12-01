<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>홈ㅣCOFFEE BEAN KOREA</title>
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
			<!-- favicon -->
			<link rel="shortcut icon" href="resources/img/favicon.png">
			
			
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
					<!-- <div class="product_slide_wrap"> -->
					<div class="product_slide">
						<div class="product_list">
							<!-- 제품사진 -->
							<a href="#">
								<p class="photo">
									<img src="resources/img/coffee.jpg" alt="">
									<!-- 제품설명 -->
								</p>
								<p class="txt_box">
									<span class="name">제품설명1</span>
									<span class="date">유통기한: 2024-08-27</span>
									<span class="ori_price">15,000원</span>
									<span class="fixed_price">12,000원</span>
								</p>
							</a>
							<button class="quickView">QUICKVIEW</button>



						</div>
						<div class="product_list">
							<!-- 제품사진 -->
							<a href="#">
								<p class="photo">
									<img src="resources/img/coffee.jpg" alt="">
									<!-- 제품설명 -->
								</p>
								<p class="txt_box">
									<span class="name">제품설명2</span>
									<span class="date">유통기한: 2025-12-12</span>
									<span class="ori_price">12,000원</span>
									<span class="fixed_price">9,000원</span>
								</p>
							</a>
							<button class="quickView">QUICKVIEW</button>

						</div>
						<div class="product_list">
							<!-- 제품사진 -->
							<a href="#">
								<p class="photo">
									<img src="resources/img/coffee.jpg" alt="">
									<!-- 제품설명 -->
								</p>
								<p class="txt_box">
									<span class="name">제품설명3</span>
									<span class="date">유통기한: 2023-10-11</span>
									<span class="ori_price">18,000원</span>
									<span class="fixed_price">15,000원</span>
								</p>
							</a>
							<button class="quickView">QUICKVIEW</button>

						</div>
						<div class="product_list">
							<!-- 제품사진 -->
							<a href="#">
								<p class="photo">
									<img src="resources/img/coffee.jpg" alt="">
									<!-- 제품설명 -->
								</p>
								<p class="txt_box">
									<span class="name">제품설명4</span>
									<span class="date">유통기한: 2030-01-22</span>
									<span class="ori_price">21,000원</span>
									<span class="fixed_price">18,000원</span>
								</p>
							</a>
							<button class="quickView">QUICKVIEW</button>

						</div>
					</div>

					<!-- </div> -->
					<h2 class="main_title">What's new</h2>
					<div class="promotion_slide">
						<div class="slide_box">
							<div class="autoplay">
								<div>
									<a href="#">
										<img src="resources/img/coffee.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Spring</span>
										</p>
									</a>
								</div>
								<div>
									<a href="#"><img src="resources/img/coffee2.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Summer</span>
										</p>
									</a>
								</div>
								<div>
									<a href="#"><img src="resources/img/coffee3.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Fall</span>
										</p>
									</a>
								</div>
								<div>
									<a href="#"><img src="resources/img/coffee.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Winter</span>
										</p>
									</a>
								</div>
								<div>
									<a href="#"><img src="resources/img/coffee2.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Spring</span>
										</p>
									</a>
								</div>
								<div>
									<a href="#"><img src="resources/img/coffee3.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Summer</span>
										</p>
									</a>
								</div>
								<div>
									<a href="#"><img src="resources/img/coffee.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Fall</span>
										</p>
									</a>
								</div>
								<div>
									<a href="#"><img src="resources/img/coffee2.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Winter</span>
										</p>
									</a>
								</div>
								<div>
									<a href="#"><img src="resources/img/coffee3.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Spring</span>
										</p>
									</a>
								</div>
							</div>
							<span class="control-buttons">
								<button type="button" class="play">재생</button>
								<button type="button" class="stop">정지</button>
							</span>
						</div>
					</div>
					
				</div>
				<div class="insta_area">
					<h2>#커피빈카피</h2>
					<ul>
						<li><a href="#"><img src="resources/img/coffee.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee2.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee3.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee2.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee3.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee2.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee3.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee2.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee3.jpg" alt=""></a></li>
					</ul>
					<a class="insta_area_btn" href="#">OUR INSTAGRAM - @#</a>
					<!-- <div class="overlayDiv3">배경
						<button id="close_pop"></button>
					</div> -->
				</div>
				
			</section>
			<!-- footer 시작 -->
			<jsp:include page="footer"></jsp:include>
			<!-- footer 끝 -->
		</body>
	<script src="resources/script/main.js"></script>
		</html>